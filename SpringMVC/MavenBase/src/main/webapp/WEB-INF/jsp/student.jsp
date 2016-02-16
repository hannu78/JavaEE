<%-- 
    Document   : student
    Created on : Feb 16, 2016, 1:53:54 PM
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
        <title>JSP Page 2</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <div class="col-md-4">
                <div class="form-group">
                    <h1>Add new student</h1>
                    <form:form action="/admin/student" method="POST" modelAttribute="student">
                        <form:label path="">Name </form:label>
                        <form:input class="form-control" path="SName"></form:input><br/>
                        <form:label path="">Address </form:label>
                        <form:input class="form-control" path="address"></form:input><br/>
                        <form:label path="">Email </form:label>
                        <form:input class="form-control" path="email"></form:input><br/>
                        <form:label path="">Phone </form:label>
                        <form:input class="form-control" path="phone"></form:input><br/>
                        <input class="btn btn-primary" type="submit" value="Save student information"/>
                        <input class="btn btn-primary" type="reset" value="Reset"/>
                    </form:form>
                </div>
            </div>
            <div class="col-md-8">
                <h1>Teachers</h1>
                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>Name</th><th>Address</th><th>Email</th><th>Phone</th><th>Subject</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="student" items="${students}">
                            <tr>
                                <td>${student.getTName()}</td><td>${student.getAddress()}</td><td>${student.getEmail()}</td><td>${student.getPhone()}</td>}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <p>${save_info}</p>
        
    </body>
</html>

