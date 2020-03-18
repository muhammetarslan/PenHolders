<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Story Teller</title>

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

		<div class="container" id="div-save-content">
	<form:form method="post" modelAttribute="saveContent"
		class="contentSave">
		<form:textarea path="content" class="tinymce" value="content"></form:textarea>
		<h4 id="errorTitle">${error}</h4>
		<h2 class="input-content-title-heading">Enter Content Title</h2>
		<form:input path="contentTitle" type="text" placeholder="Title" />
		<input type="submit" value="Submit Changes" class="button"
			name="submit" />
		<input type="submit" value="fork" class="button" name="fork" />		
	</form:form>
	<form action="${contextPath}/${profile}/${contentTitle}/search" class="search-by-username">	
	<label>Send Pull Request to:</label>
	<input id="search"  name="search" 
						class="searchUser"  type="search"
						placeholder="username..."/> 
		</form>
	</div>


	<script type="text/javascript"
		src="${contextPath}/resources/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${contextPath}/resources/plugin/tinymce/js/tinymce/tinymce.min.js"></script>
	<script type="text/javascript"
		src="${contextPath}/resources/plugin/tinymce/js/tinymce/init-tinymce.js"></script>
</body>
</html>