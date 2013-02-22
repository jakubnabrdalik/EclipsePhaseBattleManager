package game



import org.junit.*
import grails.test.mixin.*

@TestFor(NonPlayerCharacterController)
@Mock(NonPlayerCharacter)
class NonPlayerCharacterControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/nonPlayerCharacter/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.nonPlayerCharacterInstanceList.size() == 0
        assert model.nonPlayerCharacterInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.nonPlayerCharacterInstance != null
    }

    void testSave() {
        controller.save()

        assert model.nonPlayerCharacterInstance != null
        assert view == '/nonPlayerCharacter/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/nonPlayerCharacter/show/1'
        assert controller.flash.message != null
        assert NonPlayerCharacter.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/nonPlayerCharacter/list'

        populateValidParams(params)
        def nonPlayerCharacter = new NonPlayerCharacter(params)

        assert nonPlayerCharacter.save() != null

        params.id = nonPlayerCharacter.id

        def model = controller.show()

        assert model.nonPlayerCharacterInstance == nonPlayerCharacter
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/nonPlayerCharacter/list'

        populateValidParams(params)
        def nonPlayerCharacter = new NonPlayerCharacter(params)

        assert nonPlayerCharacter.save() != null

        params.id = nonPlayerCharacter.id

        def model = controller.edit()

        assert model.nonPlayerCharacterInstance == nonPlayerCharacter
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/nonPlayerCharacter/list'

        response.reset()

        populateValidParams(params)
        def nonPlayerCharacter = new NonPlayerCharacter(params)

        assert nonPlayerCharacter.save() != null

        // test invalid parameters in update
        params.id = nonPlayerCharacter.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/nonPlayerCharacter/edit"
        assert model.nonPlayerCharacterInstance != null

        nonPlayerCharacter.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/nonPlayerCharacter/show/$nonPlayerCharacter.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        nonPlayerCharacter.clearErrors()

        populateValidParams(params)
        params.id = nonPlayerCharacter.id
        params.version = -1
        controller.update()

        assert view == "/nonPlayerCharacter/edit"
        assert model.nonPlayerCharacterInstance != null
        assert model.nonPlayerCharacterInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/nonPlayerCharacter/list'

        response.reset()

        populateValidParams(params)
        def nonPlayerCharacter = new NonPlayerCharacter(params)

        assert nonPlayerCharacter.save() != null
        assert NonPlayerCharacter.count() == 1

        params.id = nonPlayerCharacter.id

        controller.delete()

        assert NonPlayerCharacter.count() == 0
        assert NonPlayerCharacter.get(nonPlayerCharacter.id) == null
        assert response.redirectedUrl == '/nonPlayerCharacter/list'
    }
}
