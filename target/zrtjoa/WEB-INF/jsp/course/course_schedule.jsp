<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/12/11
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    pageContext.setAttribute("path",request.getContextPath());
%>
<html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>课程表</title>
    <!-- S  CSS -->
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        table {
            border: 1px solid #3bafda;
            margin: 100px auto;
            text-align: center;
            border-collapse: collapse;
            width: 1000px;
            height: 200px;
        }

        table th {
            border: 1px solid #3bafda;
            padding: 10px;
        }

        table td {
            border: 1px solid #48cfad;
            padding: 4px 10px;
        }
    </style>
    <!-- E  CSS -->
</head>

<body>
<!-- S   课程表 -->
<table>
    <caption>课程表</caption>
    <thead>
    <tr>
        <th colspan="2">时间</th>
        <th>教室</th>
        <th>星期一</th>
        <th>星期二</th>
        <th>星期三</th>
        <th>星期四</th>
        <th>星期五</th>
        <%--<th>星期六</th>--%>
        <%--<th>星期天</th>--%>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="child">
        <tr id="${child}">
            <td>时间</td>
            <td>时间</td>
            <td>${child.classroom}</td>
            <td><p>${child.monday.split(',')[0]}</p><p>${child.monday.split(',')[1]}</p></td>
            <td><p>${child.tuesday.split(',')[0]}</p><p>${child.tuesday.split(',')[1]}</p></td>
            <td><p>${child.wednesday.split(',')[0]}</p><p>${child.wednesday.split(',')[1]}</p></td>
            <td><p>${child.thursday.split(',')[0]}</p><p>${child.thursday.split(',')[1]}</p></td>
            <td><p>${child.friday.split(',')[0]}</p><p>${child.friday.split(',')[1]}</p></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<!-- S   课程表 -->
</body>
</html>
