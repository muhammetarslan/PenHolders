<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Search Results</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
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
    <div  class="container" id="user-search-results">
		<c:choose>
		<c:when test="${not empty usersFound}">
            <h3>Go to user profile: </h3>
		 <c:forEach items="${usersFound}" var="userFound">	
			<tr>
      		  <td> 
                    <a href="${contextPath}/${userFound}">${userFound}</a>
      		  </td>
   			 </tr>
				</c:forEach>
			</c:when>    
			<c:otherwise>
				<h2>No user found</h2>
			</c:otherwise>
            </c:choose>
		</div>

	<script type="text/javascript"
		src="${contextPath}/resources/js/jquery.min.js"></script>
</body>
</html>