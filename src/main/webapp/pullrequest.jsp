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
	<form:form method="post" modelAttribute="ContentObj" class="pullView">
	<h2>${fromUser} sent you a pull Request for your: ${contentTitle}</h2>
			<p>${content}</p>
			<input type="submit" value="Accept Pull Request" class="button" name="accept"/>
			<input type="submit" value="Deny Pull Request" class="button" name="deny"/>
        </form:form>
	<script type="text/javascript"	src="${contextPath}/resources/js/jquery.min.js"></script>
</body>
</html>