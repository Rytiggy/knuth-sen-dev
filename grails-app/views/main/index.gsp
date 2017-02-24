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


    <div class="card-wrapper">
        <h1>Search</h1>

        <label for="default">Pick a Professor</label>
        <input type="text" id="default" list="languages" placeholder="e.g. Prof">

        <datalist id="languages">
            <option value="Prof 1">
            <option value="Prof 3">
            <option value="Prof Deb">
            <option value="Prof Flo">
        </datalist>


        <label for="ajax">Pick a Course (LOADS OVER AJAX )</label>
        <input type="text" id="ajax" list="json-datalist" placeholder="e.g. ISTE-240">
        <datalist id="json-datalist">


        </datalist>


    </div>


    <div id="mainContainer" class="container block-element-container">


    </div>


<script>
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

    $body.on('click', '.pView', function (event) {
        event.preventDefault();
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
        $('.modal-body').append("BANANAZ");
    });

    $body.on('click', '.newFormButton', function () {
        loadFormCreation();
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


    $(document).on({
        ajaxStart: function() { $body.addClass("loading");    },
        ajaxStop: function() { $body.removeClass("loading"); }
    });

    $body = $("body");

    $(document).on({
        ajaxStart: function() { $body.addClass("loading");    },
        ajaxStop: function() { $body.removeClass("loading"); }
    });


    //DROP DOWN SEARCH
    // Get the <datalist> and <input> elements.
    var dataList = document.getElementById('json-datalist');
    var input = document.getElementById('ajax');

    // Create a new XMLHttpRequest.
    var request = new XMLHttpRequest();

    // Handle state changes for the request.
    request.onreadystatechange = function(response) {
        if (request.readyState === 4) {
            if (request.status === 200) {
                // Parse the JSON
                var jsonOptions = JSON.parse(request.responseText);

                // Loop over the JSON array.
                jsonOptions.forEach(function(item) {
                    // Create a new <option> element.
                    var option = document.createElement('option');
                    // Set the value using the item in the JSON array.
                    option.value = item;
                    // Add the <option> element to the <datalist>.
                    dataList.appendChild(option);
                });

                // Update the placeholder text.
                input.placeholder = "e.g. Course";
            } else {
                // An error occured :(
                input.placeholder = "Couldn't load datalist options :(";
            }
        }
    };

    // Update the placeholder text.
    input.placeholder = "Loading options...";

    // Set up and make the request.
    request.open('GET', 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/4621/html-elements.json', true);
    request.send();



</script>
</body>
</html>