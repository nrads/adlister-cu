<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Are you sure you want to delete this ad?</h1>

        <form action="/delete" method="post">
            <div class="form-group">
                <h2><c:out value="${ad.title}"></c:out></h2>
                <p><c:out value="${ad.description}"></c:out></p>
            </div>
            <div class="form-group">
                <input class="btn btn-danger" name="submit" type="submit" value="Yes">
                <input class="btn btn-info" name="submit" type="submit" value="No, take me back to my profile">

            </div>
        </form>
    </div>

</body>
</html>
