<%--
  Created by IntelliJ IDEA.
  User: asuta
  Date: 28-Dec-16
  Time: 17:25
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    %{-------------IMPORTANT--------------}%
    <meta name="layout" content="main"/>
    <title>Example Page</title>
</head>

<body>
    <div id="wrapper">
        <div>
            <button onclick="getPeople()">click me please</button>
        </div>

        <div id="facultySelectDiv"></div>
        <div id="facultyDataDiv"></div>
    </div>
<script>


    window.getPeople = function(){
        $.ajax({
            url: "${g.createLink(controller: 'examples', action: 'getFacultyData')}",
            success: function (data) {
                createDropdown();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
            }
        });
    };

    function createDropdown(){
        $('#facultySelectDiv').empty();
        $.ajax({
            url: "${g.createLink(controller: 'examples', action: 'createDropdown')}",
            success: function (data) {
                console.log(data)
                $('#facultySelectDiv').append(data)
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
            }
        });
    }

    function getSpecificData(username){
        $('#facultyDataDiv').empty();
        $.ajax({
            url: "${g.createLink(controller: 'examples', action: 'getSpecificData')}",
            data:{
                username:username
            },
            success: function (data) {
                console.log(data)
                $('#facultyDataDiv').append(data)
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)
            }
        });
    }

    //declaring event before the element is created
    $('body').on('change', '#facultySelect', function () {
        getSpecificData($('#facultySelect').find(":selected").text());
    });
</script>
</body>
</html>