package cas

class TestingSection {
    TestingFaculty professor
    String title

    static constraints = {
        professor nullable: true
        title nullable: false
    }
}
