<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

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
  <div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
   
    
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <!-- <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2> -->
        
        <c:if test="${not empty pullRequests}">
        <div class="pull-request-list">Pull Requests
         <ul>
        <c:forEach items="${pullRequests}" var="pullRequest">
        <li class=list-group-item>
        <a href="${contextPath}/pullRequests/${pullRequest}">${pullRequest}</a>
        </li>
        </c:forEach>
        </ul>
        </div>
        </c:if>
    </c:if>
  </div>
  <script src="node_modules/jquery/dist/jquery.min.js"></script>
    <script src="node_modules/popper/dist/popper.min.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>