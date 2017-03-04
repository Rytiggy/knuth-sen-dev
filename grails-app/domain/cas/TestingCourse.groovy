package cas

class TestingCourse {
    Integer id
    static hasMany = [sections: TestingSection]
    TestingFaculty courseCoordinator
    String name
    String description
    Integer active

    static constraints = {
        courseCoordinator nullable: true
        sections nullable: true
        name nullable: false
        description nullable: true
        active nullable: true
    }
}
