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
    <c:set scope="request" value="${requestScope['orderDetail']}" var="od"/>
    <p>Order ID: <input name="oId" value="${od.getOrderId()}" readonly></p>
    <c:forEach items="${requestScope['orderDetailHashMap']}" var="record">
        <p>Product ID: <input name="pId" value="${record.key}" readonly></p>
        <p>Quantity: <input name="amount" value="${record.value}" readonly></p>
    </c:forEach>
    <p>Total Price: <input name="typePrice" value="${od.getPrice()}" readonly></p>
    <input type="submit" value="MUA HÀNG">
</form>
</body>
</html>
