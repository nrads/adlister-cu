<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.getUsername()}!</h1>


        <c:forEach var="ad" items="${ownerAds}">
            <div class="row">
                <div class="col">
                    <h3><c:out value="${ad.title}"></c:out></h3>
                    <p><c:out value="${ad.description}"></c:out></p>
                <p><c:forEach var="category" items="${ad.getCategories()}">
                    <span class><c:out value="${category}"></c:out></span>
                    </c:forEach></p>
                </div>
                <div class="col">
                    <form action="/profile" method="post">
                        <input type="hidden" value="${ad.id}" name="adId">
                        <input class="btn btn-info" type="submit" name="update" value="Edit">
                        <input class="btn btn-danger" type="submit" name="update" value="Delete">
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

</body>
</html>
