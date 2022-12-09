<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/7/2022
  Time: 9:53 AM
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
<table border="1">
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>BIRTHDAY</th>
        <th>EMAIL</th>
        <th>ADDRESS</th>
        <th>CLASSROOM</th>
        <th>NUMBER PHONE</th>
    </tr>
    <c:forEach items="${requestScope['student']}" var="student">
        <tr>
            <td><c:out value="${student.getId()}"/></td>
            <td><c:out value="${student.getName()}"/></td>
            <td><c:out value="${student.getDateOB()}"/></td>
            <td><c:out value="${student.getEmail()}"/></td>
            <td><c:out value="${student.getAddress()}"/></td>
            <td><c:out value="${student.getClassroom()}"/></td>
            <td><c:out value="${student.getNumberPhone()}"/></td>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
