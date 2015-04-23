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
    <script src="lib/jquery.table2excel.js"></script>
    <meta charset="UTF-8">
</head>
<body>

<%--Защита от вхождения в обход аунтентификации через адресную строку--%>
<%--
<%
    if(request.getAttribute("localUser") == null){
        String back = new String("hello.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", back);
    }
%>
--%>
<%@ include file="view/header.jsp" %>

<div id="view-order"></div>

<div id="wrapper">

<%@ include file="view/sidebar.jsp" %>

<%@ include file="view/orders_view.jsp" %>

</div>


<script src="js/main.js"></script>
</body>
</html>
