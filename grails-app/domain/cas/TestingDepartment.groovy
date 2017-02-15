package cas

class TestingDepartment {
    TestingFaculty departmentCoordinator
    String name
    static hasMany = [courses: TestingCourse]

    static constraints = {
        courses nullable: true
        name nullable: false
        departmentCoordinator nullable: true
    }
}
