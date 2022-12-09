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
    <style>
        span{color: blue;
        }
    </style>
</head>
<body>
<h1><a href="/students">Back home page</a></h1>
<h1>CREATE NEW STUDENT</h1>
<c:if test="${requestScope['createMes'] != null}">
    <span class="message">${requestScope['createMes']}</span>
</c:if>
<form method="post">
    <p><div><span>ID: </span></div><input type="text" id="id" name="id"/></p>
    <p><div><span>NAME: </span></div><input type="text" id="name" name="name"/></p>
    <p><div><span>BIRTHDAY: </span></div><input type="text" id="dateOB" name="dateOB"/></p>
    <p><div><span>EMAIL: </span></div><input type="text" id ="email" name="email"/></p>
    <p><div><span>ADDRESS: </span></div><input type="text" id = "address" name="address"/></p>
    <p><div><span>CLASSROOM: </span></div><input type="text" id = "classroom" name="classroom"/></p>
    <p><div><span>NUMBER PHONE: </span></div><input type="text" id = "numberPhone" name="numberPhone"/></p>

    <input type="submit" value="CREATE NEW"/>
</form>
</body>
</html>
