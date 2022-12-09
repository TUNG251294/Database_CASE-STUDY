<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/4/2022
  Time: 2:39 PM
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
        img {
            width: 100px;
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
<h1 style="margin-left: 20px">PRODUCTS LIST</h1>


<form class="row g-3" method="post" action="/products?action=search">
    <div class="col-auto" style="margin-left: 20px">
        <input  class="form-control" type="text" name="name">   <%--ham search() o servlet lay name nay de getParameter()--%>
    </div>
    <div class="col-auto" style="margin-left: 20px">
        <button type="submit" class="btn btn-primary mb-3">Search</button>
    </div>
</form>

<div style="margin-left: 20px">
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
                <td><c:out value="${product.getPrice()}"/> $</td>
                <td><c:out value="${product.getQuantity()}"/></td>
                <td><a href="/products?action=view&id=${product.getId()}"><img src="${product.getImage()}"
                                                                               alt="not found"></a></td>
                <td><a href="/products?action=update&id=${product.getId()}">Update</a></td>
                <td><a href="/products?action=remove&id=${product.getId()}">Remove</a></td>
            </tr>
        </c:forEach>
    </table>
</div>

<c:if test="${requestScope['removeMes'] != null}">
    <span class="message">${requestScope['removeMes']}</span>
</c:if>



<%--Include Bootstrap’s CSS and JS https://getbootstrap.com/docs/5.2/getting-started/introduction/--%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

</body>
</html>
