package academia



import org.junit.*
import grails.test.mixin.*

@TestFor(PatrocinadorController)
@Mock(Patrocinador)
class PatrocinadorControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/patrocinador/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.patrocinadorInstanceList.size() == 0
        assert model.patrocinadorInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.patrocinadorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.patrocinadorInstance != null
        assert view == '/patrocinador/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/patrocinador/show/1'
        assert controller.flash.message != null
        assert Patrocinador.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/patrocinador/list'


        populateValidParams(params)
        def patrocinador = new Patrocinador(params)

        assert patrocinador.save() != null

        params.id = patrocinador.id

        def model = controller.show()

        assert model.patrocinadorInstance == patrocinador
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/patrocinador/list'


        populateValidParams(params)
        def patrocinador = new Patrocinador(params)

        assert patrocinador.save() != null

        params.id = patrocinador.id

        def model = controller.edit()

        assert model.patrocinadorInstance == patrocinador
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/patrocinador/list'

        response.reset()


        populateValidParams(params)
        def patrocinador = new Patrocinador(params)

        assert patrocinador.save() != null

        // test invalid parameters in update
        params.id = patrocinador.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/patrocinador/edit"
        assert model.patrocinadorInstance != null

        patrocinador.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/patrocinador/show/$patrocinador.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        patrocinador.clearErrors()

        populateValidParams(params)
        params.id = patrocinador.id
        params.version = -1
        controller.update()

        assert view == "/patrocinador/edit"
        assert model.patrocinadorInstance != null
        assert model.patrocinadorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/patrocinador/list'

        response.reset()

        populateValidParams(params)
        def patrocinador = new Patrocinador(params)

        assert patrocinador.save() != null
        assert Patrocinador.count() == 1

        params.id = patrocinador.id

        controller.delete()

        assert Patrocinador.count() == 0
        assert Patrocinador.get(patrocinador.id) == null
        assert response.redirectedUrl == '/patrocinador/list'
    }
}
