package academia



import org.junit.*
import grails.test.mixin.*

@TestFor(ConjuntoSerieController)
@Mock(ConjuntoSerie)
class ConjuntoSerieControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/conjuntoSerie/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.conjuntoSerieInstanceList.size() == 0
        assert model.conjuntoSerieInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.conjuntoSerieInstance != null
    }

    void testSave() {
        controller.save()

        assert model.conjuntoSerieInstance != null
        assert view == '/conjuntoSerie/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/conjuntoSerie/show/1'
        assert controller.flash.message != null
        assert ConjuntoSerie.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/conjuntoSerie/list'


        populateValidParams(params)
        def conjuntoSerie = new ConjuntoSerie(params)

        assert conjuntoSerie.save() != null

        params.id = conjuntoSerie.id

        def model = controller.show()

        assert model.conjuntoSerieInstance == conjuntoSerie
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/conjuntoSerie/list'


        populateValidParams(params)
        def conjuntoSerie = new ConjuntoSerie(params)

        assert conjuntoSerie.save() != null

        params.id = conjuntoSerie.id

        def model = controller.edit()

        assert model.conjuntoSerieInstance == conjuntoSerie
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/conjuntoSerie/list'

        response.reset()


        populateValidParams(params)
        def conjuntoSerie = new ConjuntoSerie(params)

        assert conjuntoSerie.save() != null

        // test invalid parameters in update
        params.id = conjuntoSerie.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/conjuntoSerie/edit"
        assert model.conjuntoSerieInstance != null

        conjuntoSerie.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/conjuntoSerie/show/$conjuntoSerie.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        conjuntoSerie.clearErrors()

        populateValidParams(params)
        params.id = conjuntoSerie.id
        params.version = -1
        controller.update()

        assert view == "/conjuntoSerie/edit"
        assert model.conjuntoSerieInstance != null
        assert model.conjuntoSerieInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/conjuntoSerie/list'

        response.reset()

        populateValidParams(params)
        def conjuntoSerie = new ConjuntoSerie(params)

        assert conjuntoSerie.save() != null
        assert ConjuntoSerie.count() == 1

        params.id = conjuntoSerie.id

        controller.delete()

        assert ConjuntoSerie.count() == 0
        assert ConjuntoSerie.get(conjuntoSerie.id) == null
        assert response.redirectedUrl == '/conjuntoSerie/list'
    }
}
