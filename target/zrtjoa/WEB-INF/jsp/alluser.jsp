<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/22
  Time: 17:24
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
    <link href="https://cdn.bootcss.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script src="../../js/user.js"></script>
    <script src="../../js/term_manage.js"></script>
    <style>
        #allocate_form {
            display: none;
            position: absolute;
            z-index: 101;
        }
        #term_form_update{
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
<a href="/user/download"></a>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>用户管理</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <a class="btn btn-primary" href="/user/toAddUser">新增</a>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-striped">
                <tr>
                    <th>id</th>
                    <th>name</th>
                    <th>email</th>
                    <th>phone</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${userList}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.userName}</td>
                        <td>${user.userEmail}</td>
                        <td>${user.userPhone}</td>
                        <td>
                            <a type="button"  href="${path}/user/toUpdate?id=${user.id}" class="btn btn-info btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑</a>
                            <a type="button"  href="${path}/user/delUser?id=${user.id}" class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>
                                删除</a>
                            <a type="button" onclick="showForm('allocate_form','','','','','','${user.id}')" class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>
                                分配角色</a>
                        </td>
                    </tr>

                </c:forEach>
            </table>
        </div>
    </div>
</div>
<div id="overlay"></div>
<div id="allocate_form">

    <form action="/role/allocateRole" method="post">
        <%--<div class="title">--%>
        <%--<h2>用户登录</h2><a onclick="layer.style.display=none"></a>--%>
        <%--</div>--%>
        <p><label>userId: </label><input type="input" name="userId" /></p>
        <p><label>roleId: </label><input type="input" name="roleId" /></p>
        <input type="submit" value=" 提 交 " />
    </form>
    <button onclick="closeForm('allocate_form')">关闭</button>

</div>

</body>
</html>
