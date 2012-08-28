package academia



import org.junit.*
import grails.test.mixin.*

@TestFor(DietaController)
@Mock(Dieta)
class DietaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/dieta/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.dietaInstanceList.size() == 0
        assert model.dietaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.dietaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.dietaInstance != null
        assert view == '/dieta/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/dieta/show/1'
        assert controller.flash.message != null
        assert Dieta.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/dieta/list'


        populateValidParams(params)
        def dieta = new Dieta(params)

        assert dieta.save() != null

        params.id = dieta.id

        def model = controller.show()

        assert model.dietaInstance == dieta
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/dieta/list'


        populateValidParams(params)
        def dieta = new Dieta(params)

        assert dieta.save() != null

        params.id = dieta.id

        def model = controller.edit()

        assert model.dietaInstance == dieta
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/dieta/list'

        response.reset()


        populateValidParams(params)
        def dieta = new Dieta(params)

        assert dieta.save() != null

        // test invalid parameters in update
        params.id = dieta.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/dieta/edit"
        assert model.dietaInstance != null

        dieta.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/dieta/show/$dieta.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        dieta.clearErrors()

        populateValidParams(params)
        params.id = dieta.id
        params.version = -1
        controller.update()

        assert view == "/dieta/edit"
        assert model.dietaInstance != null
        assert model.dietaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/dieta/list'

        response.reset()

        populateValidParams(params)
        def dieta = new Dieta(params)

        assert dieta.save() != null
        assert Dieta.count() == 1

        params.id = dieta.id

        controller.delete()

        assert Dieta.count() == 0
        assert Dieta.get(dieta.id) == null
        assert response.redirectedUrl == '/dieta/list'
    }
}
