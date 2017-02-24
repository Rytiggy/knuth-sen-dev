package cas

class TestingDepartment {
    TestingFaculty departmentCoordinator
    String name
    static hasMany = [courses: TestingCourse]
    Integer id
    Integer active
    static constraints = {
        courses nullable: true
        name nullable: false
        departmentCoordinator nullable: true
        active nullable: true
    }
}
