package cas

class TestingFaculty {
    Integer id
    String fname
    String lname
    String mname
    String username
    String password
    TestingRole role
    String token
    long expiration
    Integer active
    String email

    static constraints = {
        fname nullable: true, maxSize: 45
        lname nullable: true, maxSize: 45
        mname nullable: true, maxSize: 45
        username nullable: false
        role nullable: true
        password nullable: false
        token nullable: true
        expiration nullable: true
        active nullable: true
        email nullable: true
    }
}
