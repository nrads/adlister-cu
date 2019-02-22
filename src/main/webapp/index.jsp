<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div id="hero-area">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-12 col-xs-12 text-center">
                    <div class="contents">
                        <h1 class="head-title">Welcome to <span class="year">NR ADS</span> (Not Really)</h1>
                        <p>Buy And Sell Everything From Used Cars To Mobile Phones And Computers, <br> Or Search For Property, Jobs And More</p>
                        <div class="search-bar">
                            <fieldset>
                                <form action="/ads" method="post" class="search-form">
                                    <div class="form-group tg-inputwithicon">
                                        <i class="lni-tag"></i>
                                        <input type="text" name="searchAds" class="form-control" id="home-search" placeholder="What are you looking for">
                                    </div>
                                    <button class="btn btn-common" type="submit"><i class="lni-search"></i></button>
                                </form>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />
    <script>
        jQuery(document).ready(function($) {
            $('div.page-header').removeClass('page-header');
        });
    </script>
</body>
</html>
