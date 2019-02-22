<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Please Log In</h1><c:choose><c:when test="${failed != null}"><div class="alert alert-warning" role="alert"><p>Invalid credentials</p></div></c:when></c:choose>
        <form action="login" method="POST">
            <div class="form-group">
                <label for="username">Username or Email</label>
                <input autofocus id="username" name="username" value="${username}" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-common btn-block" value="Log In">
        </form>
    </div>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />

</body>
</html>
