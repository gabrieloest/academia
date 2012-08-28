package academia



import org.junit.*
import grails.test.mixin.*

@TestFor(ConjuntoDietaController)
@Mock(ConjuntoDieta)
class ConjuntoDietaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/conjuntoDieta/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.conjuntoDietaInstanceList.size() == 0
        assert model.conjuntoDietaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.conjuntoDietaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.conjuntoDietaInstance != null
        assert view == '/conjuntoDieta/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/conjuntoDieta/show/1'
        assert controller.flash.message != null
        assert ConjuntoDieta.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/conjuntoDieta/list'


        populateValidParams(params)
        def conjuntoDieta = new ConjuntoDieta(params)

        assert conjuntoDieta.save() != null

        params.id = conjuntoDieta.id

        def model = controller.show()

        assert model.conjuntoDietaInstance == conjuntoDieta
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/conjuntoDieta/list'


        populateValidParams(params)
        def conjuntoDieta = new ConjuntoDieta(params)

        assert conjuntoDieta.save() != null

        params.id = conjuntoDieta.id

        def model = controller.edit()

        assert model.conjuntoDietaInstance == conjuntoDieta
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/conjuntoDieta/list'

        response.reset()


        populateValidParams(params)
        def conjuntoDieta = new ConjuntoDieta(params)

        assert conjuntoDieta.save() != null

        // test invalid parameters in update
        params.id = conjuntoDieta.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/conjuntoDieta/edit"
        assert model.conjuntoDietaInstance != null

        conjuntoDieta.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/conjuntoDieta/show/$conjuntoDieta.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        conjuntoDieta.clearErrors()

        populateValidParams(params)
        params.id = conjuntoDieta.id
        params.version = -1
        controller.update()

        assert view == "/conjuntoDieta/edit"
        assert model.conjuntoDietaInstance != null
        assert model.conjuntoDietaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/conjuntoDieta/list'

        response.reset()

        populateValidParams(params)
        def conjuntoDieta = new ConjuntoDieta(params)

        assert conjuntoDieta.save() != null
        assert ConjuntoDieta.count() == 1

        params.id = conjuntoDieta.id

        controller.delete()

        assert ConjuntoDieta.count() == 0
        assert ConjuntoDieta.get(conjuntoDieta.id) == null
        assert response.redirectedUrl == '/conjuntoDieta/list'
    }
}
