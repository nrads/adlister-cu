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
                <label>
                    <input type="checkbox" name="Art" value="Art">Art
                </label><label>
                    <input type="checkbox" name="Cars" value="Cars">Cars
                </label><label>
                    <input type="checkbox" name="Computers" value="Computers">Computers
                </label><label>
                    <input type="checkbox" name="Electronics" value="Electronics">Electronics
                </label><label>
                    <input type="checkbox" name="Furniture" value="Furniture">Furniture
                </label><label>
                    <input type="checkbox" name="IT Services" value="IT Services">IT Services
                </label><label>
                    <input type="checkbox" name="Jewelery" value="Jewelery">Jewelery
                </label><label>
                    <input type="checkbox" name="Other" value="Other">Other
                </label><label>
                    <input type="checkbox" name="Sports" value="Sports">Sports
                </label><label>
                    <input type="checkbox" name="Trade" value="Trade">Trade
                </label>
            </div>
            <input type="submit" class="btn btn-block btn-primary">

        </form>
    </div>
</body>
</html>
