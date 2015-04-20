<%--
  Created by IntelliJ IDEA.
  User: Арсений
  Date: 10.04.2015
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>


<html>
<head>
    <title>MyCRM</title>
    <link rel="stylesheet" href="lib/bootstrap-yeti.min.css"/>
    <script src="lib/jquery-2.1.1.js"></script>
    <script src="lib/bootstrap.js"></script>
    <link rel="stylesheet" href="lib/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <meta charset="UTF-8">
</head>
<body>

<%@ include file="view/header.jsp" %>

<div id="wrapper">

<%@ include file="view/sidebar.jsp" %>

<%@ include file="view/orders_view.jsp" %>

</div>

<script src="js/main.js"></script>
</body>
</html>
