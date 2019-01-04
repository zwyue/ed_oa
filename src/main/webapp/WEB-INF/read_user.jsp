<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/12/17
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/static/plugins/jQuery/jquery-3.3.1.js"></script>
</head>
<body>
    <form>
        <input name="name"/>
        <input name="idNumber"/>
        <button onclick="readIdCard()">读取身份证</button>
    </form>
</body>
<script>
    function readIdCard() {
        $.ajax({
            type:"post",
            url:"/user/readIdCard",
            async:true,
            success: function (result) {
                console.log("log 13.2 异步调用返回成功,result:"+result);
                if(result.msg=="success"){
                    parent.location.href='/workplan/list';
                }
            },
            error: function (XMLHttpResponse, textStatus, errorThrown) {
                console.log("1 异步调用返回失败,XMLHttpResponse.readyState:"+XMLHttpResponse.readyState);
                console.log("2 异步调用返回失败,XMLHttpResponse.status:"+XMLHttpResponse.status);
                console.log("3 异步调用返回失败,textStatus:"+textStatus);
                console.log("4 异步调用返回失败,errorThrown:"+errorThrown);
            }
        });
    }
</script>
</html>
