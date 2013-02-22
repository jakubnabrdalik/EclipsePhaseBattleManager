package game

import org.springframework.dao.DataIntegrityViolationException

class SkillLevelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [skillLevelInstanceList: SkillLevel.list(params), skillLevelInstanceTotal: SkillLevel.count()]
    }

    def create() {
        [skillLevelInstance: new SkillLevel(params)]
    }

    def save() {
        def skillLevelInstance = new SkillLevel(params)
        if (!skillLevelInstance.save(flush: true)) {
            render(view: "create", model: [skillLevelInstance: skillLevelInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'skillLevel.label', default: 'SkillLevel'), skillLevelInstance.id])
        redirect(action: "show", id: skillLevelInstance.id)
    }

    def show(Long id) {
        def skillLevelInstance = SkillLevel.get(id)
        if (!skillLevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'skillLevel.label', default: 'SkillLevel'), id])
            redirect(action: "list")
            return
        }

        [skillLevelInstance: skillLevelInstance]
    }

    def edit(Long id) {
        def skillLevelInstance = SkillLevel.get(id)
        if (!skillLevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'skillLevel.label', default: 'SkillLevel'), id])
            redirect(action: "list")
            return
        }

        [skillLevelInstance: skillLevelInstance]
    }

    def update(Long id, Long version) {
        def skillLevelInstance = SkillLevel.get(id)
        if (!skillLevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'skillLevel.label', default: 'SkillLevel'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (skillLevelInstance.version > version) {
                skillLevelInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'skillLevel.label', default: 'SkillLevel')] as Object[],
                          "Another user has updated this SkillLevel while you were editing")
                render(view: "edit", model: [skillLevelInstance: skillLevelInstance])
                return
            }
        }

        skillLevelInstance.properties = params

        if (!skillLevelInstance.save(flush: true)) {
            render(view: "edit", model: [skillLevelInstance: skillLevelInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'skillLevel.label', default: 'SkillLevel'), skillLevelInstance.id])
        redirect(action: "show", id: skillLevelInstance.id)
    }

    def delete(Long id) {
        def skillLevelInstance = SkillLevel.get(id)
        if (!skillLevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'skillLevel.label', default: 'SkillLevel'), id])
            redirect(action: "list")
            return
        }

        try {
            skillLevelInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'skillLevel.label', default: 'SkillLevel'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'skillLevel.label', default: 'SkillLevel'), id])
            redirect(action: "show", id: id)
        }
    }
}
