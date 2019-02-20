<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Create a new Ad</h1>
        <c:choose>
            <c:when test="${failed != null}">
                <div class="alert alert-warning" role="alert">
                    <p>Title field can't be blank</p>
                </div>
            </c:when>
        </c:choose>

        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <div>
                <label>Categories</label>
                <div>
                    <label class="cat-pill">
                        <input type="checkbox" name="Art"> Art
                    </label><label class="cat-pill">
                        <input type="checkbox" name="Cars"> Cars
                    </label><label class="cat-pill">
                        <input type="checkbox" name="Computers"> Computers
                    </label><label class="cat-pill">
                        <input type="checkbox" name="Electronics"> Electronics
                    </label><label class="cat-pill">
                        <input type="checkbox" name="Furniture"> Furniture
                    </label><label class="cat-pill">
                        <input type="checkbox" name="IT Services"> IT Services
                    </label><label class="cat-pill">
                        <input type="checkbox" name="Jewelery"> Jewelery
                    </label><label class="cat-pill">
                        <input type="checkbox" name="Other"> Other
                    </label><label class="cat-pill">
                        <input type="checkbox" name="Sports"> Sports
                    </label><label class="cat-pill">
                        <input type="checkbox" name="Trade"> Trade
                    </label>
                </div>
            </div>
            <input type="submit" class="btn btn-block btn-primary">

        </form>
    </div>
</body>
</html>
