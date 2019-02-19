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
        <h1>Edit your ad: </h1>
        <input id="title" name="title" class="form-control" type="text" value="${title}">
        <textarea id="description" name="description" class="form-control" type="text" value="${description}"></textarea>

    </div>

</body>
</html>
