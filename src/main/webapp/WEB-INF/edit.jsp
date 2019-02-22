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
        <c:choose>
            <c:when test="${sessionScope.failed != null}">
                <div class="alert alert-warning" role="alert">
                    <p>Title field can't be blank</p>
                </div>
            </c:when>
        </c:choose>
        <form action="edit" method="post">
        <%--<input id="adId" name="adId" class="form-control" type="hidden" value="${ad.getId()}">--%>
            <div class="form-group">

                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text" value="${ad.getTitle()}">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control">${ad.getDescription()}</textarea>
                <input class="btn btn-info" type="submit" value="Confirm Changes">
            </div>
        </form>
    </div>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />

</body>
</html>
