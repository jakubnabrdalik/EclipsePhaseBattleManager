package game

import org.springframework.dao.DataIntegrityViolationException

class NonPlayerCharacterController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [nonPlayerCharacterInstanceList: NonPlayerCharacter.list(params), nonPlayerCharacterInstanceTotal: NonPlayerCharacter.count()]
    }

    def create() {
        [nonPlayerCharacterInstance: new NonPlayerCharacter(params)]
    }

    def save() {
        def nonPlayerCharacterInstance = new NonPlayerCharacter(params)
        if (!nonPlayerCharacterInstance.save(flush: true)) {
            render(view: "create", model: [nonPlayerCharacterInstance: nonPlayerCharacterInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'nonPlayerCharacter.label', default: 'NonPlayerCharacter'), nonPlayerCharacterInstance.id])
        redirect(action: "show", id: nonPlayerCharacterInstance.id)
    }

    def show(Long id) {
        def nonPlayerCharacterInstance = NonPlayerCharacter.get(id)
        if (!nonPlayerCharacterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'nonPlayerCharacter.label', default: 'NonPlayerCharacter'), id])
            redirect(action: "list")
            return
        }

        [nonPlayerCharacterInstance: nonPlayerCharacterInstance]
    }

    def edit(Long id) {
        def nonPlayerCharacterInstance = NonPlayerCharacter.get(id)
        if (!nonPlayerCharacterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'nonPlayerCharacter.label', default: 'NonPlayerCharacter'), id])
            redirect(action: "list")
            return
        }

        [nonPlayerCharacterInstance: nonPlayerCharacterInstance]
    }

    def update(Long id, Long version) {
        def nonPlayerCharacterInstance = NonPlayerCharacter.get(id)
        if (!nonPlayerCharacterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'nonPlayerCharacter.label', default: 'NonPlayerCharacter'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (nonPlayerCharacterInstance.version > version) {
                nonPlayerCharacterInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'nonPlayerCharacter.label', default: 'NonPlayerCharacter')] as Object[],
                          "Another user has updated this NonPlayerCharacter while you were editing")
                render(view: "edit", model: [nonPlayerCharacterInstance: nonPlayerCharacterInstance])
                return
            }
        }

        nonPlayerCharacterInstance.properties = params

        if (!nonPlayerCharacterInstance.save(flush: true)) {
            render(view: "edit", model: [nonPlayerCharacterInstance: nonPlayerCharacterInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'nonPlayerCharacter.label', default: 'NonPlayerCharacter'), nonPlayerCharacterInstance.id])
        redirect(action: "show", id: nonPlayerCharacterInstance.id)
    }

    def delete(Long id) {
        def nonPlayerCharacterInstance = NonPlayerCharacter.get(id)
        if (!nonPlayerCharacterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'nonPlayerCharacter.label', default: 'NonPlayerCharacter'), id])
            redirect(action: "list")
            return
        }

        try {
            nonPlayerCharacterInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'nonPlayerCharacter.label', default: 'NonPlayerCharacter'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'nonPlayerCharacter.label', default: 'NonPlayerCharacter'), id])
            redirect(action: "show", id: id)
        }
    }
}
