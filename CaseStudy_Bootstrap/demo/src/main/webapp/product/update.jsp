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
    <%--Include Bootstrap’s CSS and JS https://getbootstrap.com/docs/5.2/getting-started/introduction/--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title>Title</title>

    <link rel="stylesheet" href="css/main.css">
    <style>
        div{
            margin-left: 20px;
        }
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            position: absolute;
        }

        .topnav {
            width: 100%;
            overflow: hidden;
            background-color: #333;
            position: fixed;
        }

        .topnav a {
            float: left;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 17px;
        }

        .topnav a:hover {
            background-color: #ddd;
            color: black;
        }

        .topnav a.active {
            background-color: #4CAF50;
            color: white;
        }
        .row{

        }

    </style>
    <div class="topnav" style="padding-right: 10px; margin-left: 0px">
        <a class="active" href="/products" >Trang chủ</a>
        <a href="/products?action=login">Log out</a>

    </div>
</head>
<body>
<br/>
<br/>
<br/>
<br/>

<form method="post">
    <c:set scope="request" value="${requestScope['product']}" var="product"/>
    <div class="mb-3">
        <label class="form-label">ID</label>
        <input class="form-control" type="text" name="id" value="${product.getId()}" DISABLED>
    </div>
    <div class="mb-3">
        <label class="form-label">NAME</label>
        <input class="form-control" type="text" name="name" value="${product.getName()}">
    </div>
    <div class="mb-3">
        <label class="form-label">PRICE</label>
        <input class="form-control" type="number" name="price" value="${product.getPrice()}">
    </div>
    <div class="mb-3">
        <label class="form-label">QUANTITY</label>
        <input class="form-control" type="number" name="quantity" value="${product.getQuantity()}">
    </div>
    <div class="mb-3">
        <label class="form-label">IMAGE</label>
        <input class="form-control" type="text" name="image" value="${product.getImage()}">
    </div>
    <div class="mb-3">
        <input class="form-control" type="submit" value="Update">
    </div>
</form>

<c:if test="${requestScope['updateMes'] != null}">
    <span class="message"><c:out value="${requestScope['updateMes']}"/></span>
</c:if>

<%--Include Bootstrap’s CSS and JS https://getbootstrap.com/docs/5.2/getting-started/introduction/--%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

</body>
</html>
