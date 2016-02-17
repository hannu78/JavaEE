<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css" />
<script src="/resources/js/jquery-2.1.4.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<nav class="navbar navbar-inverse" role='navigation'>
    <div class='container'>
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle='collapse' data-target='.navabar-ex-collapse'>
                <span class='icon-bar'></span>
                <span class='icon-bar'></span>
                <span class='icon-bar'></span>
            </button>
            <a class='navbar-brand' href="/">School Application</a>
        </div>
        <div class='collapse navbar-collapse navabar-ex-collapse'>
            <ul id='anc_list' class="nav navbar-nav navbar-right">
                <c:if test="${isLogged == true}">
                    <li><a href="/logout">Logout</a></li>
                    <li><a href="/admin/student">Students</a></li>
                    <li><a href="/admin/course">Courses</a></li>
                </c:if>
               <!-- <li><a href='/api/teacher'>Add Teacher</a></li>
                <li><a href="/api/student">Add Student</a></li> -->
            </ul>
        </div>
    </div>
</nav>
