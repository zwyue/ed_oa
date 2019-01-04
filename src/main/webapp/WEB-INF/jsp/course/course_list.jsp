<%--
  Created by IntelliJ IDEA.
  User: zwy
  Date: 2018/11/20
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    pageContext.setAttribute("path",request.getContextPath());
%>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="../../../js/course_manage.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        #course_form_update{
            display: none;
            position: absolute;
            z-index: 101;
        }
        /* 半透明的遮罩层 */
        #overlay {
            background: #000;
            filter: alpha(opacity=50); /* IE的透明度 */
            opacity: 0.5;  /* 透明度 */
            display: none;
            position: absolute;
            top: 0px;
            left: 0px;
            width: 100%;
            height: 100%;
            z-index: 100; /* 此处的图层要大于页面 */
            display:none;
        }
    </style>
</head>
<body>

<%--<a href="/user/download"></a>--%>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>课程列表</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <a class="btn btn-primary" onclick="deleteResource()">批量删除</a>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-striped">
                <tr>
                    <th>选择</th>
                    <th>id</th>
                    <th>教室名称</th>
                    <th>周几</th>
                    <th>时间段</th>
                    <th>授课老师</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${list}" var="list">
                    <tr id="${list.id}">
                        <td><input type="checkbox" value="${list.id}" name="idList"></td>
                        <td>${list.id}</td>
                        <td>${list.classroom}</td>
                        <td>${list.week}</td>
                        <td>${list.date}</td>
                        <td>${list.teacher}</td>
                        <td>
                            <a type="button" onclick="editCst('course_form_update',300,400,'${list.classroom}','${list.id}','${list.teacher}')" class="btn btn-info btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑</a>
                            <a type="button" onclick="deleteMethod(${list.id})" class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>
                                删除</a>
                        </td>
                    </tr>

                </c:forEach>
            </table>
        </div>
    </div>
</div>
<div id="overlay"></div>

<div id="course_form_update">

    <form action="/scheduleClass/updatePreset" method="post">
        <p><label>课时名称: </label><input type="input" name="coursename" /></p>
        <p><label>时 间 段: </label><input type="input" name="time" /></p>
        <p><label>id: </label><input type="input" name="id" /></p>
        <input type="submit" value=" 提 交 " />
    </form>
    <button onclick="closeForm('course_form_update')">关闭</button>

</div>
</body>
</html>