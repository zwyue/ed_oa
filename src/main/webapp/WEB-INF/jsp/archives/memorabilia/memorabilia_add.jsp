<%--
  Created by IntelliJ IDEA.
  User: zwy
  Date: 2018/11/20
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>wangEditor demo</title>
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
<div id="div1" class="toolbar">
</div>
<div style="padding: 5px 0; color: #ccc">中间隔离带</div>
<div>标题<textarea name="title"></textarea></div>
<div id="div2" class="text"> <!--可使用 min-height 实现编辑区域自动增加高度-->
    <p>请输入内容</p>
</div>
<button id="btn3">getJSON</button>
<button id="btn1">获取html</button>
<button id="btn2">获取text</button>

<script type="text/javascript">

    var E = window.wangEditor;
    var editor = new E('#div1', '#div2')  ;// 两个参数也可以传入 elem 对象，class 选择器
    editor.create();
    var content,title ;

    document.getElementById('btn1').addEventListener('click', function () {
        // 读取 html
        alert(editor.txt.html());
        content = editor.txt.text();
        title = document.getElementsByName("title");
        title = title[0].value;
        $.ajax({
            type:"post",
            url:"/memorabilia/save",
            // dataType:"json",
            data:{content:content,title:title},
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

    editor.txt.html("<p>请输入内容</p><p>点十分<span style=\"background-color: rgb(249, 150, 59);\">广泛的学</span>习编程v吧</p><p>发多少个，e</p><h1>&nbsp; &nbsp; &nbsp; &nbsp; 古典风格犯得上广泛大概</h1><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 反对<span style=\"color: rgb(249, 150, 59);\">广泛大使馆犯得</span>上<span style=\"font-weight: bold;\"></span></p><p>反对犯得上格式发给</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 反对广泛大使馆</p>")

    // var content = editor.txt.text();
    // console.log(content);
</script>
</body>
