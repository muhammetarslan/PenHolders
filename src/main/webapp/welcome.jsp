<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Account Creation</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="headcontainer">
		<form id="loadWelcome" action="${contextPath}/welcome">
			<input type="submit" value="Go to HomePage" />
		</form>
			<form action="/search" class="search-by-username">	
				<label>Search: </label>
				<input id="search"  name="search" 
									class="searchUser"  type="search"
									placeholder="username..."/> 
					</form>
					<form id="loadProfile"  action="${contextPath}/${pageContext.request.userPrincipal.name}">
						<input type="submit" value="Go to My Profile"/>
                    </form>
                    <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
		</div>

  <div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <!-- <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2> -->
       
       <form id="loadTextEditor"  action="${contextPath}/texteditor">
            <input type="submit" value="Go to Texteditor"/>
        </form>
        
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>