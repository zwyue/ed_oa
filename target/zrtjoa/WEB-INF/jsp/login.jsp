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
    <meta charset="UTF-8">
    <title>老年大学系统——登录页</title>
    <link rel="stylesheet" href="../../static/plugins/layui-v2.4.3/layui/css/layui.css" />
    <link rel="stylesheet" href="../../static/css/common.css" />
    <link rel="stylesheet" href="../../static/css/login.css" />
</head>
<body>
<div class="all">
    <div class="login">
        <div class="login_cont">
            <h2>天津老年大学OA管理系统</h2>
            <!--登录框-->
            <div class="loginContent">
                <section class="fl loginContentLeft"> </section>
                <!--表单-->
                <section class="fr loginContentRight">
                    <form id="login_form" method="post" action="/index/login">
                        <section>
                            <label class="fl">
                                <i class="layui-icon layui-icon-username"></i>
                            </label>
                            <input type="text" class="input username" name="tnumber" id=" login_user_name" aria-label="用户名" placeholder="用户名">
                        </section>
                        <div class="hint">请输入用户名</div>

                        <section>
                            <label class="fl">
                                <i class="layui-icon layui-icon-password"></i>
                            </label>
                            <input type="password" class="input passward" name="password" id="login_password" aria-label="密码" placeholder="密码">
                        </section>
                        <div class="hint">请输入密码</div>

                        <div class="radio">
                            <div><input type="radio" name="juese" value="老师" /><label>老师</label></div>
                            <div><input type="radio" name="juese" value="管理员"  /><label>管理员</label></div>
                        </div>
                        <input type="submit" id="dlButton" class="btn_login" name="button" value="登录">
                    </form>
                    <p class="warn">${msg}</p>
                    <div class="login_bottom">
                    </div>

                </section>
                <!--表单 end-->
            </div>
            <!--登录框 end-->
        </div>
    </div>
</div>

<script type="text/javascript" src="/static/plugins/jQuery/jquery-3.3.1.min.js"></script>
<%--<script type="text/javascript" src="/static/js/logo.js"></script>--%>

<script>
    //aiax请求数据
    function ajax_get(){
        $("#dlButton").click(function (){

            var form = $("#login_form") ;
            form.submit();

        })
    };
    ajax_get();
</script>
<script>
       $(".username").focus();
       $(".username").keydown(function (event) {
           if (event.keyCode=="13") {//回车键,移动光标到密码框
               $(".passward").focus();
           }
       });
       $(".passward").keydown(function (event) {
           if (event.keyCode =="13") {//回车键，用.ajax提交表单
               $(".btn_login").focus();
           }
       });

</script>
</body>
</html>