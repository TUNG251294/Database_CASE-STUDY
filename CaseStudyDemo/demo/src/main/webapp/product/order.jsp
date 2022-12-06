<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/5/2022
  Time: 4:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>ORDER</title>
</head>
<body>
<a href="/products">Back to home page</a>
<c:set scope="request" value="${requestScope['id']}" var="id"/>
<c:set scope="request" value="${requestScope['amount']}" var="amount"/>
<p><c:out value="${id}"/></p>
<p><c:out value="${amount}"/></p>
</body>
</html>
