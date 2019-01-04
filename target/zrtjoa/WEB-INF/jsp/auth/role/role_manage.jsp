<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    pageContext.setAttribute("path",request.getContextPath());
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>老年大学系统——用户管理</title>
    <link rel="stylesheet" href="/static/plugins/layui-v2.4.3/layui/css/layui.css"/>
    <link rel="stylesheet" href="/static/css/common_style.css" />
    <link rel="stylesheet" href="/static/css/jsgl_jsbdqx.css">

</head>
<body>
<div class="layui-layout layui-layout-admin z_height">
    <!--左侧和头部导航区域-->
    <%--<div id="sjtj_left">--%>
        <%--<iframe  frameborder="0" src="/index/toLeftCommon" scrolling="yes" class="x-iframe"></iframe>--%>
    <%--</div>--%>
    <!--左侧和头部导航区域end-->

    <div id="bgDiv"></div>
    <!--添加角色弹窗-->
    <!--<div id="jsFgDiv" style="display: none;">
        <input type="hidden" id="hidId"/>
        <section>
            <label>序  &nbsp; &nbsp;&nbsp;&nbsp; 号:</label><input type="text" id="num"/>
        </section>
        <br/>
        <section>
            <label>角色管理:</label><input type="text" id="role"/>
        </section>
        <br/>
        <section>
            <label>状态管理:</label><input type="text" id="state"/>
        </section>
        <br/>
        <button  class="layui-btn" id="btnSave">
                  保存
          </button>
          <button  class="layui-btn" id="close" style="margin-left: 30px;">
                  取消
          </button>
    </div>-->
    <!--添加角色弹窗 end-->

    <!--查看表格弹窗-->
    <!--<div id="jsFgDivLook" style="display: none;">
        <input type="hidden" id="hidId1"/>
        <section>
            <label>序  &nbsp; &nbsp;&nbsp;&nbsp; 号:</label><input type="text" id="num1" disabled="disabled"/>
        </section>
        <br/>
        <section>
            <label>角色管理:</label><input type="text" id="role1" disabled="disabled"/>
        </section>
        <br/>
        <section>
            <label>状态管理:</label><input type="text" id="state1" disabled="disabled"/>
        </section>
        <br/>
          <button  class="layui-btn" id="close1">
                  退出
          </button>
    </div>-->
    <!--查看表格弹窗 end-->

    <!--用户管理内容-->
    <div class="layui-body yhglContent">
		<span class="layui-breadcrumb yhgl_nav">
		  <a href="javascript:;"><cite>角色管理</cite></a><span lay-separator=""></span>
		  <a href="javascript:;">角色绑定权限</a>
		</span>

        <!--表格-->
        <div class="jsBiaoGe">
            <section >
                <span class="jslb_bt fl">角色列表</span>
                <a href="javascript:;" class="tjjs fr" id="tjjs" >
                    <i class="layui-icon layui-icon-add-1"></i>添加角色
                </a>
            </section>
            <!---数据表格-->
            <table class="layui-table" lay-even="" lay-skin="nob">
                <thead>
                <tr style="background: #e2e2e2;color: #000000;">
                    <th>选择</th>
                    <th>序号</th>
                    <th>角色管理</th>
                    <th>启用状态</th>
                    <th>描述</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="jsTableList">
                <c:forEach items="${list}" var="list">
                    <tr id="${list.id}">
                        <td><input type="checkbox" value="${list.id}" name="idList"></td>
                        <td>${list.id}</td>
                        <td>${list.rolename}</td>
                        <td>${list.statusTxt}</td>
                        <td>${list.description}</td>
                        <td>${list.crttime}</td>
                        <td>
                            <a href="JavaScript:;" class="bg bgActive del">删除</a>
                            <a href="JavaScript:;" class="bg change">修改</a>
                            <a href="JavaScript:;" class="bg look">查看</a>
                        </td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>

            <p class="showPage">每页显示
                <select>
                    <option value ="volvo">8</option>
                    <option value="opel">10</option>
                    <option value="audi">12</option>
                </select>
                列</p>
            <!--数据表格 end-->

            <!--分页-->
            <div class="page">
                <p>共50页</p>
                <div id="demo5"></div>
            </div>
            <!--分页 end-->
        </div>
        <!--表格end-->

    </div>
    <!--用户管理内容 end-->
</div>

<script src="/static/plugins/jQuery/jquery-3.3.1.js"></script>
<script src="/static/plugins/layui-v2.4.3/layui/layui.js"></script>
<script src="/static/js/jsgl_jsbdqx.js"></script>
</body>
</html>