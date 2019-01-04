<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.bootcss.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <style>
        .container{
            width: 400px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row" >
        <div class="col-md-12">
            <form class="form-horizontal">
                <div class="form-group">
                    <label for="number" class="col-sm-6 control-label">班级序号</label>
                    <div class="col-sm-10">
                        <input type="text" name="number" class="form-control" id="number" value="${classes.number}" placeholder="id">
                        <input type="hidden" name="ids" value="${classes.id}" id="ids">
                        <input type="hidden" name="cateid" value="${classes.cateid}" id="cateid">
                        <input type="hidden" name="catename" value="${classes.catename}" id="catename">
                        <input type="hidden" name="majorid" value="${classes.majorid}" id="majorid">
                        <input type="hidden" name="majorname" value="${classes.majorname}" id="majorname">
                    </div>
                </div>
                <div class="form-group">
                    <label for="classname" class="col-sm-6 control-label">班级名称</label>
                    <div class="col-sm-10">
                        <input type="text"  name="classname" class="form-control" id="classname" value="${classes.classname}" placeholder="name">
                    </div>
                </div>

                <div class="form-group">
                    <label for="plansize" class="col-sm-6 control-label">计划班级人数</label>
                    <div class="col-sm-10">
                        <input type="text"  name="plansize" class="form-control" id="plansize" value="${classes.plansize}" placeholder="phone">
                    </div>
                </div>
                <div class="form-group">
                    <label for="category" class="col-sm-6 control-label">类别</label>
                    <div class="col-sm-10">
                        <select class="form-control" id="category">
                            <option value="${classes.cateid}">${classes.catename}</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="profession" class="col-sm-6 control-label">专业</label>
                    <div class="col-sm-10">
                        <select class="form-control" id="profession">
                            <option value="${classes.majorid}">${classes.majorname}</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button onclick="addUser()" class="btn btn-success">保存</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script>
    function addUser(){
        var cateid = $("#category").val();
        $("#cateid").val(cateid);
        alert(cateid);
        var catename= $("#category").find("option:selected").text();
        $("#catename").val(catename);
        var majorid = $("#profession").val();
        $("#majorid").val(majorid);
        var majorname = $("#profession").find("option:selected").text();
        $("#majorname").val(majorname);
        var number = $("#number").val();
        var classname = $("#classname").val();
        var plansize = $("#plansize").val();
        var id = $("#ids").val();
        $.ajax({
            type:"post",
            url:"/classes/update",
            data:{id:id,number:number,classname:classname,plansize:plansize,cateid:cateid,catename:catename,majorid:majorid,majorname:majorname},
            async:true,
            success: function (result) {
                console.log("log 13.2 异步调用返回成功,result:"+result);
                if(result.msg=="success"){
                    window.location.href="<%=basePath%>classes/list";
                }
            },
            error: function (XMLHttpResponse, textStatus, errorThrown) {
                window.location.href="<%=basePath%>classes/list";
                console.log("1 异步调用返回失败,XMLHttpResponse.readyState:"+XMLHttpResponse.readyState);
                console.log("2 异步调用返回失败,XMLHttpResponse.status:"+XMLHttpResponse.status);
                console.log("3 异步调用返回失败,textStatus:"+textStatus);
                console.log("4 异步调用返回失败,errorThrown:"+errorThrown);
            }
        });
    }

    $(function(){
        //ajax实现二级联动
        $.post("/classes/catelist",function(data){
            if(data){
                var category = "";
                for(var i=0;i<data.length;i++){
                    category += "<option value='" + data[i].id + "'>" + data[i].category + "</option>";
                }
                $("#category").append(category);
            }
            //选中一级学科触发函数,异步获取二级学科
            $("#category").change(function() {
                var category = $("#category").val();//获取下拉列表中的选中项
                $("#profession > option:gt(0)").each(function(){//避免option累加
                    $("#profession").empty();
                });
                $.post("/classes/prolist",{cateid:category},function(data,status){
                    var profession = "";
                    for(var i=0;i<data.length;i++){
                        profession += "<option value='" + data[i].id + "'>" + data[i].majorname + "</option>";
                    }
                    $("#profession").append(profession);
                });
            });
        });
    })

    /*function _option() {

    };*/

</script>