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
	<link href="${contextPath}/resources/css/bootstrap.css" rel="stylesheet">
	<link href="${contextPath}/resources/css/styles.css" rel="stylesheet">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="${contextPath}/welcome">PenHolders</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<form action="/search" class="form-inline ml-auto mr-auto-10">
				<div class="md-form my-0">
					<input id="search" name="search" class="form-control" type="search" placeholder="Search" />
					<i class="fa fa-search text-white ml-3" aria-hidden="true"></i>
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
	<div class="container" id="div-save-content">
	
		<form:form method="post" modelAttribute="saveContent" class="contentSave">
			<form:textarea path="content" class="tinymce" value="content"></form:textarea>
			<h4 id="errorTitle">${error}</h4>
			<h2 class="input-content-title-heading">Enter Content Title</h2>
			<form:input path="contentTitle" type="text" placeholder="Title" />
			<input type="submit" value="Submit Changes" class="button" name="submit" />
			<input type="submit" value="fork" class="button" name="fork" />
		</form:form>
		<form action="${contextPath}/${profile}/${contentTitle}/search" class="search-by-username">
			<label>Send Pull Request to:</label>
			<input id="search" name="search" class="searchUser" type="search" placeholder="username..." />
		</form>
	</div>


	<script src="${contextPath}/node_modules/jquery/dist/jquery.min.js"></script>
	<script src="${contextPath}/node_modules/popper/dist/popper.min.js"></script>
	<script src="${contextPath}/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/plugin/tinymce/js/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/plugin/tinymce/js/tinymce/init-tinymce.js"></script>
</body>

</html>