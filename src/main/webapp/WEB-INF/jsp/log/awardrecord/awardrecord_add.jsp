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
<button id="btn1">保存</button>
<script type="text/javascript">

    var E = window.wangEditor;
    var editor = new E('#div1', '#div2')  ;// 两个参数也可以传入 elem 对象，class 选择器
    editor.create();
    var content,title ;

    document.getElementById('btn1').addEventListener('click', function () {
        // 读取 html
        alert(editor.txt.html());
        content = editor.txt.html();
        title = document.getElementsByName("title");
        title = title[0].value;
        $.ajax({
            type:"post",
            url:"/awardrecord/save",
            data:{content:content,title:title},
            async:true,
            success: function (result) {
                console.log("log 13.2 异步调用返回成功,result:"+result);
                if(result.msg=="success"){
                    parent.location.href='/awardrecord/list';
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

    editor.txt.html("<p>请输入内容</p>")
</script>
</body>
