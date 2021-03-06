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
		<div class="container" id="div-search-results">
		
			<div class="searchResults" id="user-search-results">
				<c:choose>
				<c:when test="${not empty usersFound}">
				
				<form:form method="post">
					<div class="card">
					<h5 class="card-header info-color   text-center py-2">Add a request title</h5>
					<input class="form-control" id="requestTitle" placeholder="Change Comment" name="description" type="text"/>
				</div>
					<div class="card">
						<div class="list-group">
					<h5 class="card-header info-color   text-center py-2">Click on the username to send the request</h5>
				 <c:forEach items="${usersFound}" var="userFound">	
					  <li class="list-group-item">
						  <input   name="userX" type="submit" value="${userFound}" class="btn btn-outline-info"/>
						</li>  
					</c:forEach>
						</div>
					</div>
						</form:form>
						
						
					</c:when>    
					<c:otherwise>
						<div class="card">
							<h5 class="card-header info-color  bg-primary text-center py-2">No user found</h5>
								</div>
					</c:otherwise>
					</c:choose>
				</div>
	</div>
	<script src="${contextPath}/node_modules/jquery/dist/jquery.min.js"></script>
	<script src="${contextPath}/node_modules/popper/dist/popper.min.js"></script>
	<script src="${contextPath}/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>