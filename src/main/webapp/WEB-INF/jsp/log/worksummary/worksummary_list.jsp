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
    <link href="https://cdn.bootcss.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<a href="/user/download"></a>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>日志管理-班级工作总结列表</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <a class="btn btn-primary" href="/worksummary/add">新增</a>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-striped">
                <tr>
                    <th>id</th>
                    <th>标题</th>
                    <%--<th>缩略信息</th>--%>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${list}" var="list">
                    <tr>
                        <td>${list.id}</td>
                        <td>${list.title}</td>
                            <%--<td>${list.contentAfbbr}</td>--%>
                        <td>${list.recordtime}</td>
                        <td>
                            <a type="button"  href="${path}/worksummary/query?id=${list.id}" class="btn btn-info btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑</a>
                            <a type="button"  href="${path}/worksummary/delete?id=${list.id}" class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>
                                删除</a>
                        </td>
                    </tr>

                </c:forEach>
            </table>
        </div>
    </div>
</div>

</body>
</html>
