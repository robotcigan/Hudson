<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="MySql" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test"
                   user="root"  password="admin"/>


<sql:query var="sql" dataSource="${MySql}">
    select * from QUERY
</sql:query>

<html>
<head>
    <title>Hudson</title>
    <link rel="stylesheet" href="../lib/bootstrap-yeti.min.css"/>
    <script src="../lib/jquery-2.1.1.js"></script>
    <script src="../lib/bootstrap.js"></script>
    <link rel="stylesheet" href="../css/style.css"/>
    <meta charset="UTF-8">
</head>
<body>
<div class="container">

    <h1>Charts</h1>
    <!-- График -->
    <script src="../lib/Highcharts/highcharts.js"></script>
    <script src="../lib/Highcharts/exporting.js"></script>
    <script src="../lib/Highcharts/export-csv.js"></script>

    <div id="chart" style="min-width: 410px; height: 550px; margin: 0 auto"></div>

    <script type="text/javascript">
        $(function () {
            $('#chart').highcharts({
                chart: {
                    zoomType: 'x'
                },
                title: {
                    text: 'chart demo'
                },
//                   subtitle: {
//                       text: document.ontouchstart === undefined ?
//                               'Есть возможность увеличить масштаб простым выделением интересующего участка графика' :
//                               'Pinch the chart to zoom in'
//                   },
                xAxis: {
                    // type: 'datetime',
                    // minRange: 14 * 24 * 3600000 // fourteen days
                    categories: []
        },
                yAxis: {
            title: {
                text: ''
            }
        },
        legend: {
            enabled: false
        },
        plotOptions: {
            area: {
                fillColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1},
                    stops: [
                        [0, Highcharts.getOptions().colors[0]],
                        [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                    ]
                },
                marker: {
                    radius: 2
                },
                lineWidth: 1,
                        states: {
                    hover: {
                        lineWidth: 1
                    }
                },
                threshold: null
            }
        },

        series: [{
            //  type: 'area',
            name: 'test',
            //  pointInterval: 24 * 3600,
            //  pointStart: Date.UTC(2006, 0, 1),
            data: [<c:forEach var="row" items="${sql.rows}">${row.id_query},</c:forEach>]
        }]
        });
        });
    </script>

</div>
</body>
</html>
