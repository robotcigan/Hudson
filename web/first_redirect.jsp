<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
    <%
        String back = new String("monitoring");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", back);
    %>
</body>
</html>
