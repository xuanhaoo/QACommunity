<%--
  Created by IntelliJ IDEA.
  User: Mr.liang
  Date: 2017/12/29
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath %>/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath %>static/css/global.css">
    <style>
        html body {
            margin-top: 0px;
            background: #fff;
        }
        /*.twoComm-style {*/
            /*margin-top: 5px;*/
            /*margin-left: 10px;*/
            /*margin-right: 10px;*/
        /*}*/
        body .mytwolayer {
            border-radius:10px;
        }
        body .mytwolayer .layui-layer-title{border-radius:10px 10px 0 0;}
    </style>
</head>
<body>
<div class="twoComm-style">
    <div class="fly-panel detail-box">
        <ul class="jieda" id="jieda">
            <%--判断是否为空的--%>
            <s:if test="qaTwoComment.two_list.size() == 0">
                <p style="font-weight: bold;font-size: 18px;">:(  &nbsp;暂无评论~~！</p>
            </s:if>
            <s:else>
                <s:iterator value="qaTwoComment.two_list" var="cc">
                    <li>
                        <div class="detail-about detail-about-reply">
                            <a class="fly-avatar" href="">
                                <img src="<%=basePath %>/<s:property value="#cc.headPhoto"/>" alt=" ">
                            </a>
                            <div class="fly-detail-user">
                                <a href="" class="fly-link">
                                    <cite><s:property value="#cc.accountName"/></cite>
                                </a>
                            </div>
                            <div class="detail-hits">
                                <span><s:date name="#cc.createDate" format="yyyy/MM/dd HH:mm:ss" /></span>
                            </div>
                        </div>
                        <div class="detail-body jieda-body photos">
                            <p><s:property value="#cc.content"/></p>
                        </div>
                        <div class="jieda-reply">
                      <span class="jieda-zan" type="zan">
                        <i class="iconfont icon-zan"></i>
                        <em><s:property value="#cc.likes"/></em>
                      </span>
                        </div>
                    </li>
                </s:iterator>
            </s:else>

        </ul>
    </div>
</div>
</body>
</html>
