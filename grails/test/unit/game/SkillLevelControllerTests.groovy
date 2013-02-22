package game



import org.junit.*
import grails.test.mixin.*

@TestFor(SkillLevelController)
@Mock(SkillLevel)
class SkillLevelControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/skillLevel/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.skillLevelInstanceList.size() == 0
        assert model.skillLevelInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.skillLevelInstance != null
    }

    void testSave() {
        controller.save()

        assert model.skillLevelInstance != null
        assert view == '/skillLevel/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/skillLevel/show/1'
        assert controller.flash.message != null
        assert SkillLevel.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/skillLevel/list'

        populateValidParams(params)
        def skillLevel = new SkillLevel(params)

        assert skillLevel.save() != null

        params.id = skillLevel.id

        def model = controller.show()

        assert model.skillLevelInstance == skillLevel
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/skillLevel/list'

        populateValidParams(params)
        def skillLevel = new SkillLevel(params)

        assert skillLevel.save() != null

        params.id = skillLevel.id

        def model = controller.edit()

        assert model.skillLevelInstance == skillLevel
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/skillLevel/list'

        response.reset()

        populateValidParams(params)
        def skillLevel = new SkillLevel(params)

        assert skillLevel.save() != null

        // test invalid parameters in update
        params.id = skillLevel.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/skillLevel/edit"
        assert model.skillLevelInstance != null

        skillLevel.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/skillLevel/show/$skillLevel.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        skillLevel.clearErrors()

        populateValidParams(params)
        params.id = skillLevel.id
        params.version = -1
        controller.update()

        assert view == "/skillLevel/edit"
        assert model.skillLevelInstance != null
        assert model.skillLevelInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/skillLevel/list'

        response.reset()

        populateValidParams(params)
        def skillLevel = new SkillLevel(params)

        assert skillLevel.save() != null
        assert SkillLevel.count() == 1

        params.id = skillLevel.id

        controller.delete()

        assert SkillLevel.count() == 0
        assert SkillLevel.get(skillLevel.id) == null
        assert response.redirectedUrl == '/skillLevel/list'
    }
}
