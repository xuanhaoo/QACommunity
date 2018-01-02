<%--
  Created by IntelliJ IDEA.
  User: pjy
  Date: 18-1-2
  Time: 下午2:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="struts" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%
    Map frontUser = (Map) session.getAttribute("frontUser");

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="fly,layui,前端社区">
    <link rel="stylesheet" href="<%=basePath %>/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath %>static/css/global.css">
    <link rel="stylesheet" href="<%=basePath %>static/css/front_index.css">
</head>
<body style="margin-top: 65px;">

<s:include value="head.jsp"/>

<div class="fly-home fly-panel" style="background-image: url();">
    <img src="<%=basePath%><%=frontUser.get("photo")%>" alt=" <%=frontUser.get("name")%>">
    <i class="iconfont icon-renzheng" title="Fly社区认证"></i>
    <h1>
        <%=frontUser.get("name")%>
        <s:if test="%{#session.frontUser.sex == 0}"><i class="iconfont icon-nan"></i></s:if>
        <s:if test="%{#session.frontUser.sex == 1}"><i class="iconfont icon-nv"></i></s:if>
    </h1>


    <p class="fly-home-info">
        <i class="iconfont icon-shijian"></i><span><s:date format="yyyy-MM-dd" name="#session.frontUser.createDate" /> 加入该社区</span>
    </p>



</div>

<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md6 fly-home-jie">
            <div class="fly-panel">
                <h3 class="fly-panel-title"><%=frontUser.get("name")%> 最近的提问</h3>
                <ul class="jie-row">
                    <s:iterator value="list" id="question">
                        <li>
                            <a class="jie-title" href="../jie/detail.html" target="_blank"><s:property value="title"/></a>
                            <i><s:date name="createDate"/></i>
                        </li>
                    </s:iterator>
                </ul>
            </div>
        </div>

        <div class="layui-col-md6 fly-home-da">
            <div class="fly-panel">
                <h3 class="fly-panel-title"><%=frontUser.get("name")%> 最近的回答</h3>
                <ul class="home-jieda">
                    <s:iterator value="comment" id="com" status="st">
                        <li>
                            <p>
                                <span><s:date name="comment[#st.index][1]" /></span>
                                在<a href="" data-id="<s:property value="comment[#st.index][2]"/>" target="_blank"><s:property value="comment[#st.index][3]"/></a>中回答：
                            </p>
                            <div class="home-dacontent">
                                <s:property value="comment[#st.index][0]"/>
                            </div>
                        </li>
                    </s:iterator>

                </ul>
            </div>
        </div>
    </div>
</div>

<s:include value="footer.jsp"/>


</body>
</html>
