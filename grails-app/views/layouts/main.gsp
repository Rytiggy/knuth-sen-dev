<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:600,400&subset=latin,latin-ext' rel='stylesheet' type='text/css'>

	<!-- Latest compiled and minified CSS -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><g:layoutTitle default="CAS"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="${assetPath(src: 'favicon.png')}" type="image/x-icon">

	<asset:stylesheet src="application.css"/>
	<asset:javascript src="application.js"/>
	<g:layoutHead/>
</head>

<body>
<nav class="navbar navbar-orange navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed glyphicon glyphicon-menu-hamburger" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" id="ritLogo" href="#"></a>
        </div>

        <div id="navbar" class="navbar-collapse collapse navbar-right">
            <ul class="nav navbar-nav">

                <li class="dropdown rolesLi top-nav-bar-buttons"><a class="dropdown-toggle admin userLocation" data-toggle="dropdown" href="#" style="background-color: #f36e21; display: none;">USERNAME</a>
                    <ul class="dropdown-menu" style="margin-top:6px;">
                        <li><a href="#">Profile</a></li>
                        <li class="logoutBtn"><a href="#">Logout</a></li>
                    </ul>
                </li>
                <li class="top-nav-bar-buttons"><a class="loginBtn hideMe" href="#about" style="background-color: #f36e21;">Login</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="navbar-fixed-top second-level-nav">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed glyphicon glyphicon-menu-hamburger" data-toggle="collapse" data-target="#secondNavbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <div id="secondNavbar" class="navbar-collapse collapse navbar-left">

                <ul class="nav navbar-nav secondNav">
                    <li class="dropdown rolesLi"><a class="dropdown-toggle admin" data-toggle="dropdown" href="#">Admin</a>
                        <ul class="dropdown-menu" >
                            <li><a class="facultyAdminBtn" href="#">Faculty</a></li>
                            <li><a class="sectionsAdminBtn" href="#">Sections</a></li>
                            <li><a class="coursesAdminBtn" href="#">Courses</a></li>
                            <li><a class="departmentsAdminBtn" href="#">Departments</a></li>
                        </ul>
                    </li>

                    <li class="formsLi"><a class="forms" href="#">Forms</a></li>
                    <li class="pViewLiv"><a class="pView" href="#">Professor View</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
</div>



<div style="margin-bottom: 130px"></div>



	<g:layoutBody/>

    <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header card-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h2 class="modal-title " id="myModalLabel">Modal title</h2>
            </div>
            <div class="modal-body">
                class="modal-body"
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-brown navbar-fixed-bottom">
    <div class="container">
        <div class="text-align-middle"> Copyright © Knuth </div>
    </div>
</nav>

	<br/>
</div>


<div class="loading-modal"><!-- Place at bottom of page --></div>

</body>
</html>
