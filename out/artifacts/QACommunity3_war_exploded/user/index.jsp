<%@ page import="com.qa.entity.QaFrontUser" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%--<%--%>
  <%--Map frontUser = (Map) session.getAttribute("frontUser");--%>
<%--%>--%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>用户中心</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="description" content="QA问答社区">
  <link rel="stylesheet" href="<%=basePath %>/static/plugins/layui/css/layui.css">
  <link rel="stylesheet" href="<%=basePath %>static/css/global.css">
  <link rel="stylesheet" href="<%=basePath %>static/css/front_index.css">
</head>
<body>

<s:include value="head.jsp"/>

<div class="layui-container fly-marginTop fly-user-main">
  <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
    <li class="layui-nav-item">
      <a href="<%=basePath %>/frontUser/FrontUser_userHome.action">
        <i class="layui-icon">&#xe609;</i>
        我的主页
      </a>
    </li>
    <li class="layui-nav-item layui-this">
      <a href="<%=basePath %>/frontUser/FrontUser_userIndex.action">
        <i class="layui-icon">&#xe612;</i>
        用户中心
      </a>
    </li>
    <li class="layui-nav-item">
      <a href="<%=basePath %>/frontUser/FrontUser_userSet.action">
        <i class="layui-icon">&#xe620;</i>
        基本设置
      </a>
    </li>
  </ul>

  <div class="site-tree-mobile layui-hide">
    <i class="layui-icon">&#xe602;</i>
  </div>
  <div class="site-mobile-shade"></div>

  <div class="site-tree-mobile layui-hide">
    <i class="layui-icon">&#xe602;</i>
  </div>
  <div class="site-mobile-shade"></div>


  <div class="fly-panel fly-panel-user" pad20>

    <div class="layui-tab layui-tab-brief" lay-filter="user">

      <ul class="layui-tab-title" id="LAY_mine">
        <li data-type="mine-jie" lay-id="index" class="layui-this">我发的帖（<span><s:property value="count"/></span>）</li>
      </ul>

      <div class="layui-tab-content" style="padding: 20px 0;">

        <div class="layui-tab-item layui-show">
          <ul class="mine-view jie-row">
            <s:iterator value="list" id="question">
              <li>
                <a class="jie-title" href="<%=basePath %>/front/frontIndex_getTheQuestion?quesId=<s:property value="qId"/>"><s:property value="title"/></a>
                <i><s:date name="createDate"/></i>
                <a class="mine-edit" href="<%=basePath %>/front/frontIndex_getTheQuestion?quesId=<s:property value="qId"/>">查看</a>
              </li>
            </s:iterator>

            <%--<li>--%>
              <%--<a class="ji../../res/mods/e-title" href="../jie/detail.html" target="_blank">基于 layui 的极简社区页面模版</a>--%>
              <%--<i>2017/3/14 上午8:30:00</i>--%>
              <%--<a class="mine-edit" href="/jie/edit/8116">编辑</a>--%>
              <%--<em>661阅/10答</em>--%>
            <%--</li>--%>

          </ul>
          <div id="LAY_page"></div>
        </div>

        <div class="layui-tab-item">
          <ul class="mine-view jie-row">
            <li>
              <a class="jie-title" href="../jie/detail.html" target="_blank">基于 layui 的极简社区页面模版</a>
              <i>收藏于23小时前</i>  </li>
          </ul>
          <div id="laypage"></div>
        </div>

      </div>
    </div>
  </div>
</div>

<s:include value="footer.jsp"/>


<script>
    layui.use(['element','laypage'], function() {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        laypage = layui.laypage;

        laypage.render({
            elem: 'laypage' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: 50 //数据总数，从服务端得到
        });

    });
</script>

</body>
</html>
