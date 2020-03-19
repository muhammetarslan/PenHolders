<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Account Creation</title>
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:400,800">
		<link rel='stylesheet' href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="resources/css/bootstrap.css" rel="stylesheet">
		<link href="resources/css/styles.css" rel="stylesheet">
	  </head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-white">
        <span class="border pl-3 border-info">
            <a class="navbar-brand" id="brand" href="${contextPath}/welcome">PenHolders</a>
            </span>
        
  
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>
  
  
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <form action="/search" class="form-inline ml-auto mr-auto-10">
                <div class="md-form my-0">
                    <div class="dropdown-divider"></div>
                    <input id="search" name="search" class="form-control" type="search" placeholder="Search" />
                    <i class="fa fa-search  ml-3" aria-hidden="true"></i>
                </div>
            </form>
            <div class="dropdown-divider"></div>
  
            <ul class="navbar-nav ml-auto">
            <li class="nav item">
                <a class="nav-link" href="${contextPath}/texteditor">Create</a>
            </li>
                <li class="nav item">
                    <a class="nav-link" href="${contextPath}/${pageContext.request.userPrincipal.name}">Profile</a>
                </li>
                <li class="nav item">
                    <a class="nav-link" onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
                </li>
            </ul>
        </div>
    </nav>
	<div class="container shadow-lg p-3 mb-5 bg-white rounded border" id="div-save-content">
		
	<form:form method="post" modelAttribute="saveContent" class="contentSave">
	 <form:textarea  path="content" class="tinymce"></form:textarea>
	 <nav id="editorNav" class="navbar navbar-expand-lg navbar-dark bg-black pt-2">
	 <div class="row">
		<ul class="navbar-nav ml-auto">
			<li class="nav item">
		<label class="col-mid-2 col-form-label pl-3 text-secondary"
			for="titleInput">Title:</label>
		<div class="cold-mid-6 ml-3">
	 <form:input path="contentTitle" id="titleInput" class="form-control  bg-dark text-white border-secondary" type="text" placeholder="Title"/>
	</div>
</li>
<li class="nav item">
	<button type="submit" class="btn btn btn-outline-secondary ml-5">Submit</button>
	</li>
	</ul>
	</div>
	</div>
	</form:form>
		</nav>
		</div>
	

		<script src="node_modules/jquery/dist/jquery.min.js"></script>
		<script src="node_modules/popper/dist/popper.min.js"></script>
		<script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript"	src="${contextPath}/resources/plugin/tinymce/js/tinymce/tinymce.min.js"></script>
	<script type="text/javascript"	src="${contextPath}/resources/plugin/tinymce/js/tinymce/init-tinymce.js"></script>
</body>
</html>