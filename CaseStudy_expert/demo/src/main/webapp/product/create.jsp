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
    <title>CREATE NEW PRODUCT</title>
</head>
<body>
<h1><a href="/products">Back home page</a></h1>
<h1>CREATE NEW PRODUCT</h1>
<c:if test="${requestScope['createMes'] != null}">
        <span class="message">${requestScope['createMes']}</span>
</c:if>
<form method="post">
        ID: <input type="text" id="id" name="id"/>
        NAME: <input type="text" id="name" name="name"/>
        PRICE: <input type="number" id="price" name="price"/>
        QUANTITY: <input type="number" id ="quantity" name="quantity"/>
        IMAGE: <input type="text" id = "image" name="image"/>
        <input type="submit" value="CREATE NEW"/>
</form>
</body>
</html>
