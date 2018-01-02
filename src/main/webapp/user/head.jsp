<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: pjy
  Date: 18-1-1
  Time: 下午1:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%
    Map frontUser = (Map) session.getAttribute("frontUser");

%>

<div class="fly-header layui-bg-cyan">
    <div class="layui-container">
        <a class="fly-logo" href="/">
            <img src="<%=basePath %>/static/images/logo.png" alt="layui">
        </a>
        <%--<ul class="layui-nav fly-nav layui-hide-xs">--%>
        <%--<li class="layui-nav-item layui-this">--%>
        <%--<a href="/"><i class="iconfont icon-shouye"></i>首页</a>--%>
        <%--</li>--%>
        <%--<li class="layui-nav-?page=1&orderType=1item">--%>
        <%--<a href="case/case.html"><i class="iconfont icon-wenda"></i>问题</a>--%>
        <%--</li>--%>
        <%--<li class="layui-nav-item">--%>
        <%--<a href="http://www.layui.com/" target="_blank"><i class="iconfont icon-iconmingxinganli"></i>话题</a>--%>
        <%--</li>--%>
        <%--</ul>--%>

        <ul class="layui-nav fly-nav-user">
            <!-- 登入的状态 -->
            <li class="layui-nav-item">
                <a class="fly-nav-avatar" href="javascript:;">
                    <cite class="layui-hide-xs"><%=frontUser.get("name")%></cite>
                    <img src="<%=basePath%>/<%=frontUser.get("photo")%>">
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="<%=basePath %>/frontUser/FrontUser_userSet.action"><i class="layui-icon">&#xe620;</i>基本设置</a></dd>
                    <dd><a href="<%=basePath %>/frontUser/FrontUser_userHome.action"><i class="layui-icon" style="margin-left: 2px; font-size: 22px;">&#xe68e;</i>我的主页</a></dd>
                    <hr style="margin: 5px 0;">
                    <dd id="logout"><a style="text-align: center;">退出</a></dd>
                </dl>
            </li>
        </ul>


    </div>
</div>

