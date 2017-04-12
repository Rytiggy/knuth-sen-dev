<%--
  Created by IntelliJ IDEA.
  User: Ryan
  Date: 2/10/2017
  Time: 11:12 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main"/>
</head>

<body >
<div id="mainContainer" class="container block-element-container"></div>

<script>
    var singleGradeItem = commentToHtml(function () {<g:render template="singleGradeItem"/>});
    var $body = $('body');
    $('.secondNav').css("visibility", "hidden");

    $( document ).ready(function() {
        var token;
        token = Cookies.get('token');

        if(token){
            checkLoginStatus(token);
        }
        else{
            loadLoadingScreen();
        }
    });
    //-----------------------------------------------EVENTS---------------------------------------------------------------

    $body.on('click', '.forms', function (event) {
        event.preventDefault();
        loadForms();
    });

    $body.on('click', '.analysis', function (event) {
        event.preventDefault();
        loadAnalysis();
    });

    $body.on('click', '.pView', function (event) {
        event.preventDefault();
        loadProfView();
    });

    $body.on('click', '.admin', function (event) {
        event.preventDefault();
    });

    $body.on('click', '.loginBtn', function (event) {
        event.preventDefault();
    });

    $body.on('click', '.loginBtn', function () {
        loadLogInPage();
    });

    $body.on('click', '.resetpassBtn', function () {
        loadresetPasswordScreen();
    });

    $body.on('click', '.confirmPassword', function () {
        confirmPassword();
    });

    $body.on('click', '.cancelGradeInput', function () {
        loadProfView();
    });

    $body.on('click', '.cancelAttemptLogin', function () {
        location.reload();
    });

    $body.on('click', '.cancelEditForm', function () {
        loadForms();
    });

    $body.on('click', '.cancelNewForm', function () {
        loadForms();
    });

    $body.on('click', '.cancelNewDepartment', function () {
        loadAdminDepartments();
    });

    $body.on('click', '.publishBtn', function () {
        $('.modal-body').empty();
        loadFormPublishing(this);
    });

    $body.on('click', '.unpublishButton', function () {
        unpublishForm(this);
    });

    $body.on('click', '.newFormButton', function () {
        loadFormCreation();
    });

    $body.on('click', '.newAnalysisButton', function () {
        loadAnalysisCreation();
    });

    $body.on('click', '.attemptLogin', function () {
        attemptLogin();
    });

    $body.on('click', '.editBtn', function () {
        loadFormEdit(this);
    });

    $body.on('click', '.editFacultyBtn', function () {
        loadFacultyEdit(this);
    });

    $body.on('click', '.editDepartmentBtn', function () {
        loadDepartmentEdit(this);
    });

    $body.on('click', '.editSectionBtn', function () {
        loadSectionEdit(this);
    });

    $body.on('click', '.editCourseBtn', function () {
        loadCourseEdit(this);
    });

    $body.on('click', '.saveEditForm', function () {
        saveEditForm();
    });

    $body.on('click', '.saveEditDepartment', function () {
        saveEditDepartment();
    });

    $body.on('click', '.saveEditSection', function () {
        saveEditSection();
    });

    $body.on('click', '.saveEditCourse', function () {
        saveEditCourse();
    });

    $body.on('click', '.saveEditFaculty', function () {
        saveEditFaculty();
    });

    $body.on('click', '.saveNewForm', function () {
        saveNewForm();
    });

    $body.on('click', '.deleteBtn', function () {
        deleteForm(this);
    });

    $body.on('click', '.logoutBtn', function (event) {
        event.preventDefault();
        Cookies.remove('token');
        showLoginBtn();
        loadLoadingScreen();
    });

    $body.on('click', '.facultyAdminBtn', function (event) {
        event.preventDefault();
        loadAdminFaculty();
    });

    $body.on('click', '.departmentsAdminBtn', function (event) {
        event.preventDefault();
        loadAdminDepartments();
    });

    $body.on('click', '.coursesAdminBtn', function (event) {
        event.preventDefault();
        loadAdminCourses();
    });

    $body.on('click', '.sectionsAdminBtn', function (event) {
        event.preventDefault();
        loadAdminSections();
    });

    $body.on('click', '.newFacultyButton', function () {
        loadFacultyCreation();
    });

    $body.on('click', '.newDepartmentButton', function () {
        loadDepartmentCreation();
    });

    $body.on('click', '.newCourseButton', function () {
        loadCourseCreation();
    });

    $body.on('click', '.newSectionButton', function () {
        loadSectionCreation();
    });

    $body.on('click', '.cancelNewCourse', function () {
        loadAdminCourses();
    });

    $body.on('click', '.cancelNewAnalysis', function () {
        loadAnalysis();
    });

    $body.on('click', '.cancelNewFaculty', function () {
        loadAdminFaculty();
    });

    $body.on('click', '.cancelNewSection', function () {
        loadAdminSections();
    });

    $body.on('click', '.saveNewFaculty', function () {
        saveNewFaculty();
    });

    $body.on('click', '.saveNewDepartment', function () {
        saveNewDepartment();
    });

    $body.on('click', '.saveNewSection', function () {
        saveNewSection();
    });

    $body.on('click', '.saveNewCourse', function () {
        saveNewCourse(this);
    });

    $body.on('click', '.saveNewAnalysis', function () {
        saveNewAnalysis();
    });

    $body.on('click', '.disableFacultyBtn', function () {
        disableFaculty(this);
    });

    $body.on('click', '.enableFacultyBtn', function () {
        enableFaculty(this);
    });

    $body.on('click', '.enableDepartmentBtn', function () {
        enableDepartment(this);
    });

    $body.on('click', '.disableDepartmentBtn', function () {
        disableDepartment(this);
    });

    $body.on('click', '.disableSectionBtn', function () {
        disableSection(this);
    });

    $body.on('click', '.enableSectionBtn', function () {
        enableSection(this);
    });

    $body.on('click', '.disableCourseBtn', function () {
        disableCourse(this);
    });

    $body.on('click', '.enableCourseBtn', function () {
        enableCourse(this);
    });

    $body.on('click', '.loadCourses', function () {
        loadDepartmentCourses();
    });

    $body.on('click', '.loadStoredGrades', function () {
        loadStoredGrades();
    });

    $body.on('click', '.publishForm', function () {
        publishForm();
    });

    $body.on('click', '.copyFormButton', function () {
        copyForm(this);
    });

    $body.on('click', '.inputData', function () {
        loadDataInput(this, singleGradeItem);
    });

    $body.on('click', '.addGradeItem ', function () {
        addSingleGradeItem(singleGradeItem);
    });

    $body.on('click', '.removeGradeItem ', function () {
        removeGradeItem(this);
    });

    $body.on('click', '.parseGrades ', function () {
        parseGrades(singleGradeItem);
    });

    $body.on('click', '.saveGrades ', function () {
        saveGrades();
    });

    $body.on('click', '.downloadBtn ', function () {
        downloadAllData(this);
    });

    $(document).on({
//        ajaxStart: function() { $body.addClass("loading");    },
        ajaxStop: function() { $body.removeClass("loading"); }
    });


    function downloadAllData(that){

        var id = $(that).parent().find('.hiddenId').html();

        $.ajax({
            url: "/knuth-sen-dev/main/getRole",
            type: "GET",
            headers: {
                'Authorization':Cookies.get('token')
            },
            success: function (data) {
                if(data.status===0){
                    Cookies.remove('token');
                }
                else if (data.status===1) {
                    var link = "${g.createLink(controller: 'dataDownload', action: 'downloadAllData')}"+"?id=" + id;
                    window.location.replace(link);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown);
                return false;
            }
        });
    }

</script>
</body>
</html>