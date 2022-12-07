<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/4/2022
  Time: 4:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p><a href="/products">Back to home page</a></p>

<form method="post">
    <c:set scope="request" value="${requestScope['product']}" var="product"/>
<p>ID: <input type="text" name="id" value="${product.getId()}" DISABLED></p>
<p>NAME: <input type="text" name="name" value="${product.getName()}"></p>
<p>PRICE: <input type="number" name="price" value="${product.getPrice()}"></p>
<p>QUANTITY: <input type="number" name="quantity" value="${product.getQuantity()}"></p>
<p>IMAGE: <input type="text" name="image" value="${product.getImage()}"></p>
<input type="submit" value="Update">
</form>
<c:if test="${requestScope['updateMes'] != null}">
    <span class="message"><c:out value="${requestScope['updateMes']}"/></span>
</c:if>
</body>
</html>
