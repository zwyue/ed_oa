<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/12/1
  Time: 16:11
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
    <title>老年大学系统——角色修改</title>
    <link rel="stylesheet" href="../../../../static/plugins/layui-v2.4.3/layui/css/layui.css"/>
    <link rel="stylesheet" href="../../../../static/css/common_style.css" />
    <link rel="stylesheet" href="../../../../static/css/jsgl_jsbdqx.css">
    <link rel="stylesheet" href="../../../../static/css/jsgl_jsxg.css"/>
    <link rel="stylesheet" href="../../../../static/plugins/zTree/zTreeStyle.css" />
</head>
<body>
<div class="layui-layout layui-layout-admin z_height">
    <!--左侧和头部导航区域-->
    <div id="sjtj_left">
        <iframe  frameborder="0" src="/index/toLeftCommon" scrolling="yes" class="x-iframe"></iframe>
    </div>
    <!--左侧和头部导航区域end-->

    <!--右侧内容-->
    <div class="layui-body yhglContent">
			<span class="layui-breadcrumb yhgl_nav">
			  <a href="javascript:;"><cite>角色管理</cite></a><span lay-separator="">></span>
			  <a href="javascript:;">角色绑定权限</a>
			</span>

        <!--权限管理-->
        <div class="jsxgContent">
            <section class="jsxgCol">
                <span class="jsxg_bt fl">角色修改</span>
                <span class="fanHui">
					<a href="javascript:history.go(-1);">返回</a>
				</span>
            </section>

            <section class="jsxgTree">
                <div class="layui-form-item jsCheck" >
                    <div class="layui-inline">
                        <label class="layui-form-label">角色名称：</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="name" style="border-radius: 10px;border: 1px solid #bfbfbf;">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">角色描述：</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="idCard" style="border-radius: 10px;border: 1px solid #bfbfbf;">
                        </div>
                    </div>
                </div>
                <!--权限管理-->
                <div class="qxgl">
                    <div class="qxglBt">权限管理</div>
                    <div class="qxglTree">
                        <ul id="treeDemo" class="ztree"></ul>
                    </div>
                    <div class="right" style="display: none;">
                        <ul class="info">
                            </li>
                            <li>
                                <p>Mode:
                                    <br/>
                                    <label >
                                        <input type="radio" id="r1" class="radio first" name="r" value="checkbox" checked />
                                        Checkbox
                                    </label></li>
                        </ul>
                        </ul>
                    </div>
                </div>
                <!--权限管理 end-->
            </section>
        </div>
        <!--权限管理end-->
        <a href="javascript:;" class="qxxgBtn">修改</a>
    </div>

    <!--右侧内容 end-->
</div>
<script type="text/javascript" src="../../../../static/plugins/zTree/jquery-1.4.4.min.js" ></script>
<script type="text/javascript" src="../../../../static/plugins/zTree/jquery.ztree.core.js"></script>
<script type="text/javascript" src="../../../../static/plugins/zTree/jquery.ztree.excheck.js"></script>
<script type="text/javascript">
    var setting = {
        view: {
            addHoverDom: null, //设置鼠标移到节点上，在后面显示一个按钮，默认值为null,使用时需配合removeHoverDom一起使用
            removeHoverDom: null,
            selectedMulti: false //设置是否允许同时显示多个节点
        },
        check: {
            enable: true //设置zTree节点上是否显示单选框或复选框
            ,chkStyle: 'radio' //勾选框类型为radio 默认为checkbox
            ,radioType: "level" //设置radio的分组范围，level在每一级节点范围内当做一个分组.all表示在整棵树范围内当做一个分组。

        },
        data: {
            simpleData: {
                enable: true //使用简单数据模式
            }
        },
        edit: {
            enable: true // 设置zTree进入编辑状态
        }
    };
    var zNodes =[
        { id:1, pId:0, name:"用户管理", open:true},
        { id:11, pId:1, name:"学生管理"},
        { id:111, pId:11, name:"新增"},
        { id:112, pId:11, name:"修改"},
        { id:113, pId:11, name:"删除"},
        { id:12, pId:1, name:"老师管理"},
        { id:121, pId:12, name:"新增"},
        { id:122, pId:12, name:"修改"},
        { id:123, pId:12, name:"查看"},
        { id:124, pId:12, name:"一键离职"},
        { id:2, pId:0, name:"数据管理"},
        { id:21, pId:2, name:"pNode 21", open:true},
        { id:211, pId:21, name:"sNode 211"},
        { id:214, pId:21, name:"sNode 214"},
        { id:22, pId:2, name:"pNode 22"},
        { id:221, pId:22, name:"sNode 221"},
        { id:23, pId:2, name:"pNode 23"},
        { id:231, pId:23, name:"sNode 231"},
        { id:3, pId:0, name:"pNode 3", isParent:true}
    ];
    function setCheck() {
        setting.check.chkStyle = $("#r1").attr("checked")? "checkbox":"radio";
        setting.check.enable = (!$("#disablechk").attr("checked"));
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    }
    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);//初始化  $("#treeDemo")为zTree的DOM容器 ；setting为zTree 的配置数据；zNodes为zTree的节点数据
        setCheck();
        $("#r1").bind("change", setCheck);
        $("#r2").bind("change", setCheck);
        $("#disablechk").bind("change", setCheck);
    });

    var newCount = 1;
    function addHoverDom(treeId, treeNode) {
        var sObj = $("#" + treeNode.tId + "_span");
        if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
        var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
            + "' title='add node' onfocus='this.blur();'></span>";
        sObj.after(addStr);
        var btn = $("#addBtn_"+treeNode.tId);
        if (btn) btn.bind("click", function(){
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
            return false;
        });
    };
    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_"+treeNode.tId).unbind().remove();
    };
