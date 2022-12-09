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
    <%--Include Bootstrap’s CSS and JS https://getbootstrap.com/docs/5.2/getting-started/introduction/--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title>PRODUCT INFORMATION</title>

    <style>
        p,h2,input {
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

        .row {

        }

    </style>
    <div class="topnav" style="padding-right: 10px">
        <a class="active" href="/products">Trang chủ</a>
        <a href="/products?action=login">Log out</a>
    </div>
</head>
<body>
<br/>
<br/>
<br/>
<br/>
<h2 style="color: purple"><c:out value="${product.getName()}"/></h2>
<p>ID: <c:out value="${product.getId()}"/></p>
<p>GIÁ CẢ: <c:out value="${product.getPrice()}"/> $</p>
<p>ĐANG CÓ: <c:out value="${product.getQuantity()}"/></p>
<img src="${product.getImage()}" alt="not fount" STYLE="height: 200px">

<form method="post" action="/products?action=order">
    <p>Sản phẩm: <input type="text" name="id" value="${product.getId()}" readonly></p>
    <!--Khong cho phep sua ten san pham,neu dung disable thì hàm order() ben servlet khong lay duoc gia tri request de setAttribute-->
    <p>Số lượng: <input type="number" name="amount"></p>
    <input type="submit" value="THÊM VÀO GIỎ">
</form>

<%--Include Bootstrap’s CSS and JS https://getbootstrap.com/docs/5.2/getting-started/introduction/--%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>

</body>
</html>
