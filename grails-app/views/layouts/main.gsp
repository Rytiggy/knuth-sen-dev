<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    %{--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">--}%

    <!-- Latest compiled and minified CSS -->
    %{--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--}%

    <!-- Optional theme -->
    %{--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">--}%

    <!-- Latest compiled and minified JavaScript -->
    %{--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>--}%

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:600,400&subset=latin,latin-ext' rel='stylesheet'
		  type='text/css'>
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
                %{--<li class="active"><a href="#">Home</a></li>--}%
                <li><a class="loginBtn" href="#about">Login</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div class="second-level-nav navbar-fixed-top">
        <div class="container">
            <ul class="nav navbar-nav secondNav">
                %{--<li class="mainLi"><a class="home" href="main.gsp">Home</a></li>--}%
                <li class="rolesLi"><a class="admin" href="#">Admin</a></li>
                <li class="formsLi"><a class="forms" href="#">Forms</a></li>
                <li class="pViewLiv"><a class="pView" href="#">Professor View</a></li>
            </ul>
        </div>
</div>
<div style="margin-bottom: 130px"></div>



	<g:layoutBody/>



<nav class="navbar navbar-brown navbar-fixed-bottom">
    <div class="container">
        <div class="text-align-middle"> Copyright © Knuth </div>
    </div>
</nav>

	<br/>
</div>
</body>
</html>
