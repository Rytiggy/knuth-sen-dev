package cas

class TestingForm {
    Integer id
    String title
    String question
    String description
    Integer published
    String publishDate
    String creationDate
    TestingCourse course


    static constraints = {
        publishDate nullable: true, maxSize: 100
        creationDate nullable: true, maxSize: 100
        title nullable: true
        question nullable: true
        description nullable: true
        published nullable: true
        course nullable: true
    }
}
