package academia



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoAtividadeController)
@Mock(TipoAtividade)
class TipoAtividadeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoAtividade/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoAtividadeInstanceList.size() == 0
        assert model.tipoAtividadeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.tipoAtividadeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoAtividadeInstance != null
        assert view == '/tipoAtividade/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoAtividade/show/1'
        assert controller.flash.message != null
        assert TipoAtividade.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoAtividade/list'


        populateValidParams(params)
        def tipoAtividade = new TipoAtividade(params)

        assert tipoAtividade.save() != null

        params.id = tipoAtividade.id

        def model = controller.show()

        assert model.tipoAtividadeInstance == tipoAtividade
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoAtividade/list'


        populateValidParams(params)
        def tipoAtividade = new TipoAtividade(params)

        assert tipoAtividade.save() != null

        params.id = tipoAtividade.id

        def model = controller.edit()

        assert model.tipoAtividadeInstance == tipoAtividade
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoAtividade/list'

        response.reset()


        populateValidParams(params)
        def tipoAtividade = new TipoAtividade(params)

        assert tipoAtividade.save() != null

        // test invalid parameters in update
        params.id = tipoAtividade.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoAtividade/edit"
        assert model.tipoAtividadeInstance != null

        tipoAtividade.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoAtividade/show/$tipoAtividade.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoAtividade.clearErrors()

        populateValidParams(params)
        params.id = tipoAtividade.id
        params.version = -1
        controller.update()

        assert view == "/tipoAtividade/edit"
        assert model.tipoAtividadeInstance != null
        assert model.tipoAtividadeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoAtividade/list'

        response.reset()

        populateValidParams(params)
        def tipoAtividade = new TipoAtividade(params)

        assert tipoAtividade.save() != null
        assert TipoAtividade.count() == 1

        params.id = tipoAtividade.id

        controller.delete()

        assert TipoAtividade.count() == 0
        assert TipoAtividade.get(tipoAtividade.id) == null
        assert response.redirectedUrl == '/tipoAtividade/list'
    }
}
