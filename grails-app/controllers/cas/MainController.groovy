package cas

import grails.converters.JSON

class MainController {
    Md5passService md5passService

    def index() { }

    def loadForms(){
        def forms = TestingForm.findAll()
        render (template: "formsPage", model: [forms: forms])
    };

    def loadFormCreation(){
        render (template: "formCreation")
    }

    def saveNewForm(String title, String question, String description, String creationDate){
        JSON resultJson
        TestingForm testingForm;
        testingForm = TestingForm.findByTitle(title);

        if(!testingForm){
            testingForm = new TestingForm(title: title, question: question, description: description, creationDate: creationDate, published: 0);
            if(testingForm.save(flush: true)){
                resultJson = [status:0, message:"Success"] as JSON
            } else {
                resultJson = [status:1, message:"Error"] as JSON
            }
        }
        else{
            resultJson = [status:2, message:"Error"] as JSON
        }
        render(resultJson)

    }

    def loadFormEdit(int id){
//        println TestingForm.findById(id).title
//        println TestingForm.findById(id).question
        render(template: 'formEdit', model: [form: TestingForm.findById(id)]);
    }

    def saveEditForm(String title, String question, String description, int id){
        JSON resultJson
        TestingForm testingForm;
        testingForm = TestingForm.findByTitle(title);

        if(testingForm){
            if(testingForm.id==id){
                testingForm.question = question;
                testingForm.description = description;

                if (testingForm.save(flush: true)) {
                    resultJson = [status:0, message:"Success"] as JSON
                } else {
                    resultJson = [status:1, message:"Error"] as JSON
                }
            }
            else{
                resultJson = [status:2, message:"Error"] as JSON
            }
        }
        else{
            testingForm = TestingForm.findById(id);

            testingForm.title = title;
            testingForm.question = question;
            testingForm.description = description;
            if (testingForm.save(flush: true)) {
                resultJson = [status:0, message:"Success"] as JSON
            } else {
                resultJson = [status:1, message:"Error"] as JSON
            }
        }
        render(resultJson)
    }

    def deleteForm(int id){
        TestingForm testingForm = TestingForm.findById(id);

        JSON resultJson
        if (testingForm.delete(flush: true)) {
            resultJson = [status:0, message:"Success"] as JSON
        } else {
            resultJson = [status:1, message:"Error"] as JSON
        }

        render resultJson
    }

    def loadLogIn(){

        TestingFaculty testingUser

        testingUser = TestingFaculty.findByUsername("admin@admin.com")

        if(!testingUser){
            TestingRole testingRole = new TestingRole(role: "Wizard");
            testingRole.save(flush: true)

            testingUser = new TestingFaculty(fname: "Admin", lname: "Admin", username: "admin@admin.com", password: md5passService.getEncryptedPass("testing"), role: TestingRole.findById(1).id)

            testingUser.save(flush: true)
        }
        render template: 'loginPage'
    }

    def login(String username, String password){

        TestingFaculty testingUser = TestingFaculty.findByUsernameAndPassword(username, md5passService.getEncryptedPass(password))

        if(testingUser){
            render((testingUser.role).role)
        }
        else{
            render("fail")
        }
    }
}
