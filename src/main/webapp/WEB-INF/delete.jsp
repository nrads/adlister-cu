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
            <div class=" featured-box col-xs-12 col-sm-12 col-md-6 col-lg-6">
                <div class="feature-content">
                    <h4 class=""><c:out value="${ad.title}"></c:out></h4>
                    <div class="tg-product"></div>
                    <p><c:out value="${ad.description}"></c:out></p>
                    <ul class="address">
                        <c:forEach var="category" items="${ad.getCategories()}">
                            <li>
                                <span class="cat-pill btn-common"><i class="lni-tag"></i><c:out value="${category}"></c:out></span>
                            </li>
                        </c:forEach>
                    </ul>
                    <div class="">
                        <form action="delete"  method="post">
                            <input class="btn btn-danger" name="submit" type="submit" value="Yes">
                            <input class="btn btn-info" name="submit" type="submit" value="No, take me back to my profile">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />

</body>
</html>
