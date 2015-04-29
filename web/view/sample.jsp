<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
    <title></title>
    <script src="/lib/jquery-2.1.1.js"></script>
</head>
<body>
    <button id="test">Name</button>
    <input name="name" type="text"/>
    <script>
        $('#test').click(function(){
            window.location.replace(location + "?name=hello");
        })
    </script>
</body>
</html>
