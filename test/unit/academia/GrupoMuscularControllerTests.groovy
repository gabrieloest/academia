package academia



import org.junit.*
import grails.test.mixin.*

@TestFor(GrupoMuscularController)
@Mock(GrupoMuscular)
class GrupoMuscularControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/grupoMuscular/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.grupoMuscularInstanceList.size() == 0
        assert model.grupoMuscularInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.grupoMuscularInstance != null
    }

    void testSave() {
        controller.save()

        assert model.grupoMuscularInstance != null
        assert view == '/grupoMuscular/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/grupoMuscular/show/1'
        assert controller.flash.message != null
        assert GrupoMuscular.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/grupoMuscular/list'


        populateValidParams(params)
        def grupoMuscular = new GrupoMuscular(params)

        assert grupoMuscular.save() != null

        params.id = grupoMuscular.id

        def model = controller.show()

        assert model.grupoMuscularInstance == grupoMuscular
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/grupoMuscular/list'


        populateValidParams(params)
        def grupoMuscular = new GrupoMuscular(params)

        assert grupoMuscular.save() != null

        params.id = grupoMuscular.id

        def model = controller.edit()

        assert model.grupoMuscularInstance == grupoMuscular
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/grupoMuscular/list'

        response.reset()


        populateValidParams(params)
        def grupoMuscular = new GrupoMuscular(params)

        assert grupoMuscular.save() != null

        // test invalid parameters in update
        params.id = grupoMuscular.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/grupoMuscular/edit"
        assert model.grupoMuscularInstance != null

        grupoMuscular.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/grupoMuscular/show/$grupoMuscular.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        grupoMuscular.clearErrors()

        populateValidParams(params)
        params.id = grupoMuscular.id
        params.version = -1
        controller.update()

        assert view == "/grupoMuscular/edit"
        assert model.grupoMuscularInstance != null
        assert model.grupoMuscularInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/grupoMuscular/list'

        response.reset()

        populateValidParams(params)
        def grupoMuscular = new GrupoMuscular(params)

        assert grupoMuscular.save() != null
        assert GrupoMuscular.count() == 1

        params.id = grupoMuscular.id

        controller.delete()

        assert GrupoMuscular.count() == 0
        assert GrupoMuscular.get(grupoMuscular.id) == null
        assert response.redirectedUrl == '/grupoMuscular/list'
    }
}
