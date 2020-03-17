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
		<div class="searchResults" id="user-search-results">
		<h3>Select a user name to send a pull request</h3>
		<c:if test="${not empty usersFound}">
		 <c:forEach items="${usersFound}" var="userFound">	
		 	
			<tr>
      		  <td>
      		  <form:form method="post" >
      		  <span>Enter description: 
      		  <input   name="description" type="text"	/>
      		  <input   name="userX" type="submit" value="${userFound}" class="button"/>
      		  </span>
      		  </form:form>
      		  </td>
   			 </tr>
   			 
   			 </c:forEach>
   			 </c:if>
		</div>

	<script type="text/javascript"
		src="${contextPath}/resources/js/jquery.min.js"></script>
</body>
</html>