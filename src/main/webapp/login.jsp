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
        <h5 class="card-header info-color text-white bg-primary text-center py-4"><strong>Log in</strong></h5>
        <div class="card-body px-lg-5 pt-0">
      <form method="POST" action="${contextPath}/login" class="text-center" style="color: #e2dede;">
        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span >${message}</span>
            <div class="md-form  pt-3">
            <input name="username" type="text" id="materialLoginFormUsername"  class="form-control border-0" placeholder="Username"
                   autofocus="true"/>                
                  </div>
                  <div class="md-form mt-2"></div>
            <input name="password" type="password" class="form-control border-0"  id="materialLoginFormPassword" placeholder="Password"/>
                  </div>
            <span>${error}</span>
            <div class="d-flex justify-content-around">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">Log in</button>
        </div>
        <p class="text-center"><a href="${contextPath}/registration">Create an account</a></p>
      </div>
      </form>
    </div>
    </div>
    </div>

    <script src="${contextPath}/node_modules/jquery/dist/jquery.min.js"></script>
    <script src="${contextPath}/node_modules/popper/dist/popper.min.js"></script>
    <script src="${contextPath}/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
  </body>
</html>