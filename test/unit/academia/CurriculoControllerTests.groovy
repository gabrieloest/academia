package academia



import org.junit.*
import grails.test.mixin.*

@TestFor(CurriculoController)
@Mock(Curriculo)
class CurriculoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/curriculo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.curriculoInstanceList.size() == 0
        assert model.curriculoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.curriculoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.curriculoInstance != null
        assert view == '/curriculo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/curriculo/show/1'
        assert controller.flash.message != null
        assert Curriculo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/curriculo/list'


        populateValidParams(params)
        def curriculo = new Curriculo(params)

        assert curriculo.save() != null

        params.id = curriculo.id

        def model = controller.show()

        assert model.curriculoInstance == curriculo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/curriculo/list'


        populateValidParams(params)
        def curriculo = new Curriculo(params)

        assert curriculo.save() != null

        params.id = curriculo.id

        def model = controller.edit()

        assert model.curriculoInstance == curriculo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/curriculo/list'

        response.reset()


        populateValidParams(params)
        def curriculo = new Curriculo(params)

        assert curriculo.save() != null

        // test invalid parameters in update
        params.id = curriculo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/curriculo/edit"
        assert model.curriculoInstance != null

        curriculo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/curriculo/show/$curriculo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        curriculo.clearErrors()

        populateValidParams(params)
        params.id = curriculo.id
        params.version = -1
        controller.update()

        assert view == "/curriculo/edit"
        assert model.curriculoInstance != null
        assert model.curriculoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/curriculo/list'

        response.reset()

        populateValidParams(params)
        def curriculo = new Curriculo(params)

        assert curriculo.save() != null
        assert Curriculo.count() == 1

        params.id = curriculo.id

        controller.delete()

        assert Curriculo.count() == 0
        assert Curriculo.get(curriculo.id) == null
        assert response.redirectedUrl == '/curriculo/list'
    }
}
