import game.PlayerCharacter
import grails.test.mixin.*

@TestFor(PlayerCharacterController)
@Mock(PlayerCharacter)
class PlayerCharacterControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/playerCharacter/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.playerCharacterInstanceList.size() == 0
        assert model.playerCharacterInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.playerCharacterInstance != null
    }

    void testSave() {
        controller.save()

        assert model.playerCharacterInstance != null
        assert view == '/playerCharacter/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/playerCharacter/show/1'
        assert controller.flash.message != null
        assert PlayerCharacter.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/playerCharacter/list'

        populateValidParams(params)
        def playerCharacter = new PlayerCharacter(params)

        assert playerCharacter.save() != null

        params.id = playerCharacter.id

        def model = controller.show()

        assert model.playerCharacterInstance == playerCharacter
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/playerCharacter/list'

        populateValidParams(params)
        def playerCharacter = new PlayerCharacter(params)

        assert playerCharacter.save() != null

        params.id = playerCharacter.id

        def model = controller.edit()

        assert model.playerCharacterInstance == playerCharacter
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/playerCharacter/list'

        response.reset()

        populateValidParams(params)
        def playerCharacter = new PlayerCharacter(params)

        assert playerCharacter.save() != null

        // test invalid parameters in update
        params.id = playerCharacter.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/playerCharacter/edit"
        assert model.playerCharacterInstance != null

        playerCharacter.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/playerCharacter/show/$playerCharacter.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        playerCharacter.clearErrors()

        populateValidParams(params)
        params.id = playerCharacter.id
        params.version = -1
        controller.update()

        assert view == "/playerCharacter/edit"
        assert model.playerCharacterInstance != null
        assert model.playerCharacterInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/playerCharacter/list'

        response.reset()

        populateValidParams(params)
        def playerCharacter = new PlayerCharacter(params)

        assert playerCharacter.save() != null
        assert PlayerCharacter.count() == 1

        params.id = playerCharacter.id

        controller.delete()

        assert PlayerCharacter.count() == 0
        assert PlayerCharacter.get(playerCharacter.id) == null
        assert response.redirectedUrl == '/playerCharacter/list'
    }
}
