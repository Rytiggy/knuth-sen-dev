package cas

import grails.converters.JSON

class MainController {
    Md5passService md5passService
    TokenProviderService tokenProviderService
    PasswordRandomizerService passwordRandomizerService

    def index() {
    }

    def loadForms(){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else{
            expandExpiration(request.getHeader('Authorization'))
            def forms = TestingForm.findAll()
            render (template: "formsPage", model: [forms: forms])
        }
    };

    def loadAnalysis(){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else{
            expandExpiration(request.getHeader('Authorization'))
            def analysis = TestingAnalysis.findAll()
            render (template: "analysisPage", model: [analysis: analysis])
        }
    };

    def loadFaculty(){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else{
            expandExpiration(request.getHeader('Authorization'))
            def faculty = TestingFaculty.findAll()
            render (template: "adminFaculty", model: [faculty: faculty])
        }
    };

    def loadDepartment(){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else{
            expandExpiration(request.getHeader('Authorization'))
            def department = TestingDepartment.findAll()
            render (template: "adminDepartment", model: [department: department])
        }
    };

    def loadCourses(){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else{
            expandExpiration(request.getHeader('Authorization'))
            def courses = TestingCourse.findAll()
            render (template: "adminCourses", model: [courses: courses])
        }
    };

    def loadSections(){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else{
            expandExpiration(request.getHeader('Authorization'))
            render (template: "adminSections", model: [sections: TestingSection.findAll()])
        }
    };

