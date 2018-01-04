<%--
  Created by IntelliJ IDEA.
  User: gmf
  Date: 2017/12/22
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>


</head>
<style>
    .BackInfo{
        margin-left: 100px;
        margin-top: 60px;
    }
    .label{
        float: left;
        display: block;
        padding: 9px 15px;
        width: 80px;
        font-weight: 400;
        text-align: right;
    }
    .input-inline{
        float: left;
        width: 190px;
        margin-right: 10px;
    }
    .input-text{
        height: 38px;
        line-height: 38px;
        line-height: 36px\9;
        border: 1px solid #e6e6e6;
        background-color: #fff;
        border-radius: 2px;
    }
    .form-info{
        margin-bottom: 20px;
        clear: both;
        float:left;
    }
    .XGXX{
        display: inline-block;
        height: 38px;
        line-height: 38px;
        padding: 0 18px;
        background-color: #009688;
        color: #fff;
        white-space: nowrap;
        text-align: center;
        border: none;
        border-radius: 2px;
        cursor: pointer;
        opacity: .9;
        filter: alpha(opacity=90);
    }
    .form-info2{
        margin-bottom: 20px;
        clear: both;
        float:left;
        margin-left: 12px;
    }
    a{
        text-decoration: none;
        color: inherit;
    }
    .PasswordUpdate{
        width:400px;
        height:300px;
        background-color: white;
        position: absolute;
        margin-left:200px;
        margin-top: -680px;
        border-width: 3px;
        border-color: #ccc;
        border-style: solid;
        z-index: 1;

    }
</style>

<body>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="<%=basePath %>/static/plugins/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<div style="z-index:-1;">
<s:form id="updateBackInfo" action="BackInfo_updateInfo" method="list">
<div class="BackInfo" style="width: 700px; height:700px; ">
    <div class="form-info2">
            <label class="label">头像：</label>
            <div style="width:100px;height: 100px;">
            <img style="width:100px;height:100px;margin-left: 100px; margin-top: -40px;" src="<%=basePath%>${list[0].photo}">
            </div>
    </div>
    <div class="form-info">

        <label class="label">账号:</label>
        <div class="input-inline">
            <input name="account" type="text" placeholder="请输入内容" class="input-text"  readonly="readonly" value="${list[0].account}">
            <input name="photo" type="text" placeholder="请输入内容" class="input-text"  readonly="readonly" style="display: none" value="${list[0].photo}">
        </div>
        <label class="label">名字:</label>
        <div class="input-inline">
            <input name="name" type="text" placeholder="请输入内容" class="input-text"  value="${list[0].name}">
        </div>
    </div>
    <div class="form-info">
        <label class="label">邮箱:</label>
        <div class="input-inline">
            <input name="email" type="text" placeholder="请输入内容" class="input-text"  value="${list[0].email}">
        </div>
        <label class="label">角色:</label>
        <div class="input-inline">
            <s:if test="list[0].status==1">
                <input name="type" type="text" placeholder="请输入内容" class="input-text" disabled="" value="超级管理员">
            </s:if>
            <s:elseif test="list[0].status==2">
                <input name="type" type="text" placeholder="请输入内容" class="input-text" disabled value="普通会员">
            </s:elseif>

        </div>

    </div>

    <div class="form-info" >
        <label class="label">性别</label>
        <div class="input-inline">
            <script>
                sex= ${list[0].sex};
                $(":radio[name='sex'][value='" + sex + "']").prop("checked", "checked")
            </script>
            <label class="label"><input name="sex" id="f" type="radio" value="0" checked="checked">男 </label>
            <label class="label"><input name="sex" id="m" type="radio" value="1" />女 </label>
        </div>
    </div>

    <div style="float:left;margin-top:80px;clear: both;margin-left: 60px;">

        <div class="XGXX"> <a  href="javascript:document.getElementById('updateBackInfo').submit()" onClick="return confirm('确定修改?')">修改信息</a></div>
        <div class="XGXX" style="margin-left: 200px;" onclick="updatepassword()"> 修改密码</div>
        <script type="text/javascript">
            function  updatepassword(){

                document.getElementById('PasswordUpdate').style.display="block";
            }
            function updatepassword1() {
                document.getElementById('PasswordUpdate').style.display="none";

            }

        </script>
    </div>




</s:form>
    <div id="PasswordUpdate" style="display: none">
    <div class="PasswordUpdate" >
        <s:form action="BackInfo_updatePassword" id="updatePassword"  method="list"  style="margin-top:70px;">
            <input name="account" type="text" placeholder="请输入内容" class="input-text"  style="display: none;" value="${list[0].account}">
            <div style="float:left">
            <label class="label">原密码:</label>
            <div class="input-inline">
                <input name="pastpassword" type="password" placeholder="请输入内容" class="input-text"  value="${list[0].password}">
            </div>
            </div>
            <div style="float:left;margin-top:30px;">
            <label class="label">新密码:</label>
            <div class="input-inline">
                <input name="password" type="password" placeholder="请输入内容" class="input-text"  value="">
            </div>
            </div>
            <div style="float:left;margin-left: 100px;margin-top: 30px;">
            <div class="XGXX"> <a  href="javascript:document.getElementById('updatePassword').submit()" onClick="return confirm('确定修改?')" >提交</a></div>
            <div class="XGXX" style="margin-left: 30px;" onclick="updatepassword1()"> 取消</div>
        </s:form>
    </div>


</div>


</body>
</html>
