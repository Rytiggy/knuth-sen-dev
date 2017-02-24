package cas

class TestingSection {
    Integer id
    TestingFaculty professor
    String title
    Integer active


    static constraints = {
        professor nullable: true
        title nullable: false
        active nullable: true
    }
}
