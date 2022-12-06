<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/5/2022
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>PRODUCT SAME NAME</title>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<p><a href="/products">Back to home page</a></p>
<table border="1">
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>PRICE</th>
        <th>QUANTITY</th>
        <th>IMAGE</th>
    </tr>
    <c:forEach items="${requestScope['product']}" var="product">
    <tr>
    <td><c:out value="${product.getId()}"/></td>
        <td><c:out value="${product.getName()}"/></td>
        <td><c:out value="${product.getPrice()}"/></td>
        <td><c:out value="${product.getQuantity()}"/></td>
        <td><a href = "/products?action=view&id=${product.getId()}"><img src="${product.getImage()}" alt ="not found"></a></td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
