package academia



import org.junit.*
import grails.test.mixin.*

@TestFor(ExercicioController)
@Mock(Exercicio)
class ExercicioControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/exercicio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.exercicioInstanceList.size() == 0
        assert model.exercicioInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.exercicioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.exercicioInstance != null
        assert view == '/exercicio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/exercicio/show/1'
        assert controller.flash.message != null
        assert Exercicio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/exercicio/list'


        populateValidParams(params)
        def exercicio = new Exercicio(params)

        assert exercicio.save() != null

        params.id = exercicio.id

        def model = controller.show()

        assert model.exercicioInstance == exercicio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/exercicio/list'


        populateValidParams(params)
        def exercicio = new Exercicio(params)

        assert exercicio.save() != null

        params.id = exercicio.id

        def model = controller.edit()

        assert model.exercicioInstance == exercicio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/exercicio/list'

        response.reset()


        populateValidParams(params)
        def exercicio = new Exercicio(params)

        assert exercicio.save() != null

        // test invalid parameters in update
        params.id = exercicio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/exercicio/edit"
        assert model.exercicioInstance != null

        exercicio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/exercicio/show/$exercicio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        exercicio.clearErrors()

        populateValidParams(params)
        params.id = exercicio.id
        params.version = -1
        controller.update()

        assert view == "/exercicio/edit"
        assert model.exercicioInstance != null
        assert model.exercicioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/exercicio/list'

        response.reset()

        populateValidParams(params)
        def exercicio = new Exercicio(params)

        assert exercicio.save() != null
        assert Exercicio.count() == 1

        params.id = exercicio.id

        controller.delete()

        assert Exercicio.count() == 0
        assert Exercicio.get(exercicio.id) == null
        assert response.redirectedUrl == '/exercicio/list'
    }
}
