<%-- 
    Document   : course
    Created on : Feb 17, 2016, 10:48:22 AM
    Author     : Ohjelmistokehitys
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset="UTF-8"/>
        <link rel="stylesheet" type="text/css" href="/resources/css/styles.css" />
        <link rel="stylesheet"type="text/css" href="/resources/css/bootstrap.min.css"/>
        <script src="/resources/js/jquery-2.1.4.min.js"></script>
        <script src="/resources/js/bootstrap.min.js"></script>
        <title>Courses</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <div class="col-md-4">
                <div class="form-group">
                    <h1>Add new course</h1>
                    <form:form action="/admin/course" method="POST" modelAttribute="course">
                        <form:label path="">Name </form:label>
                        <form:input class="form-control" path="CName"></form:input><br/>
                        <form:label path="">Grade </form:label>
                        <form:input class="form-control" path="grade"></form:input><br/>
                        <form:label path="">Course information </form:label>
                        <form:input class="form-control" path="CInfo"></form:input><br/>
                        <input class="btn btn-primary" type="submit" value="Save course"/>
                        <input class="btn btn-primary" type="reset" value="Reset"/>
                    </form:form>
                </div>
            </div>
            <div class="col-md-8">
                <h1>Courses</h1> 
                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>Name</th><th>Grade</th><th>Course info</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="course" items="${courses}">
                            <tr>
                                <td>${course.getCName()}</td><td>${course.getGrade()}</td><td>${course.getCInfo()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <p>${save_info}</p>
        
    </body>
</html>
