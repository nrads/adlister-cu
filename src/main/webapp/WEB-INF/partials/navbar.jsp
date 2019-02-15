<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header d-inline">
            <a class="navbar-brand" href="/ads">Adlister</a>
            <div class="d-inline" style="float: left">
                <form class="form-inline d-inline " style="margin: .5em 0 0 0" action="/ads" method="post">
                    <input class="form-control mr-sm-2" name="searchAds" type="search" placeholder="Search for an Ad">
                    <button class="btn my-2 my-sm-0" type="submit" onclick="x(e)">Search</button>
                    <c:choose><c:when test="${noText != null}"><div class="alert alert-warning" role="alert"><p>Search can not be empty</p></div></c:when></c:choose>
                </form>
            </div>
        </div>


        <ul class="nav navbar-nav navbar-right">
            <c:choose>
                <c:when test="${sessionScope.user != null}">
                    <li><a href="/ads/create">Create an ad</a></li>
                    <li><a href="/profile">Profile</a></li>
                    <li><a href="/logout">Logout</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/register">Create an Account</a></li>
                    <li><a href="/login">Login</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
    <script>
        function x(e) {
            e.preventDefault();
        }
    </script>
</nav>
