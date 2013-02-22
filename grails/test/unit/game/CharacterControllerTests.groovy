package game



import org.junit.*
import grails.test.mixin.*

@TestFor(CharacterController)
@Mock(Character)
class CharacterControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/character/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.characterInstanceList.size() == 0
        assert model.characterInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.characterInstance != null
    }

    void testSave() {
        controller.save()

        assert model.characterInstance != null
        assert view == '/character/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/character/show/1'
        assert controller.flash.message != null
        assert Character.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/character/list'

        populateValidParams(params)
        def character = new Character(params)

        assert character.save() != null

        params.id = character.id

        def model = controller.show()

        assert model.characterInstance == character
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/character/list'

        populateValidParams(params)
        def character = new Character(params)

        assert character.save() != null

        params.id = character.id

        def model = controller.edit()

        assert model.characterInstance == character
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/character/list'

        response.reset()

        populateValidParams(params)
        def character = new Character(params)

        assert character.save() != null

        // test invalid parameters in update
        params.id = character.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/character/edit"
        assert model.characterInstance != null

        character.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/character/show/$character.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        character.clearErrors()

        populateValidParams(params)
        params.id = character.id
        params.version = -1
        controller.update()

        assert view == "/character/edit"
        assert model.characterInstance != null
        assert model.characterInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/character/list'

        response.reset()

        populateValidParams(params)
        def character = new Character(params)

        assert character.save() != null
        assert Character.count() == 1

        params.id = character.id

        controller.delete()

        assert Character.count() == 0
        assert Character.get(character.id) == null
        assert response.redirectedUrl == '/character/list'
    }
}
