<%--
  Created by IntelliJ IDEA.
  User: zwy
  Date: 2018/11/20
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
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
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="//unpkg.com/wangeditor/release/wangEditor.min.js"></script>
    <style type="text/css">
        .toolbar {
            border: 1px solid #ccc;
        }
        .text {
            border: 1px solid #ccc;
            height: 400px;
        }
    </style>
</head>
<body>
<%--<h1>修改档案</h1>--%>
<%--<form action="${pageContext.request.contextPath}/memorabilia/update" method="post" name="userForm">--%>
    <%--<input value="${memorabilia.id}" name="id" type="hidden"/>--%>
    <%--content:<input type="text" name="content" value="${memorabilia.content}"><br>--%>
    <%--<input type="submit" value="确认修改" onclick="update()">--%>
<%--</form>--%>
<div id="div1" class="toolbar">
</div>
<textarea name="title">${memorabilia.title}</textarea>
<div style="padding: 5px 0; color: #ccc">中间隔离带</div>
<div id="div2" class="text"> <!--可使用 min-height 实现编辑区域自动增加高度-->
    <p>请输入内容</p>
</div>
<button id="btn3">getJSON</button>
<button id="btn1">获取html</button>
<button id="btn2">获取text</button>

</body>
</html>
<script>
    <%--alert(${memorabilia.content});--%>
    function update(){
        var form = document.forms[0];
        form.action = "<%=basePath%>memorabilia/update";
        form.method = "post";
        form.submit();
    }
    var E = window.wangEditor;
    var editor = new E('#div1', '#div2')  ;// 两个参数也可以传入 elem 对象，class 选择器
    editor.create();
    var content,title,id ;

    document.getElementById('btn1').addEventListener('click', function () {
        // 读取 html
        alert(editor.txt.html());
        content = editor.txt.html();
        title = document.getElementsByName("title")[0].value;
        $.ajax({
            type:"post",
            url:"/memorabilia/update",
            // dataType:"json",
            data:{content:content,title:title,id:${memorabilia.id}},
            async:true,
            success: function (result) {
                console.log("log 13.2 异步调用返回成功,result:"+result);
                if(result.msg=="success"){
                    parent.location.href='/memorabilia/list';
                }
            },
            error: function (XMLHttpResponse, textStatus, errorThrown) {
                console.log("1 异步调用返回失败,XMLHttpResponse.readyState:"+XMLHttpResponse.readyState);
                console.log("2 异步调用返回失败,XMLHttpResponse.status:"+XMLHttpResponse.status);
                console.log("3 异步调用返回失败,textStatus:"+textStatus);
                console.log("4 异步调用返回失败,errorThrown:"+errorThrown);
            }
        });
    }, false);

    document.getElementById('btn2').addEventListener('click', function () {
        // 读取 text
        alert(editor.txt.text());
        content = editor.txt.text();
    }, false);

    //  var E = window.wangEditor
    //  var editor = new E('#div1')
    //  editor.create()
    //
    document.getElementById('btn3').addEventListener('click', function () {
        var json = editor.txt.getJSON()  // 获取 JSON 格式的内容
        var jsonStr = JSON.stringify(json)
        console.log(json)
        console.log(jsonStr)
        var content =jsonStr.substring()
    });

    editor.txt.html('${memorabilia.content}');

    // var content = editor.txt.text();
    // console.log(content);
</script>
