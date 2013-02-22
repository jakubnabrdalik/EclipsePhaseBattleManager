package game

import org.springframework.dao.DataIntegrityViolationException

class WeaponController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [weaponInstanceList: Weapon.list(params), weaponInstanceTotal: Weapon.count()]
    }

    def create() {
        [weaponInstance: new Weapon(params)]
    }

    def save() {
        def weaponInstance = new Weapon(params)
        if (!weaponInstance.save(flush: true)) {
            render(view: "create", model: [weaponInstance: weaponInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'weapon.label', default: 'Weapon'), weaponInstance.id])
        redirect(action: "show", id: weaponInstance.id)
    }

    def show(Long id) {
        def weaponInstance = Weapon.get(id)
        if (!weaponInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'weapon.label', default: 'Weapon'), id])
            redirect(action: "list")
            return
        }

        [weaponInstance: weaponInstance]
    }

    def edit(Long id) {
        def weaponInstance = Weapon.get(id)
        if (!weaponInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'weapon.label', default: 'Weapon'), id])
            redirect(action: "list")
            return
        }

        [weaponInstance: weaponInstance]
    }

    def update(Long id, Long version) {
        def weaponInstance = Weapon.get(id)
        if (!weaponInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'weapon.label', default: 'Weapon'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (weaponInstance.version > version) {
                weaponInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'weapon.label', default: 'Weapon')] as Object[],
                          "Another user has updated this Weapon while you were editing")
                render(view: "edit", model: [weaponInstance: weaponInstance])
                return
            }
        }

        weaponInstance.properties = params

        if (!weaponInstance.save(flush: true)) {
            render(view: "edit", model: [weaponInstance: weaponInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'weapon.label', default: 'Weapon'), weaponInstance.id])
        redirect(action: "show", id: weaponInstance.id)
    }

    def delete(Long id) {
        def weaponInstance = Weapon.get(id)
        if (!weaponInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'weapon.label', default: 'Weapon'), id])
            redirect(action: "list")
            return
        }

        try {
            weaponInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'weapon.label', default: 'Weapon'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'weapon.label', default: 'Weapon'), id])
            redirect(action: "show", id: id)
        }
    }
}