</script>

</body>
</html>
<%--<html>--%>
<%--<head>--%>
<%--<title>Title</title>--%>
<%--<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>--%>
<%--<script src="https://cdn.bootcss.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>--%>
<%--<script src="../../../js/term_manage.js"></script>--%>
<%--<link href="https://cdn.bootcss.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">--%>
<%--<style>--%>
<%--#role_form {--%>
<%--display: none;--%>
<%--position: absolute;--%>
<%--z-index: 101;--%>
<%--}--%>
<%--#allocate_power {--%>
<%--display: none;--%>
<%--position: absolute;--%>
<%--z-index: 101;--%>
<%--}--%>
<%--#term_form_update{--%>
<%--display: none;--%>
<%--position: absolute;--%>
<%--z-index: 101;--%>
<%--}--%>
<%--/* 半透明的遮罩层 */--%>
<%--#overlay {--%>
<%--background: #000;--%>
<%--filter: alpha(opacity=50); /* IE的透明度 */--%>
<%--opacity: 0.5;  /* 透明度 */--%>
<%--display: none;--%>
<%--position: absolute;--%>
<%--top: 0px;--%>
<%--left: 0px;--%>
<%--width: 100%;--%>
<%--height: 100%;--%>
<%--z-index: 100; /* 此处的图层要大于页面 */--%>
<%--display:none;--%>
<%--}--%>
<%--</style>--%>
<%--</head>--%>
<%--<body>--%>

<%--&lt;%&ndash;<a href="/user/download"></a>&ndash;%&gt;--%>
<%--<div class="container">--%>
<%--<div class="row">--%>
<%--<div class="col-md-12">--%>
<%--<h1>角色列表</h1>--%>
<%--</div>--%>
<%--</div>--%>

<%--<div class="row">--%>
<%--<div class="col-md-4 col-md-offset-8">--%>
<%--<a class="btn btn-primary" onclick="showForm('role_form',300,400)">新增</a>--%>
<%--<a class="btn btn-primary" onclick="deleteResource()">批量删除</a>--%>
<%--</div>--%>
<%--</div>--%>

<%--<div class="row">--%>
<%--<div class="col-md-12">--%>
<%--<table class="table table-hover table-striped">--%>
<%--<tr>--%>
<%--<th>选择</th>--%>
<%--<th>id</th>--%>
<%--<th>角色名</th>--%>
<%--<th>状态</th>--%>
<%--<th>描述</th>--%>
<%--<th>创建时间</th>--%>
<%--<th>操作</th>--%>
<%--</tr>--%>
<%--<c:forEach items="${list}" var="list">--%>
<%--<tr id="${list.id}">--%>
<%--<td><input type="checkbox" value="${list.id}" name="idList"></td>--%>
<%--<td>${list.id}</td>--%>
<%--<td>${list.rolename}</td>--%>
<%--<td>${list.statusTxt}</td>--%>
<%--<td>${list.description}</td>--%>
<%--<td>${list.crttime}</td>--%>
<%--<td>--%>
<%--<a type="button" onclick="editTerm('term_form_update',300,400,'${list.rolename}','${list.description}','${list.status}','${list.id}')" class="btn btn-info btn-sm">--%>
<%--<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>--%>
<%--编辑</a>--%>
<%--<a type="button" onclick="deleteMethod(${list.id})" class="btn btn-danger btn-sm">--%>
<%--<span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>--%>
<%--删除</a>--%>
<%--<a type="button" onclick="showForm('allocate_power',300,400)" class="btn btn-danger btn-sm">--%>
<%--<span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>--%>
<%--分配权限</a>--%>
<%--</td>--%>
<%--</tr>--%>

<%--</c:forEach>--%>
<%--</table>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div id="overlay"></div>--%>
<%--<div id="role_form">--%>

<%--<form action="/role/createNewRole" method="post">--%>
<%--&lt;%&ndash;<div class="title">&ndash;%&gt;--%>
<%--&lt;%&ndash;<h2>用户登录</h2><a onclick="layer.style.display=none"></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--<p><label>角色名: </label><input type="input" name="rolename" /></p>--%>
<%--<p><label>描述: </label><input type="input" name="description" /></p>--%>
<%--<input type="submit" value=" 提 交 " />--%>
<%--</form>--%>
<%--<button onclick="closeForm('role_form')">关闭</button>--%>

<%--</div>--%>

<%--<div id="term_form_update">--%>

<%--<form action="/term/updateTerm" method="post">--%>
<%--&lt;%&ndash;<div class="title">&ndash;%&gt;--%>
<%--&lt;%&ndash;<h2>用户登录</h2><a onclick="layer.style.display=none"></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--<p><label>角色名: </label><input type="input" name="term" /></p>--%>
<%--<p><label>描述: </label><input type="input" name="starttime" /></p>--%>
<%--<p><label>id: </label><input type="input" name="id" /></p>--%>
<%--<input type="submit" value=" 提 交 " />--%>
<%--</form>--%>
<%--<button onclick="closeForm('term_form_update')">关闭</button>--%>

<%--</div>--%>

<%--<div id="allocate_power">--%>

<%--<form action="/power/allocatePower" method="post">--%>
<%--&lt;%&ndash;<div class="title">&ndash;%&gt;--%>
<%--&lt;%&ndash;<h2>用户登录</h2><a onclick="layer.style.display=none"></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--<p><label>角色id: </label><input type="input" name="roleId" /></p>--%>
<%--<p><label>权限id: </label><input type="input" name="powerId" /></p>--%>
<%--<input type="submit" value=" 提 交 " />--%>
<%--</form>--%>
<%--<button onclick="closeForm('allocate_power')">关闭</button>--%>

<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
