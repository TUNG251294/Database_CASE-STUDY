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
    <title>LIST</title>
</head>
<body>
<h1>STUDENTS LIST</h1>
<h2><a href="/students?action=create">Create new student</a></h2>
<form method="post" action="/students?action=search">
    <input type="text" name="name"> <%--ham search() o servlet lay name nay de getParameter()--%>
    <input type="submit" value="search">
</form>
<div>
    <table border="1">
        <tr><th>ID: </th>
            <th>NAME: </th>
            <th>BIRTHDAY: </th>
            <th>EMAIL: </th>
            <th>ADDRESS: </th>
            <th>CLASSROOM: </th>
            <th>NUMBER PHONE: </th>
            <th>ACTIVE</th>
        </tr>
        <c:forEach items="${requestScope['listStudent']}" var="student">
            <tr><td><c:out value="${student.getId()}"/></td>
                <td><c:out value="${student.getName()}"/></td>
                <td><c:out value="${student.getDateOB()}"/></td>
                <td><c:out value="${student.getEmail()}"/></td>
                <td><c:out value="${student.getAddress()}"/></td>
                <td><c:out value="${student.getClassroom()}"/></td>
                <td><c:out value="${student.getNumberPhone()}"/></td>
                <td><a href="/students?action=update&id=${student.getId()}">Update</a></td>
                <td><a href="/students?action=remove&id=${student.getId()}">Remove</a></td>
            </tr>
        </c:forEach>
    </table>
</div>

<c:if test="${requestScope['removeMes'] != null}">
    <span class="message">${requestScope['removeMes']}</span>
</c:if>
</body>
</html>
