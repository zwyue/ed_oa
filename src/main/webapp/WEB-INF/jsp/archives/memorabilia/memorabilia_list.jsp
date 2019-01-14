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

    <style type="text/css">
        #pagination a{
            border: 1px solid #000000;
            width: 50px;
            height:20px;
            float: left;
            margin-left: 10px;cursor: pointer;
        }
    </style>

</head>
<body>
<a href="/user/download"></a>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>大事记列表</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <a class="btn btn-primary" href="/memorabilia/toSave">新增</a>
            <a class="btn btn-primary" onclick="deleteResource()">批量删除</a>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-striped">
                <tbody id="pageInfo">
                    <tr>
                        <th>选择</th>
                        <th>id</th>
                        <th>标题</th>
                        <%--<th>缩略信息</th>--%>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>

                    <c:forEach items="${list}" var="list">
                        <tr id="${list.id}">
                            <td><input type="checkbox" value="${list.id}" name="idList"></td>
                            <td>${list.id}</td>
                            <td>${list.title}</td>
                            <%--<td>${list.contentAbbr}</td>--%>
                            <td>${list.crttime}</td>
                            <td>
                                <a type="button"  href="${path}/memorabilia/queryMemorabiliaById?id=${list.id}" class="btn btn-info btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑</a>
                                <a type="button"  href="${path}/memorabilia/export?id=${list.id}" class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>
                                    删除</a>
                            </td>
                        </tr>

                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div id="pagination" style="margin-top: 10px;height: 35px;">
        <a id="firPage" onclick="firstPage()" style="margin-left: 0px;width: 35px;">首页</a>
        <a id="prePage" onclick="prevPage()">上一页</a>
        <a id="nexPage" onclick="pnextPage()">下一页</a>
        <a id="lasPage" onclick="lastPage()" style="width: 35px;">尾页</a>
        <input id="numPage" style="width: 40px;margin-left: 10px;height: 16px;" />
    </div>
</div>

</body>
<script>
    function deleteResource() {
        var memorabiliaIds = document.getElementsByName("idList");
        var ids = [];
        for (var i=0;i<memorabiliaIds.length;i++){
            if(memorabiliaIds[i].checked){
                ids.push(memorabiliaIds[i].value);
            }
        }
        deleteMethod(ids);

    }

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
            url:'/memorabilia/delete' ,
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
<script src="/js/pagination.js"></script>
</html>
