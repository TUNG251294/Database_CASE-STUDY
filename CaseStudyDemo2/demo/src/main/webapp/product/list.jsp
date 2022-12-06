<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/4/2022
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>HOME PAGE</title>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<h1>PRODUCTS LIST</h1>
<h2><a href="/products?action=create">Create new product</a></h2>
<form method="post" action="/products?action=search">
    <input type="text" name="name"> <%--ham search() o servlet lay name nay de getParameter()--%>
    <input type="submit" value="search">
</form>

<p><a href="/products?action=order">Giỏ hàng</a></p>

<div>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>PRICE</th>
            <th>QUANTITY</th>
            <th>IMAGE</th>
            <th>ACTIVE</th>
        </tr>
        <c:forEach items="${requestScope['listProduct']}" var="product">
            <tr>
                <td><c:out value="${product.getId()}"/></td>
                <td><c:out value="${product.getName()}"/></td>
                <td><c:out value="${product.getPrice()}"/></td>
                <td><c:out value="${product.getQuantity()}"/></td>
                <td><a href = "/products?action=view&id=${product.getId()}"><img src="${product.getImage()}" alt ="not found"></a></td>
                <td><a href="/products?action=update&id=${product.getId()}">Update</a></td>
                <td><a href="/products?action=remove&id=${product.getId()}">Remove</a></td>
            </tr>
        </c:forEach>
    </table>
</div>

<c:if test="${requestScope['removeMes'] != null}">
    <span class="message">${requestScope['removeMes']}</span>
</c:if>
</body>
</html>
