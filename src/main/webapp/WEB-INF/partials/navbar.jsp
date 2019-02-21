<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<nav class="navbar navbar-default">--%>
    <%--<div class="container-fluid">--%>
        <%--<!-- Brand and toggle get grouped for better mobile display -->--%>
        <%--<div class="navbar-header d-inline">--%>
            <%--<a class="navbar-brand" href="/ads">Adlister</a>--%>
            <%--<div class="d-inline" style="float: left">--%>
                <%--<form class="form-inline d-inline " style="margin: .5em 0 0 0" action="/ads" method="post">--%>
                    <%--<input class="form-control mr-sm-2" name="searchAds" type="search" placeholder="Search for an Ad">--%>
                    <%--<button class="btn my-2 my-sm-0" type="submit" onclick="x(e)">Search</button>--%>
                    <%--<c:choose><c:when test="${noText != null}"><div class="alert alert-warning" role="alert"><p>Search can not be empty</p></div></c:when></c:choose>--%>
                <%--</form>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<ul class="nav navbar-nav navbar-right">--%>
            <%--<c:choose>--%>
                <%--<c:when test="${sessionScope.user != null}">--%>
                    <%--<li><a href="/ads/create">Create an ad</a></li>--%>
                    <%--<li><a href="/profile">Profile</a></li>--%>
                    <%--<li><a href="/logout">Logout</a></li>--%>
                <%--</c:when>--%>
                <%--<c:otherwise>--%>
                    <%--<li><a href="/register">Create an Account</a></li>--%>
                    <%--<li><a href="/login">Login</a></li>--%>
                <%--</c:otherwise>--%>
            <%--</c:choose>--%>
        <%--</ul>--%>
    <%--</div><!-- /.navbar-collapse -->--%>
    <%--</div><!-- /.container-fluid -->--%>
<%--</nav>--%>


<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg fixed-top scrolling-navbar">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-navbar" aria-controls="main-navbar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                <span class="lni-menu"></span>
                <span class="lni-menu"></span>
                <span class="lni-menu"></span>
            </button>
            <a class="navbar-brand" href="ads" id="logo">Adlister</a>
        </div>
        <div class="collapse navbar-collapse" id="main-navbar">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/">
                        Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="category.html">
                        Categories
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link dropdown-toggle" href="#" >
                        Ad Listings
                    </a>
                </li>
            </ul>
            <ul class="sign-in">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="lni-user"></i>My Account</a>
                    <div class="dropdown-menu">
                        <c:choose>
                            <c:when test="${sessionScope.user != null}">
                            <a class="dropdown-item" href="profile"><i class="lni-wallet"></i> My Ads</a>
                            <a href="/ads/create">Create an ad</a>
                            <a href="/profile">Profile</a>
                            <a href="/logout">Logout</a>
                            </c:when>
                            <c:otherwise>
                                <a href="/register">Create an Account</a>
                                <a href="/login">Login</a>
                            </c:otherwise>
                        </c:choose>
                        <a class="dropdown-item" href="login"><i class="lni-lock"></i> Log In</a>
                        <a class="dropdown-item" href="register"><i class="lni-user"></i> Sign Up</a>
                        <%--<a class="dropdown-item" href=""><i class="lni-reload"></i> Forgot Password</a>--%>
                    </div>
                </li>
            </ul>
            <a class="tg-btn" href="ads/create">
                <i class="lni-pencil-alt"></i> Post An Ad
            </a>
        </div>
    </div>

    <!-- Mobile Menu Start -->
    <ul class="mobile-menu">
        <li>
            <a class="active" href="index.html">Home</a>
        </li>
        <li>
            <a href="category.html">Categories</a>
        </li>
        <li>
            <a href="#">
                Listings
            </a>
        </li>
        <li>
            <a>My Account</a>
            <ul class="dropdown">
                <li><a href="profile"><i class="lni-wallet"></i> My Ads</a></li>
                <li><a href="login"><i class="lni-lock"></i> Log In</a></li>
                <li><a href="register"><i class="lni-user"></i> Sign Up</a></li>
                <%--<li><a href=""><i class="lni-reload"></i> Forgot Password</a></li>--%>
            </ul>
        </li>
    </ul>
    <!-- Mobile Menu End -->

</nav>
<!-- Navbar End -->
<div class="page-header" >
</div>