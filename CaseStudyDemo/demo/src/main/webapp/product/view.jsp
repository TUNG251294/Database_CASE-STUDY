<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/4/2022
  Time: 8:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>PRODUCT INFORMATION</title>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<a href="/products">Back to home page</a>
    <p><c:out value="${product.getId()}"/></p>
    <p><c:out value="${product.getName()}"/></p>
    <p><c:out value="${product.getPrice()}"/></p>
    <p><c:out value="${product.getQuantity()}"/></p>
    <p><img src="${product.getImage()}"></p>

    <form method="post" action="/products?action=order">
    <p>Sản phẩm: <input type="text" name="id" value="${product.getId()}" readonly></p>
        <!--Khong cho phep sua ten san pham,neu dung disable thì hàm order() ben servlet khong lay duoc gia tri request de setAttribute-->
    <p>Số lượng: <input type="number" name="amount"></p>
    <input type="submit" value="MUA HÀNG">
</form>
</body>
</html>
