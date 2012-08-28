package academia



import org.junit.*
import grails.test.mixin.*

@TestFor(ArtigoController)
@Mock(Artigo)
class ArtigoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/artigo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.artigoInstanceList.size() == 0
        assert model.artigoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.artigoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.artigoInstance != null
        assert view == '/artigo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/artigo/show/1'
        assert controller.flash.message != null
        assert Artigo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/artigo/list'


        populateValidParams(params)
        def artigo = new Artigo(params)

        assert artigo.save() != null

        params.id = artigo.id

        def model = controller.show()

        assert model.artigoInstance == artigo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/artigo/list'


        populateValidParams(params)
        def artigo = new Artigo(params)

        assert artigo.save() != null

        params.id = artigo.id

        def model = controller.edit()

        assert model.artigoInstance == artigo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/artigo/list'

        response.reset()


        populateValidParams(params)
        def artigo = new Artigo(params)

        assert artigo.save() != null

        // test invalid parameters in update
        params.id = artigo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/artigo/edit"
        assert model.artigoInstance != null

        artigo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/artigo/show/$artigo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        artigo.clearErrors()

        populateValidParams(params)
        params.id = artigo.id
        params.version = -1
        controller.update()

        assert view == "/artigo/edit"
        assert model.artigoInstance != null
        assert model.artigoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/artigo/list'

        response.reset()

        populateValidParams(params)
        def artigo = new Artigo(params)

        assert artigo.save() != null
        assert Artigo.count() == 1

        params.id = artigo.id

        controller.delete()

        assert Artigo.count() == 0
        assert Artigo.get(artigo.id) == null
        assert response.redirectedUrl == '/artigo/list'
    }
}
