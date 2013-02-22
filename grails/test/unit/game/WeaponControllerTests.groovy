package game



import org.junit.*
import grails.test.mixin.*

@TestFor(WeaponController)
@Mock(Weapon)
class WeaponControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/weapon/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.weaponInstanceList.size() == 0
        assert model.weaponInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.weaponInstance != null
    }

    void testSave() {
        controller.save()

        assert model.weaponInstance != null
        assert view == '/weapon/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/weapon/show/1'
        assert controller.flash.message != null
        assert Weapon.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/weapon/list'

        populateValidParams(params)
        def weapon = new Weapon(params)

        assert weapon.save() != null

        params.id = weapon.id

        def model = controller.show()

        assert model.weaponInstance == weapon
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/weapon/list'

        populateValidParams(params)
        def weapon = new Weapon(params)

        assert weapon.save() != null

        params.id = weapon.id

        def model = controller.edit()

        assert model.weaponInstance == weapon
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/weapon/list'

        response.reset()

        populateValidParams(params)
        def weapon = new Weapon(params)

        assert weapon.save() != null

        // test invalid parameters in update
        params.id = weapon.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/weapon/edit"
        assert model.weaponInstance != null

        weapon.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/weapon/show/$weapon.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        weapon.clearErrors()

        populateValidParams(params)
        params.id = weapon.id
        params.version = -1
        controller.update()

        assert view == "/weapon/edit"
        assert model.weaponInstance != null
        assert model.weaponInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/weapon/list'

        response.reset()

        populateValidParams(params)
        def weapon = new Weapon(params)

        assert weapon.save() != null
        assert Weapon.count() == 1

        params.id = weapon.id

        controller.delete()

        assert Weapon.count() == 0
        assert Weapon.get(weapon.id) == null
        assert response.redirectedUrl == '/weapon/list'
    }
}
