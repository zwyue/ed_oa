<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/22
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.bootcss.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
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
                    <label for="inputId" class="col-sm-2 control-label">ID</label>
                    <div class="col-sm-10">
                        <input type="text" name="id" class="form-control" id="inputId" placeholder="id">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">name</label>
                    <div class="col-sm-10">
                        <input type="text"  name="userName" class="form-control" id="inputName" placeholder="name">
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputPhone" class="col-sm-2 control-label">phone</label>
                    <div class="col-sm-10">
                        <input type="text"  name="userPhone" class="form-control" id="inputPhone" placeholder="phone">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">email</label>
                    <div class="col-sm-10">
                        <input type="text"  name="userEmail" class="form-control" id="inputEmail" placeholder="email">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button onclick="addUser()" type="submit" class="btn btn-success">添加</button>
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
        var form = document.forms[0];
        form.action = "addUser";
        form.method = "post";
        form.submit();
    }
</script>