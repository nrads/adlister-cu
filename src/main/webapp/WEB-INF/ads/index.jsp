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

    <div class="main-container">
        <h1>  Our Ads</h1>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-12 col-xs-12 page-sidebar">
                    <aside>
                        <div class="widget widget_search">
                            <form role="search" id="search-form" action="ads" method="post">
                                <input type="search" class="form-control" autocomplete="off" name="searchAds" placeholder="Search..." id="search-input" value="">
                                <button type="submit" id="search-submit" class="search-btn"><i class="lni-search"></i></button>
                                <c:choose><c:when test="${noText != null}"><div class="alert alert-warning" role="alert"><p>Search can not be empty</p></div></c:when></c:choose>
                            </form>
                        </div>
                        <div class="widget categories">
                            <h4 class="widget-title">All Categories</h4>
                            <ul class="categories-list">
                                <li>
                                        Hotel & Travels
                                </li>
                                <li>
                                        Services
                                </li>
                                <li>
                                        Pets
                                </li>
                                <li>
                                        Restaurants
                                </li>
                                <li>
                                        Real Estate
                                </li>
                                <li>
                                        Jobs
                                </li>
                                <li>
                                        Electronics
                                </li>
                            </ul>
                        </div>
                    </aside>
                </div>
                <div class="col-lg-9 col-md-12 col-xs-12 page-content">
                    <div class="adds-wrapper">
                        <div class="tab-content">
                            <div id="grid-view" class="tab-pane fade active show">
                                <div class="row">
                                    <c:forEach var="ad" items="${ads}">
                                        <div class="widget featured-box col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
                                            <div class="feature-content">
                                                    <h4 class="feature-content"><c:out value="${ad.title}"></c:out></h4>
                                                <div class="tg-product"></div>
                                                    <p><c:out value="${ad.description}"></c:out></p>
                                                <ul class="address">
                                                    <c:forEach var="category" items="${ad.getCategories()}">
                                                    <li>
                                                        <span class="cat-pill btn-common"><i class="lni-tag"></i><c:out value="${category}"></c:out></span>
                                                    </li>
                                                    </c:forEach>
                                                </ul>
                                                <div class="btn-list">
                                                    <%--<a class="btn-price" href="#">$ 25</a>--%>
                                                    <%--<a class="btn btn-common" href="ads-details.html">--%>
                                                        <%--<i class="lni-list"></i>--%>
                                                        <%--Details--%>
                                                    <%--</a>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
<jsp:include page="/WEB-INF/partials/footer.jsp" />

</body>
</html>