    def loadFacultyCreation(){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            render(template: "adminCreateFaculty", model: [roles: TestingRole.findAll()])
        }
    }

    def loadDepartmentCreation(){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            render(template: "adminCreateDepartment", model: [faculty: TestingFaculty.findAll()])
        }
    }

    def loadCourseCreation(){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            render(template: "adminCreateCourse", model: [faculty: TestingFaculty.findAll(), departments: TestingDepartment.findAll()])
        }
    }

    def loadSectionCreation(){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            render(template: "adminCreateSection", model: [faculty: TestingFaculty.findAll(), courses: TestingCourse.findAll()])
        }
    }

    def loadFormCreation(){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            render(template: "formCreation")
        }
    }

    def loadAnalysisCreation(){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else {
            expandExpiration(request.getHeader('Authorization'))

            render(template: "analysisCreation", model: [forms: TestingForm.findAll()])
        }
    }

    def saveNewForm(String title, String question, String description, Integer automationDate){
        JSON resultJson
        TestingForm testingForm;
        testingForm = TestingForm.findByTitle(title);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (!testingForm) {
                testingForm = new TestingForm(title: title, question: question, description: description, creationDate: new Date().getDateString(), published: 0, automationDate: automationDate);
                if (testingForm.save(flush: true)) {
                    resultJson = [status: 0, message: "Success"] as JSON
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            } else {
                resultJson = [status: 2, message: "Error"] as JSON
            }
        }
        render(resultJson)
    }

    def saveNewSection(String title, String faculty, String course){
        JSON resultJson
        TestingSection testingSection;
        testingSection = TestingSection.findByTitle(title);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (!testingSection) {
                testingSection = new TestingSection(title: title, professor:TestingFaculty.findByUsername(faculty));

                if (testingSection.save(flush: true)) {
                    TestingCourse testingCourse = TestingCourse.findByName(course)

                    def sections = testingCourse.sections
                    sections.add(testingSection);

                    testingCourse.sections = sections
                    if (testingCourse.save(flush: true)) {
                        resultJson = [status: 0, message: "Success"] as JSON
                    } else {
                        resultJson = [status: 1, message: "Error"] as JSON
                    }
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            } else {
                resultJson = [status: 2, message: "Error"] as JSON
            }
        }
        render(resultJson)
    }

    def saveNewCourse(String faculty, String name, String department, String description){
        JSON resultJson
        TestingCourse testingCourse;
        testingCourse = TestingCourse.findByName(name);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (!testingCourse) {
                testingCourse = new TestingCourse(name: name, courseCoordinator: TestingFaculty.findByUsername(faculty), description: description);

                if (testingCourse.save(flush: true)) {
                    TestingDepartment testingDepartment = TestingDepartment.findByName(department)

                    def courses = testingDepartment.courses
                    courses.add(testingCourse);

                    testingDepartment.courses = courses
                    if (testingDepartment.save(flush: true)) {
                        resultJson = [status: 0, message: "Success"] as JSON
                    } else {
                        resultJson = [status: 1, message: "Error"] as JSON
                    }
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            } else {
                resultJson = [status: 2, message: "Error"] as JSON
            }
        }
        render(resultJson)
    }

    def saveNewFaculty(String fName, String mName, String lName, String username, String email, String role){
        JSON resultJson
        TestingFaculty testingFaculty;
        testingFaculty = TestingFaculty.findByUsername(username);

        String password = passwordRandomizerService.getRandomPass()

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (!testingFaculty) {
                testingFaculty = new TestingFaculty(fname: fName, mname: mName, lname: lName, username: username, email: email, role: TestingRole.findByRole(role), password: md5passService.getEncryptedPass(password));

                if (testingFaculty.save(flush: true)) {
                    resultJson = [status: 0, message: "Success"] as JSON
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            } else {
                resultJson = [status: 2, message: "Error"] as JSON
            }
        }
        render(resultJson)
    }

    def saveNewDepartment(String name, String faculty){
        JSON resultJson
        TestingDepartment testingDepartment;
        testingDepartment = TestingDepartment.findByName(name);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (!testingDepartment) {
                testingDepartment = new TestingDepartment(name: name, departmentCoordinator: TestingFaculty.findByUsername(faculty));

                if (testingDepartment.save(flush: true)) {
                    resultJson = [status: 0, message: "Success"] as JSON
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            } else {
                resultJson = [status: 2, message: "Error"] as JSON
            }
        }
        render(resultJson)
    }

    def loadFormEdit(int id){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            render(template: 'formEdit', model: [form: TestingForm.findById(id)]);
        }
    }

    def loadFacultyEdit(int id){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            render(template: 'adminEditFaculty', model: [faculty: TestingFaculty.findById(id), roles: TestingRole.findAll()]);
        }
    }

    def loadDepartmentEdit(int id){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            render(template: 'adminEditDepartment', model: [department: TestingDepartment.findById(id), faculty: TestingFaculty.findAll()]);
        }
    }

    def loadSectionEdit(int id){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            TestingSection testingSection = TestingSection.findById(id)

            def courses = TestingCourse.executeQuery("FROM TestingCourse as tc WHERE :section in elements(tc.sections)", [section : testingSection]);
            render(template: 'adminEditSection', model: [section: testingSection, faculty: TestingFaculty.findAll(), course:courses[0], courses: TestingCourse.findAll()]);
        }
    }

    def loadCourseEdit(int id){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            TestingCourse testingCourse = TestingCourse.findById(id)

            def departments = TestingDepartment.executeQuery("FROM TestingDepartment as td WHERE :course in elements(td.courses)", [course : testingCourse]);
            render(template: 'adminEditCourse', model: [course: testingCourse, faculty: TestingFaculty.findAll(), department:departments[0], departments: TestingDepartment.findAll()]);
        }
    }

    def loadExpiredSession(){
        render template: "expiredSession"
    }

    def disableFaculty(int id){
        JSON resultJson = [status: 1, message: "Error"] as JSON
        TestingFaculty testingFaculty;
        testingFaculty = TestingFaculty.findById(id);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (testingFaculty) {
                testingFaculty.active = 0;
                if (testingFaculty.save(flush: true)) {
                    resultJson = [status: 0, message: "Success"] as JSON
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            }
        }
        render(resultJson)
    }

    def enableDepartment(int id){
        JSON resultJson = [status: 1, message: "Error"] as JSON
        TestingDepartment testingDepartment;
        testingDepartment = TestingDepartment.findById(id);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (testingDepartment) {
                testingDepartment.active = 1;
                if (testingDepartment.save(flush: true)) {
                    resultJson = [status: 0, message: "Success"] as JSON
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            }
        }
        render(resultJson)
    }

    def disableDepartment(int id){
        JSON resultJson = [status: 1, message: "Error"] as JSON
        TestingDepartment testingDepartment;
        testingDepartment = TestingDepartment.findById(id);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (testingDepartment) {
                testingDepartment.active = 0;
                if (testingDepartment.save(flush: true)) {
                    resultJson = [status: 0, message: "Success"] as JSON
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            }
        }
        render(resultJson)
    }

    def enableCourse(int id){
        JSON resultJson = [status: 1, message: "Error"] as JSON
        TestingCourse testingCourse;
        testingCourse = TestingCourse.findById(id);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (testingCourse) {
                testingCourse.active = 1;
                if (testingCourse.save(flush: true)) {
                    resultJson = [status: 0, message: "Success"] as JSON
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            }
        }
        render(resultJson)
    }

    def disableCourse(int id){
        JSON resultJson = [status: 1, message: "Error"] as JSON
        TestingCourse testingCourse;
        testingCourse = TestingCourse.findById(id);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (testingCourse) {
                testingCourse.active = 0;
                if (testingCourse.save(flush: true)) {
                    resultJson = [status: 0, message: "Success"] as JSON
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            }
        }
        render(resultJson)
    }

    def enableFaculty(int id){
        JSON resultJson = [status: 1, message: "Error"] as JSON
        TestingFaculty testingFaculty;
        testingFaculty = TestingFaculty.findById(id);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (testingFaculty) {
                testingFaculty.active = 1;
                if (testingFaculty.save(flush: true)) {
                    resultJson = [status: 0, message: "Success"] as JSON
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            }
        }
        render(resultJson)
    }

    def disableSection(int id){
        JSON resultJson = [status: 1, message: "Error"] as JSON
        TestingSection testingSection;
        testingSection = TestingSection.findById(id);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (testingSection) {
                testingSection.active = 0;
                if (testingSection.save(flush: true)) {
                    resultJson = [status: 0, message: "Success"] as JSON
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            }
        }
        render(resultJson)
    }

    def enableSection(int id){
        JSON resultJson = [status: 1, message: "Error"] as JSON
        TestingSection testingSection;
        testingSection = TestingSection.findById(id);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (testingSection) {
                testingSection.active = 1;
                if (testingSection.save(flush: true)) {
                    resultJson = [status: 0, message: "Success"] as JSON
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            }
        }
        render(resultJson)
    }

    def saveEditForm(String title, String question, String description, int id, Integer automationDate){
        JSON resultJson
        TestingForm testingForm;
        testingForm = TestingForm.findByTitle(title);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (testingForm) {
                if (testingForm.id == id) {
                    testingForm.question = question;
                    testingForm.description = description;
                    testingForm.automationDate = automationDate;

                    if (testingForm.save(flush: true)) {
                        resultJson = [status: 0, message: "Success"] as JSON
                    } else {
                        resultJson = [status: 1, message: "Error"] as JSON
                    }
                } else {
                    resultJson = [status: 2, message: "Error"] as JSON
                }
            } else {
                testingForm = TestingForm.findById(id);

                testingForm.title = title;
                testingForm.question = question;
                testingForm.description = description;
                testingForm.automationDate = automationDate;
                if (testingForm.save(flush: true)) {
                    resultJson = [status: 0, message: "Success"] as JSON
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            }
        }
        render(resultJson)
    }

    def saveEditCourse(String name, String faculty, String department, String description, int id){
        JSON resultJson
        TestingCourse testingCourse;
        testingCourse = TestingCourse.findByName(name);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (testingCourse) {
                if (testingCourse.id == id) {
                    testingCourse.name = name;
                    testingCourse.courseCoordinator = TestingFaculty.findByUsername(faculty);
                    testingCourse.description = description

                    if (testingCourse.save(flush: true)) {
                        def departments = TestingDepartment.executeQuery("FROM TestingDepartment as td WHERE :course in elements(td.courses)", [course : testingCourse]);
                        def departmentCourses = departments[0].courses

                        departmentCourses.remove(testingCourse)

                        departments[0].courses = departmentCourses

                        if (departments[0].save(flush: true)) {
                            TestingDepartment testingDepartment = TestingDepartment.findByName(department)

                            def courses = testingDepartment.courses
                            courses.add(testingCourse);

                            testingDepartment.courses = courses

                            if (testingDepartment.save(flush: true)) {
                                resultJson = [status: 0, message: "Success"] as JSON
                            } else {
                                resultJson = [status: 1, message: "Error"] as JSON
                            }
                        } else {
                            resultJson = [status: 1, message: "Error"] as JSON
                        }
                    } else {
                        resultJson = [status: 1, message: "Error"] as JSON
                    }
                } else {
                    resultJson = [status: 2, message: "Error"] as JSON
                }
            } else {
                testingCourse = TestingCourse.findById(id);

                testingCourse.name = name;
                testingCourse.courseCoordinator = TestingFaculty.findByUsername(faculty);
                testingCourse.description = description
                if (testingCourse.save(flush: true)) {
                    def departments = TestingDepartment.executeQuery("FROM TestingDepartment as td WHERE :course in elements(td.courses)", [course : testingCourse]);
                    def departmentCourses = departments[0].courses

                    departmentCourses.remove(testingCourse)

                    departments[0].courses = departmentCourses

                    if (departments[0].save(flush: true)) {
                        TestingDepartment testingDepartment = TestingDepartment.findByName(department)

                        def courses = testingDepartment.courses
                        courses.add(testingCourse);

                        testingDepartment.courses = courses

                        if (testingDepartment.save(flush: true)) {
                            resultJson = [status: 0, message: "Success"] as JSON
                        } else {
                            resultJson = [status: 1, message: "Error"] as JSON
                        }
                    } else {
                        resultJson = [status: 1, message: "Error"] as JSON
                    }
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            }
        }
        render(resultJson)
    }

    def saveEditSection(String title, String faculty, String course, int id){
        JSON resultJson
        TestingSection testingSection;
        testingSection = TestingSection.findByTitle(title);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (testingSection) {
                if (testingSection.id == id) {
                    testingSection.title = title;
                    testingSection.professor = TestingFaculty.findByUsername(faculty);

                    if (testingSection.save(flush: true)) {
                        def courses = TestingCourse.executeQuery("FROM TestingCourse as tc WHERE :section in elements(tc.sections)", [section : testingSection]);
                        def courseSections = courses[0].sections

                        courseSections.remove(testingSection)

                        courses[0].sections = courseSections

                        if (courses[0].save(flush: true)) {
                            TestingCourse testingCourse = TestingCourse.findByName(course)

                            def sections = testingCourse.sections
                            sections.add(testingSection);

                            testingCourse.sections = sections

                            if (testingCourse.save(flush: true)) {
                                resultJson = [status: 0, message: "Success"] as JSON
                            } else {
                                resultJson = [status: 1, message: "Error"] as JSON
                            }
                        } else {
                            resultJson = [status: 1, message: "Error"] as JSON
                        }
                    } else {
                        resultJson = [status: 1, message: "Error"] as JSON
                    }
                } else {
                    resultJson = [status: 2, message: "Error"] as JSON
                }
            } else {
                testingSection = TestingSection.findById(id);

                testingSection.title = title;
                testingSection.professor = TestingFaculty.findByUsername(faculty);
                if (testingSection.save(flush: true)) {
                    def courses = TestingCourse.executeQuery("FROM TestingCourse as tc WHERE :section in elements(tc.sections)", [section : testingSection]);
                    def courseSections = courses[0].sections

                    courseSections.remove(testingSection)

                    courses[0].sections = courseSections

                    if (courses[0].save(flush: true)) {
                        TestingCourse testingCourse = TestingCourse.findByName(course)

                        def sections = testingCourse.sections
                        sections.add(testingSection);

                        testingCourse.sections = sections

                        if (testingCourse.save(flush: true)) {
                            resultJson = [status: 0, message: "Success"] as JSON
                        } else {
                            resultJson = [status: 1, message: "Error"] as JSON
                        }
                    } else {
                        resultJson = [status: 1, message: "Error"] as JSON
                    }
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            }
        }
        render(resultJson)
    }

    def saveEditDepartment(String name, String faculty, int id){
        JSON resultJson
        TestingDepartment testingDepartment;
        testingDepartment = TestingDepartment.findByName(name);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (testingDepartment) {
                if (testingDepartment.id == id) {
                    testingDepartment.name = name;
                    testingDepartment.departmentCoordinator = TestingFaculty.findByUsername(faculty);

                    if (testingDepartment.save(flush: true)) {
                        resultJson = [status: 0, message: "Success"] as JSON
                    } else {
                        resultJson = [status: 1, message: "Error"] as JSON
                    }
                } else {
                    resultJson = [status: 2, message: "Error"] as JSON
                }
            } else {
                testingDepartment = TestingDepartment.findById(id);

                testingDepartment.name = name;
                testingDepartment.departmentCoordinator = TestingFaculty.findByUsername(faculty);
                if (testingDepartment.save(flush: true)) {
                    resultJson = [status: 0, message: "Success"] as JSON
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            }
        }
        render(resultJson)
    }

    def saveEditFaculty(String fName, String mName, String lName, String username, String email, String role, int id){
        JSON resultJson
        TestingFaculty testingFaculty;
        testingFaculty = TestingFaculty.findByUsername(username);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (testingFaculty) {
                if (testingFaculty.id == id) {
                    testingFaculty.fname = fName;
                    testingFaculty.mname = mName;
                    testingFaculty.lname = lName;
                    testingFaculty.username = username;
                    testingFaculty.email = email;
                    testingFaculty.role = TestingRole.findByRole(role);

                    if (testingFaculty.save(flush: true)) {
                        resultJson = [status: 0, message: "Success"] as JSON
                    } else {
                        resultJson = [status: 1, message: "Error"] as JSON
                    }
                } else {
                    resultJson = [status: 2, message: "Error"] as JSON
                }
            } else {
                testingFaculty = TestingFaculty.findById(id);

                testingFaculty.fname = fName;
                testingFaculty.mname = mName;
                testingFaculty.lname = lName;
                testingFaculty.username = username;
                testingFaculty.email = email;
                testingFaculty.role = TestingRole.findByRole(role)
                if (testingFaculty.save(flush: true)) {
                    resultJson = [status: 0, message: "Success"] as JSON
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            }
        }
        render(resultJson)
    }

    def deleteForm(int id){
        TestingForm testingForm = TestingForm.findById(id);

        JSON resultJson

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (testingForm.delete(flush: true)) {
                resultJson = [status: 0, message: "Success"] as JSON
            } else {
                resultJson = [status: 1, message: "Error"] as JSON
            }
        }
        render resultJson
    }

    def loadingScreen(){
        render template: "loadingScreen"
    }

    def resetPasswordScreen(){
        render template: "resetPassword"
    }

    def resetPassword(String oldpassword, String newpassword, String confirmpassword){
        //get the username
        JSON resultJson;
        TestingFaculty testingUser = TestingFaculty.findByToken(request.getHeader('Authorization'));
        //TestingFaculty testingUser = TestingFaculty.findByUsernameAndPassword(username, md5passService.getEncryptedPass(password))
        //get the new password
        String comparUser = testingUser.username
        String comparPass = testingUser.password
        expandExpiration(request.getHeader('Authorization'))
        String testingoldpass = md5passService.getEncryptedPass(oldpassword)
        //may need to force them to be lowercase
        if (comparUser == testingUser.username){
            if(testingoldpass == comparPass){
                //int stringcountFornewpassword = confirmpassword.length();


                if(newpassword == confirmpassword){
                    testingUser.password = md5passService.getEncryptedPass(confirmpassword)
                    if (testingUser.save(flush: true)) {
                        resultJson = [status: 0, message: "Success"] as JSON
                    } else {
                        resultJson = [status: 1, message: "Error-username"] as JSON
                    }

                }
            }
        }
        //check the new password
        //overwrite the old password

    }

    def loadLogIn(){
        TestingFaculty testingUser

        testingUser = TestingFaculty.findByUsername("admin@admin.com")

        if(!testingUser){
            TestingRole testingRole = new TestingRole(role: "Wizard");
            TestingRole testingRole2 = new TestingRole(role: "Coordinator");
            TestingRole testingRole3 = new TestingRole(role: "Professor");

            testingRole.save(flush: true)
            testingRole2.save(flush: true)
            testingRole3.save(flush: true)

            testingUser = new TestingFaculty(fname: "Admin", lname: "Admin", username: "admin@admin.com", password: md5passService.getEncryptedPass("testing"), role: TestingRole.findById(1))
            TestingFaculty testingUser2 = new TestingFaculty(fname: "CourseCoord", lname: "CourseCoord", username: "coursecoord@coordinator.com", password: md5passService.getEncryptedPass("testing"), role: TestingRole.findById(2))
            TestingFaculty testingUser3 = new TestingFaculty(fname: "Professor", lname: "Professor", username: "professor@professor.com", password: md5passService.getEncryptedPass("testing"), role: TestingRole.findById(3))
            TestingFaculty testingUser4 = new TestingFaculty(fname: "Professor2", lname: "Professor2", username: "professor2@professor.com", password: md5passService.getEncryptedPass("testing"), role: TestingRole.findById(3))
            TestingFaculty testingUser5 = new TestingFaculty(fname: "Professor3", lname: "Professor3", username: "professor3@professor.com", password: md5passService.getEncryptedPass("testing"), role: TestingRole.findById(3))
            TestingFaculty testingUser6 = new TestingFaculty(fname: "DeptCoord", lname: "DeptCoord", username: "deptcoord@coordinator.com", password: md5passService.getEncryptedPass("testing"), role: TestingRole.findById(2))
            TestingFaculty testingUser7 = new TestingFaculty(fname: "DeptCoord2", lname: "DeptCoord2", username: "deptcoord2@coordinator.com", password: md5passService.getEncryptedPass("testing"), role: TestingRole.findById(2))

            testingUser.save(flush: true)
            testingUser2.save(flush: true)
            testingUser3.save(flush: true)
            testingUser4.save(flush: true)
            testingUser5.save(flush: true)
            testingUser6.save(flush: true)
            testingUser7.save(flush: true)

            TestingSection testingSection = new TestingSection(professor: testingUser, title: "testSec1");
            TestingSection testingSection2 = new TestingSection(professor: testingUser4, title: "testSec2");
            TestingSection testingSection3 = new TestingSection(professor: testingUser5, title: "testSec1");

            testingSection.save(flush: true)
            testingSection2.save(flush: true)
            testingSection3.save(flush: true)

            TestingCourse testingCourse = new TestingCourse(name: "TestCourse1", courseCoordinator: testingUser2, sections: [testingSection, testingSection2]);
            TestingCourse testingCourse2 = new TestingCourse(name: "TestCourse2", courseCoordinator: testingUser2, sections: [testingSection3]);
            TestingCourse testingCourse3 = new TestingCourse(name: "TestCourse3", sections: [testingSection3]);
            TestingCourse testingCourse4 = new TestingCourse(name: "TestCourse4", sections: [testingSection3]);

            testingCourse.save(flush: true)
            testingCourse2.save(flush: true)
            testingCourse3.save(flush: true)
            testingCourse4.save(flush: true)

            TestingDepartment testingDepartment = new TestingDepartment(name: "TestDept1", courses: [testingCourse, testingCourse2], departmentCoordinator: testingUser6);
            TestingDepartment testingDepartment2 = new TestingDepartment(name: "TestDept2", courses: [testingCourse3, testingCourse4], departmentCoordinator: testingUser7);

            testingDepartment.save(flush: true)
            testingDepartment2.save(flush: true)
        }
        render template: 'loginPage'
    }

    def login(String username, String password){

        TestingFaculty testingFaculty = TestingFaculty.findByUsernameAndPassword(username, md5passService.getEncryptedPass(password))

        if(testingFaculty){
            String token = tokenProviderService.getToken()
            testingFaculty.token = token
            testingFaculty.expiration = System.currentTimeMillis() + 600000 //current time + 10 minutes

            testingFaculty.save(flush: true)

            render([role:(testingFaculty.role).role, token:token, name: testingFaculty.fname + " " + testingFaculty.lname] as JSON)
        }
        else{
            render("fail")
        }
    }

    def getRole(){

        JSON resultJson

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status:0, message:"Expired"] as JSON
        }
        else{
            TestingFaculty testingFaculty = TestingFaculty.findByToken(request.getHeader('Authorization'))

            expandExpiration(request.getHeader('Authorization'))

            resultJson = [status:1, message:"Valid", role: (testingFaculty.role).role, name: testingFaculty.fname + " " + testingFaculty.lname] as JSON
        }

        render resultJson
    }

    private expandExpiration(String token){
        TestingFaculty testingFaculty = TestingFaculty.findByToken(token)

        testingFaculty.expiration = System.currentTimeMillis() + 600000 //current time + 10 minutes

        testingFaculty.save(flush: true)
    }

    private checkExpiration(String token){
        TestingFaculty testingFaculty = TestingFaculty.findByToken(token)

        if(!testingFaculty){
            return true
        }

        if(testingFaculty.expiration < System.currentTimeMillis()){
            return true
        }
        else {
            return false
        }
    }

    def loadFormPublishing(int id) {
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else{
            expandExpiration(request.getHeader('Authorization'))
            def departments = TestingDepartment.findAll();
            render (template: "formPublish", model: [departments: departments, id: id])}
    };

    private notifyUser(String username){
        sendMail {
            to username
            subject "CAS SENTIENCE"
            body 'SOON '
        }
    }

    def loadDepartmentCourses(String departmentName) {
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            TestingDepartment testingDepartment = TestingDepartment.findByName(departmentName);
            render(template: 'formPublishingCourses', model: [courses: testingDepartment.courses]);
        }
    }

    def loadStoredGrades(Integer id) {
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            render(template: 'analysisCreationStoredGrades', model: [storedGradeItem: TestingGradeStore.findAllByForForm(TestingForm.findById(id))]);
        }
    }

    def publishForm(String courseName, int id) {

        JSON resultJson;

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))

            TestingForm testingForm = TestingForm.findById(id);

            if (testingForm) {
                testingForm.published = 1;
                testingForm.course = TestingCourse.findByName(courseName);
                testingForm.publishDate = new Date().getDateString();

                if (testingForm.save(flush: true)) {
                    resultJson = [status: 0, message: "Success"] as JSON
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            } else {
                resultJson = [status: 1, message: "Error"] as JSON
            }
        }
        //todo notify professors that they have forms waiting
        render(resultJson);
    }

    def unpublishForm(Integer id){
        JSON resultJson = [status: 1, message: "Error"] as JSON
        TestingForm testingForm;
        testingForm = TestingForm.findById(id);

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (testingForm) {
                testingForm.published = 0;
                if (testingForm.save(flush: true)) {
                    resultJson = [status: 0, message: "Success"] as JSON
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            }
        }
        render(resultJson)
    }

    def copyFormEdit(int id){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            render(template: 'formCopy', model: [form: TestingForm.findById(id)]);
        }
    }

    def loadUserForms(){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else{
            expandExpiration(request.getHeader('Authorization'))

            TestingFaculty currentUser = TestingFaculty.findByToken(request.getHeader('Authorization'));

            def allForms = TestingForm.findAllByPublished(1)
            def forms = []
            def sections = []

            for(TestingForm tf in allForms){
                for(TestingSection ts in tf.course.sections){
                    if(ts.professor == currentUser){
                        forms.add(tf)
                        sections.add(ts)
                    }
                }
            }

            def users = []
            def assessmentCoordinators = TestingFaculty.findAllByRole(TestingRole.findById(1))

            assessmentCoordinators.each{
                users.add(it)
            }

            render (template: "listAvailableForms", model: [forms: forms, sections: sections, assessmentCoordinators:assessmentCoordinators])
        }
    };

    def loadDataInput(int id, int sectionId){
        if(checkExpiration(request.getHeader('Authorization'))){
            render template: "expiredSession"
        }
        else {

            expandExpiration(request.getHeader('Authorization'))
            render(template: 'dataInput', model: [id: id, sectionId: sectionId, cName:TestingForm.findById(id).course.name, sTitle:TestingSection.findById(sectionId).title]);
        }
    }

    def saveGradeData(Integer id, String grades, Integer sectionId, Integer gradeRange){
        JSON resultJson
        TestingForm testingForm;
        testingForm = TestingForm.findById(id);
        TestingFaculty testingFaculty = TestingFaculty.findByToken(request.getHeader('Authorization'));
        TestingGradeStore testingGradeStore = TestingGradeStore.findByForFormAndStoredBy(testingForm, testingFaculty);
        Date now = new Date();

        if(checkExpiration(request.getHeader('Authorization'))){
            resultJson = [status: 5, message: "Expired"] as JSON
        }
        else {
            expandExpiration(request.getHeader('Authorization'))
            if (testingGradeStore) {
                if (testingForm.id == id) {
                    testingGradeStore.grades = grades;
                    testingGradeStore.gradeRange = gradeRange;
                    testingGradeStore.storeDate = now.getDateString();

                    if (testingGradeStore.save(flush: true)) {
                        resultJson = [status: 0, message: "Success"] as JSON
                    } else {
                        resultJson = [status: 1, message: "Error"] as JSON
                    }
                } else {
                    resultJson = [status: 2, message: "Error"] as JSON
                }
            } else {

                testingGradeStore = new TestingGradeStore(grades: grades, forForm: testingForm, forSection: TestingSection.findById(sectionId), storedBy: testingFaculty, storeDate: now.getDateString(), gradeRange: gradeRange)

                if (testingGradeStore.save(flush: true)) {
                    resultJson = [status: 0, message: "Success"] as JSON
                } else {
                    resultJson = [status: 1, message: "Error"] as JSON
                }
            }
        }
        render(resultJson)
    }

    protected static findFormsToRepublish(){

        def allPublishedForms = TestingForm.findAllByPublished(1)
        def toRepublish = []

        allPublishedForms.each {

            Date d = new Date(it.publishDate)
            Date currentD = new Date()

            if((currentD.getYear()>d.getYear())&&(currentD.getMonth()+1>=it.automationDate)){
                toRepublish.push(it)
            }
        }

        republishForms(toRepublish)
    }

    protected static republishForms(toRepublish){
        def arrProf = [];
        def arrCouSec = [];
        toRepublish.each {
            TestingForm form = it;
            it.publishDate = new Date().getDateString();
            it.save(flush: true);

            for(TestingSection ts in form.course.sections) {
                arrCouSec.add(form.course.name + " - " + ts.title);
                arrProf.add(ts.professor);
            }
        }
        //todo notify professors that they have forms waiting

        //publishEmail(arrProf, arrCouSec);
    }

    protected static publishEmail(professors, courseSections){
            professors.eachWithIndex { professor, index ->
            sendMail {
                to professor.email
                subject "Published Template For " + courseSections[index]
                html g.render(template:'/main/formPublishMail', model:[lname: professor.lName])
            }
        }
    }

}

