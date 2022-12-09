<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/7/2022
  Time: 8:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html" ; charset="UTF-8">
    <title>Home page</title>
    <%--Include Bootstrap’s CSS and JS https://getbootstrap.com/docs/5.2/getting-started/introduction/--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <style>
        div,a{
            margin-left: 20px;
        }
    body {
      margin: 0;
      font-family: Arial, Helvetica, sans-serif;
      position: absolute;
    }
nav{
background: blue}
    .topnav {
      width: 100%;
      overflow: hidden;
      background-color: #333;
        color: white;
        position: fixed;
    }

    .topnav a {
      float: left;
      color: white;
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
      font-size: 17px;
    }

    .topnav a:hover {
      background-color: blue;
      color: black;
    }

    .topnav a.active {
      background-color: #4CAF50;
      color: white;
    }
    .row{

    }

  </style>
    <nav class="navbar navbar-expand-lg bg-light">    <!--mau den bg-dark-->
        <div class="container-fluid">
            <a class="navbar-brand" href="/products?action=list">List</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/products?action=login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/products?action=basket">Tạo đơn</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/products?action=order">Giỏ hàng</a>
                    </li>
                </ul>
                <span class="navbar-text">
<nav class="navbar bg-light">
  <div class="container-fluid">
    <form class="d-flex" role="search" method="post" action="/products?action=search">
      <input class="form-control me-2" type="text" name="name" placeholder="Search" aria-label="Search">    <%--ham search() o servlet lay name nay de getParameter()--%>
      <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
  </div>
</nav>
                </span>
            </div>
        </div>
    </nav>



</head>
<body>

<br/>
<div class="alert alert-secondary" role="alert" style="margin-left: 0px">
    <c:if test="${requestScope['createBasketMes'] != null}">
        <span class="message">${requestScope['createBasketMes']}</span>
    </c:if>
</div>

<h1 style=" color : green;size: A5; text-align: center">TECHNOLOGY WEBSITE</h1>
<%--<form action="/products" method="get">--%>
<%--  <input type="text" name="search" placeholder="Search">--%>
<%--  <button type="submit" value="search" name="action">Search</button>--%>
<%--</form>--%>

<div class="row">
  <c:forEach var="product" items="${listProduct}">
    <div class="col-3 mx-auto">
      <a href="/products?action=view&id=${product.getId()}"><img src="${product.getImage()}"
                                                                 alt="not found" height="250px"></a>
      <div class="name" >${product.getName()}</div>
      <div class="price">${product.getPrice()} $</div>
    </div>
  </c:forEach>
</div>

<%--Include Bootstrap’s CSS and JS https://getbootstrap.com/docs/5.2/getting-started/introduction/--%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>

