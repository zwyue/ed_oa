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
    <link href="https://cdn.bootcss.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<a href="/user/download"></a>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>资源建设列表</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <a class="btn btn-primary" href="/resource/toSave">新增</a>
            <a class="btn btn-primary" onclick="deleteResource()">批量删除</a>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-striped">
                <tr>
                    <th>选择</th>
                    <th>id</th>
                    <th>标题</th>
                    <th>资源建设分类</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${list}" var="list">
                    <tr id="${list.id}">
                        <td><input type="checkbox" value="${list.id}" name="idList"></td>
                        <td>${list.id}</td>
                        <td>${list.title}</td>
                        <td>${list.categoryTxt}</td>
                        <td>${list.crttime}</td>
                        <td>
                            <a type="button"  href="${path}/resource/queryResourceById?id=${list.id}" class="btn btn-info btn-sm">
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

</body>
<script>
    function deleteResource() {
        var resourceIds = document.getElementsByName("idList");
        var ids = [];
        for (var i=0;i<resourceIds.length;i++){
            if(resourceIds[i].checked){
                ids.push(resourceIds[i].value);
            }
        }
        deleteMethod(ids);

    };

    function deleteMethod(ids) {
        console.log(ids);

        if(ids.constructor===Array ){
            console.log("is array");
        }else {
            var temp = ids ;
            ids = [];
            ids.push(temp);
        }
        $.ajax({
            url:'/resource/delete' ,
            async : true,
            type: 'post',
            // dataType: 'json',
            data: {
                idList:ids
            },
            success: function(data){
                console.log(1111111);
                for (var j = 0;j<ids.length;j++){
                    document.getElementById(ids[j]+"").remove();
                }
            },
            error: function(data){
                console.log(2222222);
            }
        });
    }
</script>
</html>
