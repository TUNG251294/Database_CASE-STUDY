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
<h1>Giỏ hàng</h1>
<form method="post" action="/products?action=buy">
<c:forEach items="${requestScope['orderDetail']}" var="record">
    <p><input name="id" value="${record.key}" readonly></p>
    <p><input name="amount" value="${record.value}" readonly></p>
</c:forEach>
    <input type="submit" value="MUA HÀNG">
</form>
</body>
</html>
