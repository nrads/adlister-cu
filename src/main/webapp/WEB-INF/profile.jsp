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
            <div class="col-md-6">
                <h2><c:out value="${ad.title}"></c:out></h2>
                <p><c:out value="${ad.description}"></c:out> <br>
            <c:forEach var="category" items="${ad.getCategories()}">
                <c:out value="${category}"></c:out>
            </c:forEach>
                </p>
            </div>
        </c:forEach>
    </div>

</body>
</html>
