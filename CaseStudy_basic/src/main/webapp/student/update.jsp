<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/7/2022
  Time: 9:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p><a href="/students">Back to home page</a></p>

<form method="post">
    <c:set scope="request" value="${requestScope['student']}" var="student"/>
    <p>ID: <input type="text" name="id" value="${student.getId()}" DISABLED></p>
    <p>NAME: <input type="text" name="name" value="${student.getName()}"></p>
    <p>BIRTHDAY: <input type="text" name="dateOB" value="${student.getDateOB()}"></p>
    <p>EMAIL: <input type="text" name="email" value="${student.getEmail()}"></p>
    <p>ADDRESS: <input type="text" name="address" value="${student.getAddress()}"></p>
    <p>CLASSROOM: <input type="text" name="classroom" value="${student.getClassroom()}"></p>
    <p>NUMBER PHONE: <input type="text" name="numberPhone" value="${student.getNumberPhone()}"/></p>
    <input type="submit" value="Update">
</form>
<c:if test="${requestScope['updateMes'] != null}">
    <span class="message"><c:out value="${requestScope['updateMes']}"/></span>
</c:if>

</body>
</html>
