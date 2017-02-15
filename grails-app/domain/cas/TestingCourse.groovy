package cas

class TestingCourse {
    static hasMany = [sections: TestingSection]
    TestingFaculty courseCoordinator
    String name

    static constraints = {
        courseCoordinator nullable: true
        sections nullable: true
        name nullable: false
    }
}
