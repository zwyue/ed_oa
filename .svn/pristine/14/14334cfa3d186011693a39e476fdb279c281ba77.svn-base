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
            <h1>获奖情况列表</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <a class="btn btn-primary" href="/award/addAward">新增</a>
        </div>
        <div>
            标题：<input type="text" value="" name="title" id="title">
            <input type="button" onclick="query()" value="查询">
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-striped">
                <tr>
                    <th>序号</th>
                    <th>id</th>
                    <th>标题</th>
                    <%--<th>缩略信息</th>--%>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                <c:forEach begin="0" step="1" items="${list}" var="list" varStatus="userlist">
                    <tr>
                        <td>${userlist.count}</td>
                        <td>${list.id}</td>
                        <td>${list.title}</td>
                            <%--<td>${list.contentAfbbr}</td>--%>
                        <td>${list.crttime}</td>
                        <td>
                            <a type="button"  href="${path}/award/query?id=${list.id}" class="btn btn-info btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑</a>
                            <a type="button"  href="${path}/award/export?id=${list.id}" class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>
                                导出word</a>
                        </td>
                    </tr>

                </c:forEach>
            </table>
        </div>
    </div>
    <p>共${page.pages}页</p>
    <a href="list?page=${page.firstPage}">首页</a>
    <a href="list?page=${page.prePage}">上一页</a>
    <a href="list?page=${page.nextPage}">下一页</a>
    <a href="list?page=${page.lastPage}">末页</a>
</div>

</body>
<script>
    function query() {
        var title = $("#title").val();
        $.ajax({
            type:"get",
            url:"/award/getTitle",
            data:{title:title},
            async:true,
            success: function (result) {
                if(result.msg=="success"){
                    alert(1);
                }
            }
        });
    }
</script>
</html>
