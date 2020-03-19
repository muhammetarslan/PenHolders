<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        <link href="${contextPath}/resources/css/bootstrap.css" rel="stylesheet">
	    <link href="${contextPath}/resources/css/styles.css" rel="stylesheet">
      </head>

  <body>

    <div class="container">
        <div class="card shadow-lg p-3 mb-5 bg-white rounded">
            <h5 class="card-header info-color bg-primary text-center py-4"><strong>Create your account</strong></h5>
            <div class="card-body px-lg-5 pt-0">

        <form:form method="POST" modelAttribute="userForm"  class="text-center" style="color: #e2dede;">
            <spring:bind path="username">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <div class="md-form  pt-3">
                    <form:input type="text" path="username" class="form-control border-0"  placeholder="Username"
                                autofocus="true"></form:input>
                            </div>
                    <form:errors path="username"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="password">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <div class="md-form  pt-2">
                    <form:input type="password" path="password" class="form-control border-0"  placeholder="Password"></form:input>
                </div>
                    <form:errors path="password"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="passwordConfirm">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <div class="md-form  pt-2">
                    <form:input type="password" path="passwordConfirm" class="form-control border-0" 
                                placeholder="Confirm your password"></form:input>
                            </div>
                    <form:errors path="passwordConfirm"></form:errors>
                </div>
            </spring:bind>

            <button class="align-middle btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">Submit</button>
        </form:form>
        
    </div>
    </div>
    </div>

    <script src="${contextPath}/node_modules/jquery/dist/jquery.min.js"></script>
	<script src="${contextPath}/node_modules/popper/dist/popper.min.js"></script>
	<script src="${contextPath}/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
  </body>
</html>