<%-- 
    Document   : course
    Created on : Feb 17, 2016, 10:48:22 AM
    Author     : Ohjelmistokehitys
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Courses</title>
    </head>
    <body>
         <%@include file="header.jsp" %>
         <div class="container">
           <div class="row">
               <div class="col-md-6">
                   <h1>Add New course</h1>
                   <form:form action="/admin/course" method="POST" modelAttribute="course">
                       <form:label path="">Name</form:label><br/>
                       <form:input cssClass="form-control" path="CName"></form:input><br/>
                       <form:label path="">Info</form:label><br/>
                       <form:input cssClass="form-control" path="CInfo"></form:input><br/>
                       <input class="btn btn-primary" type="submit" value="Save Student"/>
                   </form:form>
               </div>
               <div class="col-md-6">
                   <h1>All courses</h1>
                   <table class="table table-hover table-bordered">
                       <thead>
                           <tr>
                               <th>Course name</th>
                               <th>Course Info</th>
                           </tr>
                       </thead>
                       <tbody>
                           <c:forEach var="course" items="${courses}">
                               <tr>
                                   <td>${course.getCName()}</td>
                                   <td>${course.getCInfo()}</td>
                               </tr>
                           </c:forEach>
                       </tbody>
                   </table>
               </div>
           </div>
       </div>
    </body>
</html>
