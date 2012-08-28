package academia



import org.junit.*
import grails.test.mixin.*

@TestFor(FichaController)
@Mock(Ficha)
class FichaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ficha/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.fichaInstanceList.size() == 0
        assert model.fichaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.fichaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.fichaInstance != null
        assert view == '/ficha/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ficha/show/1'
        assert controller.flash.message != null
        assert Ficha.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ficha/list'


        populateValidParams(params)
        def ficha = new Ficha(params)

        assert ficha.save() != null

        params.id = ficha.id

        def model = controller.show()

        assert model.fichaInstance == ficha
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ficha/list'


        populateValidParams(params)
        def ficha = new Ficha(params)

        assert ficha.save() != null

        params.id = ficha.id

        def model = controller.edit()

        assert model.fichaInstance == ficha
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ficha/list'

        response.reset()


        populateValidParams(params)
        def ficha = new Ficha(params)

        assert ficha.save() != null

        // test invalid parameters in update
        params.id = ficha.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ficha/edit"
        assert model.fichaInstance != null

        ficha.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ficha/show/$ficha.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ficha.clearErrors()

        populateValidParams(params)
        params.id = ficha.id
        params.version = -1
        controller.update()

        assert view == "/ficha/edit"
        assert model.fichaInstance != null
        assert model.fichaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ficha/list'

        response.reset()

        populateValidParams(params)
        def ficha = new Ficha(params)

        assert ficha.save() != null
        assert Ficha.count() == 1

        params.id = ficha.id

        controller.delete()

        assert Ficha.count() == 0
        assert Ficha.get(ficha.id) == null
        assert response.redirectedUrl == '/ficha/list'
    }
}
