<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h3><c:out value="${ad.title}"></c:out></h3>
            <p><c:out value="${ad.description}"></c:out></p>
            <p><c:forEach var="category" items="${ad.getCategories()}">
                <span class="cat-pill btn-primary"><c:out value="${category}"></c:out></span>
            </c:forEach></p>
        </div>
    </c:forEach>
</div>
<jsp:include page="/WEB-INF/partials/footer.jsp" />

</body>
</html>
