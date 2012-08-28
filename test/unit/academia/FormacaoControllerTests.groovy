package academia



import org.junit.*
import grails.test.mixin.*

@TestFor(FormacaoController)
@Mock(Formacao)
class FormacaoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/formacao/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.formacaoInstanceList.size() == 0
        assert model.formacaoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.formacaoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.formacaoInstance != null
        assert view == '/formacao/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/formacao/show/1'
        assert controller.flash.message != null
        assert Formacao.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/formacao/list'


        populateValidParams(params)
        def formacao = new Formacao(params)

        assert formacao.save() != null

        params.id = formacao.id

        def model = controller.show()

        assert model.formacaoInstance == formacao
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/formacao/list'


        populateValidParams(params)
        def formacao = new Formacao(params)

        assert formacao.save() != null

        params.id = formacao.id

        def model = controller.edit()

        assert model.formacaoInstance == formacao
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/formacao/list'

        response.reset()


        populateValidParams(params)
        def formacao = new Formacao(params)

        assert formacao.save() != null

        // test invalid parameters in update
        params.id = formacao.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/formacao/edit"
        assert model.formacaoInstance != null

        formacao.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/formacao/show/$formacao.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        formacao.clearErrors()

        populateValidParams(params)
        params.id = formacao.id
        params.version = -1
        controller.update()

        assert view == "/formacao/edit"
        assert model.formacaoInstance != null
        assert model.formacaoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/formacao/list'

        response.reset()

        populateValidParams(params)
        def formacao = new Formacao(params)

        assert formacao.save() != null
        assert Formacao.count() == 1

        params.id = formacao.id

        controller.delete()

        assert Formacao.count() == 0
        assert Formacao.get(formacao.id) == null
        assert response.redirectedUrl == '/formacao/list'
    }
}
