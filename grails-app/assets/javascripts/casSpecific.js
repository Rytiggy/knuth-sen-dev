/**
 * Created by asuta on 22-Feb-17.
 */
// /knuth-sen-dev/main/login
function showLoginBtn(){
    Cookies.remove('token');
    $('.navbar-header').css("visibility", "");
    $('.userLocation').html("USERNAME");
    $('.userLocation').css("display", "none");
    $('.hideMe').css("display", "");

    //hides admin nav maintains height
    $('.secondNav li a ').css("display", "none");
    $('.secondNav').css("height", "36px");
}

function loadExpiredSession(){
    $('#mainContainer').empty();
    $.ajax({
        url: "/knuth-sen-dev/main/loadExpiredSession",
        success: function (data) {
            $('#mainContainer').append(data);
            showLoginBtn();
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
        }
    });
}

function loadLogInPage(){
    $('#mainContainer').empty();

    $('.secondNav').css("visibility", "hidden");
    Cookies.remove('token');

    $.ajax({
        url: "/knuth-sen-dev/main/loadLogIn",
        success: function (data) {
            $('#mainContainer').append(data);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
        }
    });
}

function deleteForm(that){
    var id = $(that).parent().find('.hiddenId').html();

    $.ajax({
        url: "/knuth-sen-dev/main/deleteForm",
        headers: {
            'Authorization':Cookies.get('token')
        },
        type: "POST",
        data:{
            id:id
        },
        success: function (data) {
            if(data.status===5){
                loadExpiredSession();
            }
            else{
                loadForms();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
            loadForms();
        }
    });
}

function saveNewForm(){
    var title = $('.titleInput').val();
    var creationDate = new Date()
    var question = $('.questionInput').val();
    var description = $('.descriptionTextArea').val();

    title = cleanData(title);
    question = cleanData(question);
    description = cleanData(description);


    if(title == "" || question == "" || description == ""){
        $.growl.warning({ message: "Please input all data" });
    }
    else {
        $.ajax({
            url: "/knuth-sen-dev/main/saveNewForm",
            headers: {
                'Authorization': Cookies.get('token')
            },
            type: "POST",
            data: {
                title: title,
                question: question,
                description: description,
                creationDate: creationDate.getMonth() + 1 + ". " + creationDate.getDate() + ". " + creationDate.getFullYear() + "."
            },
            success: function (data) {
                if (data.status === 2) {
                    $.growl.warning({message: "Assessment form with that title already exists"});
                }
                else if (data.status === 5) {
                    loadExpiredSession();
                }
                else {
                    loadForms();
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
                loadForms();
            }
        });
    }
}

function saveEditForm(){
    var title = $('.titleInput').val();
    var question = $('.questionInput').val();
    var description = $('.descriptionTextArea').val();

    title = cleanData(title);
    question = cleanData(question);
    description = cleanData(description);

    if(title == "" || question == "" || description == ""){
        $.growl.warning({ message: "Please input all data" });
    }
    else {
        var id = $('.card-block').find('.hiddenId').html();
        $.ajax({
            url: "/knuth-sen-dev/main/saveEditForm",
            headers: {
                'Authorization': Cookies.get('token')
            },
            type: "POST",
            data: {
                title: title,
                question: question,
                description: description,
                id: id
            },
            success: function (data) {
                if (data.status === 2) {
                    $.growl.warning({message: "Assessment form with that title already exists"});
                }
                else if (data.status === 5) {
                    loadExpiredSession();
                }
                else {
                    loadForms();
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
                loadForms();
            }
        });
    }
}

function saveEditCourse(){
    var name = null;
    var faculty = null;
    var department = null;
    var description = null;

    faculty = document.getElementById('option_box').value;
    department = document.getElementById('option_boxBelongsTo').value;
    name = $('.courseNameInput').val();
    description = $('.descriptionTextArea').val();

    name = cleanData(name);
    description = cleanData(description);

    if(faculty == "" || department == "" || name == "" || description == ""){
        $.growl.warning({ message: "Please input all data" });
    }
    else {
        var id = $('.card-block').find('.hiddenId').html();

        $.ajax({
            url: "/knuth-sen-dev/main/saveEditCourse",
            headers: {
                'Authorization': Cookies.get('token')
            },
            type: "POST",
            data: {
                name: name,
                faculty: faculty,
                department: department,
                description: description,
                id: id
            },
            success: function (data) {
                if (data.status === 2) {
                    $.growl.warning({message: "Section with that title already exists"});
                }
                else if (data.status === 5) {
                    loadExpiredSession();
                }
                else {
                    loadAdminCourses();
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
                loadAdminCourses();
            }
        });
    }
}

function saveEditDepartment(){
    var name = null;
    var faculty = null;

    faculty = document.getElementById('option_box').value;
    name = $('.departmentNameInput').val();

    name = cleanData(name);

    if(faculty == "" || name == ""){
        $.growl.warning({ message: "Please input all data" });
    }
    else {
        var id = $('.card-block').find('.hiddenId').html();

        $.ajax({
            url: "/knuth-sen-dev/main/saveEditDepartment",
            headers: {
                'Authorization': Cookies.get('token')
            },
            type: "POST",
            data: {
                name: name,
                faculty: faculty,
                id: id
            },
            success: function (data) {
                if (data.status === 2) {
                    $.growl.warning({message: "Section with that title already exists"});
                }
                else if (data.status === 5) {
                    loadExpiredSession();
                }
                else {
                    loadAdminDepartments();
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
                loadAdminDepartments();
            }
        });
    }
}

function saveEditSection(){
    var title = null;
    var faculty = null;
    var course = null;

    course = document.getElementById('option_boxBelongsTo').value;
    faculty = document.getElementById('option_box').value;
    title = $('.sectionTitleInput').val();

    title = cleanData(title);

    if(faculty == "" || course == "" || title == ""){
        $.growl.warning({ message: "Please input all data" });
    }
    else {
        var id = $('.card-block').find('.hiddenId').html();

        $.ajax({
            url: "/knuth-sen-dev/main/saveEditSection",
            headers: {
                'Authorization': Cookies.get('token')
            },
            type: "POST",
            data: {
                title: title,
                faculty: faculty,
                course: course,
                id: id
            },
            success: function (data) {
                if (data.status === 2) {
                    $.growl.warning({message: "Section with that title already exists"});
                }
                else if (data.status === 5) {
                    loadExpiredSession();
                }
                else {
                    loadAdminSections();
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
                loadAdminSections();
            }
        });
    }
}

function saveEditFaculty(){
    var fName = null;
    var mName = null;
    var lName = null;
    var username = null;
    var email = null;

    var role = null;

    role = document.getElementById('option_box').value;
    fName = $('.firstNameInput').val();
    mName = $('.middleNameInput').val();
    lName = $('.lastNameInput').val();
    username = $('.usernameInput').val();
    email = $('.emailInput').val();

    fName = cleanData(fName);
    mName = cleanData(mName);
    lName = cleanData(lName);
    username = cleanData(username);
    email = cleanData(email);

    if(role == "" || fName == "" || mName == "" || lName == "" || username == "" || email == ""){
        $.growl.warning({ message: "Please input all data" });
    }
    else {
        var id = $('.card-block').find('.hiddenId').html();

        $.ajax({
            url: "/knuth-sen-dev/main/saveEditFaculty",
            headers: {
                'Authorization': Cookies.get('token')
            },
            type: "POST",
            data: {
                fName: fName,
                mName: mName,
                lName: lName,
                username: username,
                email: email,
                role: role,
                id: id
            },
            success: function (data) {
                if (data.status === 2) {
                    $.growl.warning({message: "Faculty member with that username already exists"});
                }
                else if (data.status === 5) {
                    loadExpiredSession();
                }
                else {
                    loadAdminFaculty();
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
                loadForms();
            }
        });
    }
}

function loadFormEdit(that){
    $('#mainContainer').empty();

    var id = $(that).parent().find('.hiddenId').html();

    $.ajax({
        url: "/knuth-sen-dev/main/loadFormEdit",
        headers: {
            'Authorization':Cookies.get('token')
        },
        type: "POST",
        data:{
            id:id
        },
        success: function (data) {
            $('#mainContainer').append(data);
            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
            loadForms();
        }
    });
}

function loadCourseEdit(that){
    $('#mainContainer').empty();

    var id = $(that).parent().find('.hiddenId').html();

    $.ajax({
        url: "/knuth-sen-dev/main/loadCourseEdit",
        headers: {
            'Authorization':Cookies.get('token')
        },
        type: "POST",
        data:{
            id:id
        },
        success: function (data) {
            $('#mainContainer').append(data);
            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
            loadAdminCourses();
        }
    });
}

function loadDepartmentEdit(that){
    $('#mainContainer').empty();

    var id = $(that).parent().find('.hiddenId').html();

    $.ajax({
        url: "/knuth-sen-dev/main/loadDepartmentEdit",
        headers: {
            'Authorization':Cookies.get('token')
        },
        type: "POST",
        data:{
            id:id
        },
        success: function (data) {
            $('#mainContainer').append(data);
            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
            loadAdminDepartments();
        }
    });
}

function loadSectionEdit(that){
    $('#mainContainer').empty();

    var id = $(that).parent().find('.hiddenId').html();

    $.ajax({
        url: "/knuth-sen-dev/main/loadSectionEdit",
        headers: {
            'Authorization':Cookies.get('token')
        },
        type: "POST",
        data:{
            id:id
        },
        success: function (data) {
            $('#mainContainer').append(data);
            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
            loadAdminSections();
        }
    });
}

function loadFacultyEdit(that){
    $('#mainContainer').empty();

    var id = $(that).parent().find('.hiddenId').html();

    $.ajax({
        url: "/knuth-sen-dev/main/loadFacultyEdit",
        headers: {
            'Authorization':Cookies.get('token')
        },
        type: "POST",
        data:{
            id:id
        },
        success: function (data) {
            $('#mainContainer').append(data);
            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
            loadAdminFaculty();
        }
    });
}

function disableSection(that){
    $('#mainContainer').empty();

    var id = $(that).parent().find('.hiddenId').html();

    $.ajax({
        url: "/knuth-sen-dev/main/disableSection",
        headers: {
            'Authorization':Cookies.get('token')
        },
        type: "POST",
        data:{
            id:id
        },
        success: function (data) {
            $('#mainContainer').append(data);
            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
            else{
                loadAdminSections();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
            loadAdminSections();
        }
    });
}

function enableCourse(that){
    $('#mainContainer').empty();

    var id = $(that).parent().find('.hiddenId').html();

    $.ajax({
        url: "/knuth-sen-dev/main/enableCourse",
        headers: {
            'Authorization':Cookies.get('token')
        },
        type: "POST",
        data:{
            id:id
        },
        success: function (data) {
            $('#mainContainer').append(data);
            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
            else{
                loadAdminCourses();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
            loadAdminCourses();
        }
    });
}

function disableCourse(that){
    $('#mainContainer').empty();

    var id = $(that).parent().find('.hiddenId').html();

    $.ajax({
        url: "/knuth-sen-dev/main/disableCourse",
        headers: {
            'Authorization':Cookies.get('token')
        },
        type: "POST",
        data:{
            id:id
        },
        success: function (data) {
            $('#mainContainer').append(data);
            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
            else{
                loadAdminCourses();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
            loadAdminCourses();
        }
    });
}

function enableSection(that){
    $('#mainContainer').empty();

    var id = $(that).parent().find('.hiddenId').html();

    $.ajax({
        url: "/knuth-sen-dev/main/enableSection",
        headers: {
            'Authorization':Cookies.get('token')
        },
        type: "POST",
        data:{
            id:id
        },
        success: function (data) {
            $('#mainContainer').append(data);
            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
            else{
                loadAdminSections();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
            loadAdminSections();
        }
    });
}

function disableFaculty(that){
    $('#mainContainer').empty();

    var id = $(that).parent().find('.hiddenId').html();

    $.ajax({
        url: "/knuth-sen-dev/main/disableFaculty",
        headers: {
            'Authorization':Cookies.get('token')
        },
        type: "POST",
        data:{
            id:id
        },
        success: function (data) {
            $('#mainContainer').append(data);
            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
            else{
                loadAdminFaculty();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
            loadAdminFaculty();
        }
    });
}

function enableDepartment(that){
    $('#mainContainer').empty();

    var id = $(that).parent().find('.hiddenId').html();

    $.ajax({
        url: "/knuth-sen-dev/main/enableDepartment",
        headers: {
            'Authorization':Cookies.get('token')
        },
        type: "POST",
        data:{
            id:id
        },
        success: function (data) {
            $('#mainContainer').append(data);
            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
            else{
                loadAdminDepartments();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
            loadAdminDepartments();
        }
    });
}

function disableDepartment(that){
    $('#mainContainer').empty();

    var id = $(that).parent().find('.hiddenId').html();

    $.ajax({
        url: "/knuth-sen-dev/main/disableDepartment",
        headers: {
            'Authorization':Cookies.get('token')
        },
        type: "POST",
        data:{
            id:id
        },
        success: function (data) {
            $('#mainContainer').append(data);
            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
            else{
                loadAdminDepartments();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
            loadAdminDepartments();
        }
    });
}

function enableFaculty(that){
    $('#mainContainer').empty();

    var id = $(that).parent().find('.hiddenId').html();

    $.ajax({
        url: "/knuth-sen-dev/main/enableFaculty",
        headers: {
            'Authorization':Cookies.get('token')
        },
        type: "POST",
        data:{
            id:id
        },
        success: function (data) {
            $('#mainContainer').append(data);
            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
            else{
                loadAdminFaculty();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
            loadAdminFaculty();
        }
    });
}

function loadAdminSections(){
    $('#mainContainer').empty();

    $.ajax({
        url: "/knuth-sen-dev/main/loadSections",
        headers: {
            'Authorization':Cookies.get('token')
        },
        success: function (data) {
            $('#mainContainer').append(data);

            if($('#mainContainer').find('.formsDisplayTable')){
                if($('.sectionsDisplayTable').length){
                    $('.sectionsDisplayTable').DataTable();
                    // $('[data-toggle="tooltip"]').tooltip();
                }
                else{
                    showLoginBtn();
                }
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
        }
    });
}

function loadAdminCourses(){
    $('#mainContainer').empty();

    $.ajax({
        url: "/knuth-sen-dev/main/loadCourses",
        headers: {
            'Authorization':Cookies.get('token')
        },
        success: function (data) {
            $('#mainContainer').append(data);

            if($('#mainContainer').find('.formsDisplayTable')){
                if($('.coursesDisplayTable').length){
                    $('.coursesDisplayTable').DataTable();
                    $('[data-toggle="tooltip"]').tooltip();
                }
                else{
                    showLoginBtn();
                }
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
        }
    });
}

function loadAdminDepartments(){
    $('#mainContainer').empty();

    $.ajax({
        url: "/knuth-sen-dev/main/loadDepartment",
        headers: {
            'Authorization':Cookies.get('token')
        },
        success: function (data) {
            $('#mainContainer').append(data);

            if($('#mainContainer').find('.formsDisplayTable')){
                if($('.departmentDisplayTable').length){
                    $('.departmentDisplayTable').DataTable();
                    // $('[data-toggle="tooltip"]').tooltip();
                }
                else{
                    showLoginBtn();
                }
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
        }
    });
}

function loadAdminFaculty(){
    $('#mainContainer').empty();

    $.ajax({
        url: "/knuth-sen-dev/main/loadFaculty",
        headers: {
            'Authorization':Cookies.get('token')
        },
        success: function (data) {
            $('#mainContainer').append(data);

            if($('#mainContainer').find('.formsDisplayTable')){
                if($('.formsDisplayTable').length){
                    $('.formsDisplayTable').DataTable();
                    // $('[data-toggle="tooltip"]').tooltip();
                }
                else{
                    showLoginBtn();
                }
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
        }
    });
}

function loadSectionCreation(){
    $('#mainContainer').empty();

    $.ajax({
        url: "/knuth-sen-dev/main/loadSectionCreation",
        headers: {
            'Authorization':Cookies.get('token')
        },
        success: function (data) {
            $('#mainContainer').append(data);

            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
        }
    });
}

function loadCourseCreation(){
    $('#mainContainer').empty();

    $.ajax({
        url: "/knuth-sen-dev/main/loadCourseCreation",
        headers: {
            'Authorization':Cookies.get('token')
        },
        success: function (data) {
            $('#mainContainer').append(data);

            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
        }
    });
}

function loadFacultyCreation(){
    $('#mainContainer').empty();

    $.ajax({
        url: "/knuth-sen-dev/main/loadFacultyCreation",
        headers: {
            'Authorization':Cookies.get('token')
        },
        success: function (data) {
            $('#mainContainer').append(data);

            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
        }
    });
}

function loadDepartmentCreation(){
    $('#mainContainer').empty();

    $.ajax({
        url: "/knuth-sen-dev/main/loadDepartmentCreation",
        headers: {
            'Authorization':Cookies.get('token')
        },
        success: function (data) {
            $('#mainContainer').append(data);

            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
        }
    });
}

function saveNewCourse() {
    var name = null;
    var faculty = null;
    var department = null;
    var description = null;

    faculty = document.getElementById('option_box').value;
    department = document.getElementById('option_boxBelongsTo').value;
    name = $('.courseNameInput').val();
    description = $('.descriptionTextArea').val();

    name = cleanData(name);
    description = cleanData(description);

    if(name == "" || faculty == "" || department == "" || description == ""){
        $.growl.warning({ message: "Please input all data" });
    }
    else {
        $.ajax({
            url: "/knuth-sen-dev/main/saveNewCourse",
            headers: {
                'Authorization': Cookies.get('token')
            },
            type: "POST",
            data: {
                faculty: faculty,
                name: name,
                department: department,
                description: description
            },
            success: function (data) {
                if (data.status === 2) {
                    $.growl.warning({message: "Section with that title already exists"});
                }
                else if (data.status === 5) {
                    loadExpiredSession();
                }
                else {
                    loadAdminCourses();
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
                loadAdminCourses();
            }
        });
    }
}

function saveNewSection() {
    var title = null;
    var faculty = null;
    var course = null;

    faculty = document.getElementById('option_box').value;
    course = document.getElementById('option_boxBelongsTo').value;
    title = $('.sectionTitleInput').val();

    title = cleanData(title);

    if(title == "" || faculty == "" || course == ""){
        $.growl.warning({ message: "Please input all data" });
    }
    else {
        $.ajax({
            url: "/knuth-sen-dev/main/saveNewSection",
            headers: {
                'Authorization': Cookies.get('token')
            },
            type: "POST",
            data: {
                faculty: faculty,
                title: title,
                course: course
            },
            success: function (data) {
                if (data.status === 2) {
                    $.growl.warning({message: "Section with that title already exists"});
                }
                else if (data.status === 5) {
                    loadExpiredSession();
                }
                else {
                    loadAdminSections();
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
                loadAdminSections();
            }
        });
    }
}

function saveNewDepartment() {
    var name = null;
    var faculty = null;

    faculty = document.getElementById('option_box').value;
    name = $('.departmentNameInput').val();

    name = cleanData(name);

    if(name == "" || faculty == ""){
        $.growl.warning({ message: "Please input all data" });
    }
    else {
        $.ajax({
            url: "/knuth-sen-dev/main/saveNewDepartment",
            headers: {
                'Authorization': Cookies.get('token')
            },
            type: "POST",
            data: {
                name: name,
                faculty: faculty,
            },
            success: function (data) {
                if (data.status === 2) {
                    $.growl.warning({message: "Faculty with that username already exists"});
                }
                else if (data.status === 5) {
                    loadExpiredSession();
                }
                else {
                    loadAdminDepartments();
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
                loadAdminDepartments();
            }
        });
    }
}
function saveNewFaculty() {
    var fName = null;
    var mName = null;
    var lName = null;
    var username = null;
    var email = null;

    var role = null;

    role = document.getElementById('option_box').value;
    fName = $('.firstNameInput').val();
    mName = $('.middleNameInput').val();
    lName = $('.lastNameInput').val();
    username = $('.usernameInput').val();
    email = $('.emailInput').val();

    fName = cleanData(fName);
    mName = cleanData(mName);
    lName = cleanData(lName);
    username = cleanData(username);
    email = cleanData(email);

    if(role == "" || fName == "" || mName == "" || lName == "" || username == ""  || email == ""){
        $.growl.warning({ message: "Please input all data" });
    }
    else {
        $.ajax({
            url: "/knuth-sen-dev/main/saveNewFaculty",
            headers: {
                'Authorization': Cookies.get('token')
            },
            type: "POST",
            data: {
                fName: fName,
                mName: mName,
                lName: lName,
                username: username,
                email: email,
                role: role
            },
            success: function (data) {
                if (data.status === 2) {
                    $.growl.warning({message: "Faculty with that username already exists"});
                }
                else if (data.status === 5) {
                    loadExpiredSession();
                }
                else {
                    loadAdminFaculty();
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
                loadAdminFaculty();
            }
        });
    }
}

function attemptLogin(){
    var username = $('.usernameInput').val();
    var password = $('.passwordInput').val();

    $('#mainContainer').empty();
    $.ajax({
        url: "/knuth-sen-dev/main/login",
        type: "POST",
        data:{
            username:username,
            password:password
        },
        success: function (data) {
            if(data.role) {
                Cookies.set('token', data.token, {expires: 1});
                displayOptions(data.role, data.name);
            }
            else{
                $.growl.warning({ message: "Login failed" });
                loadLogInPage()
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
        }
    });
}

function loadFormCreation(){
    $('#mainContainer').empty();
    $.ajax({
        url: "/knuth-sen-dev/main/loadFormCreation",
        headers: {
            'Authorization':Cookies.get('token')
        },
        success: function (data) {
            $('#mainContainer').append(data);

            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
        }
    });
}

function loadForms(){
    $('#mainContainer').empty();

    $.ajax({
        url: "/knuth-sen-dev/main/loadForms",
        headers: {
            'Authorization':Cookies.get('token')
        },
        success: function (data) {
            $('#mainContainer').append(data);

            if($('#mainContainer').find('.formsDisplayTable')){
                if($('.formsDisplayTable').length){
                    $('.formsDisplayTable').DataTable();
                    $('[data-toggle="tooltip"]').tooltip();
                }
                else{
                    showLoginBtn();
                }
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
        }
    });
}

function loadLoadingScreen(){
    $('#mainContainer').empty();

    $.ajax({
        url: "/knuth-sen-dev/main/loadingScreen",
        success: function (data) {
            $('#mainContainer').append(data);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
        }
    });
}

function checkLoginStatus(token){
    $.ajax({
        url: "/knuth-sen-dev/main/getRole",
        type: "GET",
        headers: {
            'Authorization':token
        },
        success: function (data) {
            if(data.status===0){
                Cookies.remove('token');
                loadExpiredSession();
            }
            else if (data.status===1) {
                displayOptions(data.role, data.name);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
        }
    });
}

function displayOptions(role, name){
    if(role==="Wizard"){
        $('.secondNav').css("visibility", "");
        $('.userLocation').html(name);
        $('.userLocation').css("display", "");
        $('.hideMe').css("display", "none");
        $('.secondNav li a ').css("display", "block");

        loadForms();
    }
    else{
        $.growl.warning({ message: "Unrecognized user" });
        Cookies.remove('token');
        loadLogInPage();
    }
}

function loadFormPublishing(that){
    $('.modal-body').empty();
    $('#myModalLabel').html("Publishing Forms");

    var id = $(that).parent().find('.hiddenId').html();

    $.ajax({
        url: "/knuth-sen-dev/main/loadFormPublishing",
        type: "POST",
        headers: {
            'Authorization': Cookies.get('token')
        },
        data:{
            id:id
        },
        success: function (data) {
            $('.modal-body').append(data);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
        }
    });
}

function loadDepartmentCourses(){

    var departmentName = document.getElementById('option_boxDepartments').value;

    $('#courseList').empty();
    $.ajax({
        url: "/knuth-sen-dev/main/loadDepartmentCourses",
        type: "POST",
        headers: {
            'Authorization': Cookies.get('token')
        },
        data:{
            departmentName: departmentName
        },
        success: function (data) {
            $('#courseList').append(data);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
        }
    });
}

function publishForm() {

    var id = $('.modal-body').find('.hiddenId').html();
    var courseName = document.getElementById('option_boxCourses').value;
    var publishDate = new Date();

    $.ajax({
        url: "/knuth-sen-dev/main/publishForm",
        type: "POST",
        headers: {
            'Authorization': Cookies.get('token')
        },
        data: {
            courseName: courseName,
            id: id,
            publishDate: publishDate.getMonth() + 1 + ". " + publishDate.getDate() + ". " + publishDate.getFullYear() + "."
        },
        success: function (data) {
            if(data.status===5){
                loadExpiredSession();
            }
            else{
                $('#myModal').modal('toggle');
                loadForms();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
            loadForms();
        }
    });
}


function hideLoadingSpinner(){
    $(".loading").css("display", "none");
}

function copyForm(){

    $('#mainContainer').empty();

    var id = $(that).parent().find('.hiddenId').html();

    $.ajax({
        url: "/knuth-sen-dev/main/copyFormEdit",
        headers: {
            'Authorization':Cookies.get('token')
        },
        type: "POST",
        data:{
            id:id
        },
        success: function (data) {
            $('#mainContainer').append(data);
            if(document.getElementsByTagName("h2")[0].innerHTML==="Session Expired"){
                showLoginBtn();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
            loadForms();
        }
    });
}

function cleanData(data){
    data = data.trim();
    data = data.replace(/\\"/g, '"');

    return data;
}