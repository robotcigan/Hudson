<%--
  Created by IntelliJ IDEA.
  User: Арсений
  Date: 10.04.2015
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>MyCRM</title>
    <link rel="stylesheet" href="lib/bootstrap-yeti.min.css"/>
    <script src="lib/jquery-2.1.1.js"></script>
    <script src="lib/bootstrap.js"></script>
    <link rel="stylesheet" href="lib/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
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
