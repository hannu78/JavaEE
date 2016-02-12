<%-- 
    Document   : second.jsp
    Created on : Feb 9, 2016, 1:04:50 PM
    Author     : Ohjelmistokehitys
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page 2</title>
    </head>
    <body>
        <h1>Add new teacher</h1>
        <form:form action="/teacher" method="POST" modelAttribute="teacher">
            <form:label path="">Name </form:label>
            <form:input path="TName"></form:input><br/>
            <form:label path="">Email </form:label>
            <form:input path="email"></form:input><br/>
            <form:label path="">Phone </form:label>
            <form:input path="phone"></form:input><br/>
            <form:label path="">Subject </form:label>
            <form:input path="TSubject"></form:input><br/>
            <input type="submit" value="Save teacher information"/>
        </form:form>
        <p>${save_info}</p>
        <table>
            <thead>
                <tr>
                    <th>Name</th><th>Email</th><th>Phone</th><th>Subject</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="teacher" items="${teachers}">
                    <tr>
                        <td>${teacher.getTName()}</td><td>${teacher.getEmail()}</td><td>${teacher.getPhone()}</td><td>${teacher.getTSubject()}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
