<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Register" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <h1>Create an Account</h1>

        <c:choose><c:when test="${failed != null}">
                <div class="alert alert-warning" role="alert">
                    <p>Username or email already exists!</p>
                </div></c:when>
            <c:when test="${badPass != null}">
                <div class="alert alert-warning" role="alert">
                    <p>Passwords do not match</p>
                </div></c:when></c:choose>

    <form action="register" method="POST">
        <div class="form-group">
            <label for="email">Email</label>
            <input autofocus id="email" name="email" class="form-control" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" value="${email}" required>
        </div>
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text" pattern="[a-zA-Z]{1,15}" value="${username}" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password" pattern="[a-zA-Z0-9]{6,32}" required>
        </div>
        <div class="form-group">
            <label for="passwordConfirm">Confirm Password</label>
            <input id="passwordConfirm" name="passwordConfirm" class="form-control" type="password" pattern="[a-zA-Z0-9]{6,32}" required>
        </div>
        <input type="submit" class="btn btn-common btn-block" value="Sign Up!">
    </form>
</div>
<jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>
