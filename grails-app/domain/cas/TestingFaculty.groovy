package cas

class TestingFaculty {
    String fname
    String lname
    String mname
    String username
    String password
    TestingRole role

    static constraints = {
        fname nullable: true, maxSize: 45
        lname nullable: true, maxSize: 45
        mname nullable: true, maxSize: 45
        username nullable: false
        role nullable: true
        password nullable: false
    }
}
