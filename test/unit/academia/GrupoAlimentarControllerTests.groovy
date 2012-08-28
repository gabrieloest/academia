package academia



import org.junit.*
import grails.test.mixin.*

@TestFor(GrupoAlimentarController)
@Mock(GrupoAlimentar)
class GrupoAlimentarControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/grupoAlimentar/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.grupoAlimentarInstanceList.size() == 0
        assert model.grupoAlimentarInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.grupoAlimentarInstance != null
    }

    void testSave() {
        controller.save()

        assert model.grupoAlimentarInstance != null
        assert view == '/grupoAlimentar/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/grupoAlimentar/show/1'
        assert controller.flash.message != null
        assert GrupoAlimentar.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/grupoAlimentar/list'


        populateValidParams(params)
        def grupoAlimentar = new GrupoAlimentar(params)

        assert grupoAlimentar.save() != null

        params.id = grupoAlimentar.id

        def model = controller.show()

        assert model.grupoAlimentarInstance == grupoAlimentar
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/grupoAlimentar/list'


        populateValidParams(params)
        def grupoAlimentar = new GrupoAlimentar(params)

        assert grupoAlimentar.save() != null

        params.id = grupoAlimentar.id

        def model = controller.edit()

        assert model.grupoAlimentarInstance == grupoAlimentar
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/grupoAlimentar/list'

        response.reset()


        populateValidParams(params)
        def grupoAlimentar = new GrupoAlimentar(params)

        assert grupoAlimentar.save() != null

        // test invalid parameters in update
        params.id = grupoAlimentar.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/grupoAlimentar/edit"
        assert model.grupoAlimentarInstance != null

        grupoAlimentar.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/grupoAlimentar/show/$grupoAlimentar.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        grupoAlimentar.clearErrors()

        populateValidParams(params)
        params.id = grupoAlimentar.id
        params.version = -1
        controller.update()

        assert view == "/grupoAlimentar/edit"
        assert model.grupoAlimentarInstance != null
        assert model.grupoAlimentarInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/grupoAlimentar/list'

        response.reset()

        populateValidParams(params)
        def grupoAlimentar = new GrupoAlimentar(params)

        assert grupoAlimentar.save() != null
        assert GrupoAlimentar.count() == 1

        params.id = grupoAlimentar.id

        controller.delete()

        assert GrupoAlimentar.count() == 0
        assert GrupoAlimentar.get(grupoAlimentar.id) == null
        assert response.redirectedUrl == '/grupoAlimentar/list'
    }
}
