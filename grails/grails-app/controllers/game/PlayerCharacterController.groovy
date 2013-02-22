package game

import org.springframework.dao.DataIntegrityViolationException

class PlayerCharacterController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [playerCharacterInstanceList: PlayerCharacter.list(params), playerCharacterInstanceTotal: PlayerCharacter.count()]
    }

    def create() {
        [playerCharacterInstance: new PlayerCharacter(params)]
    }

    def save() {
        def playerCharacterInstance = new PlayerCharacter(params)
        if (!playerCharacterInstance.save(flush: true)) {
            render(view: "create", model: [playerCharacterInstance: playerCharacterInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'playerCharacter.label', default: 'PlayerCharacter'), playerCharacterInstance.id])
        redirect(action: "show", id: playerCharacterInstance.id)
    }

    def show(Long id) {
        def playerCharacterInstance = PlayerCharacter.get(id)
        if (!playerCharacterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'playerCharacter.label', default: 'PlayerCharacter'), id])
            redirect(action: "list")
            return
        }

        [playerCharacterInstance: playerCharacterInstance]
    }

    def edit(Long id) {
        def playerCharacterInstance = PlayerCharacter.get(id)
        if (!playerCharacterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'playerCharacter.label', default: 'PlayerCharacter'), id])
            redirect(action: "list")
            return
        }

        [playerCharacterInstance: playerCharacterInstance]
    }

    def update(Long id, Long version) {
        def playerCharacterInstance = PlayerCharacter.get(id)
        if (!playerCharacterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'playerCharacter.label', default: 'PlayerCharacter'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (playerCharacterInstance.version > version) {
                playerCharacterInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'playerCharacter.label', default: 'PlayerCharacter')] as Object[],
                          "Another user has updated this PlayerCharacter while you were editing")
                render(view: "edit", model: [playerCharacterInstance: playerCharacterInstance])
                return
            }
        }

        playerCharacterInstance.properties = params

        if (!playerCharacterInstance.save(flush: true)) {
            render(view: "edit", model: [playerCharacterInstance: playerCharacterInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'playerCharacter.label', default: 'PlayerCharacter'), playerCharacterInstance.id])
        redirect(action: "show", id: playerCharacterInstance.id)
    }

    def delete(Long id) {
        def playerCharacterInstance = PlayerCharacter.get(id)
        if (!playerCharacterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'playerCharacter.label', default: 'PlayerCharacter'), id])
            redirect(action: "list")
            return
        }

        try {
            playerCharacterInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'playerCharacter.label', default: 'PlayerCharacter'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'playerCharacter.label', default: 'PlayerCharacter'), id])
            redirect(action: "show", id: id)
        }
    }
}
