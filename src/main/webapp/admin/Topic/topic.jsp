<%--
  Created by IntelliJ IDEA.
  User: gmf
  Date: 2017/12/28
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<link type="text/css" href="<%=basePath %>/static/plugins/layui/css/layui.css" rel="stylesheet" />
<head>
    <title>Title</title>
</head>
<style>
    .TopicUpdate{
        display: block;
        width: 400px;
        height: 300px;
        background-color: white;
        position: absolute;
        margin-left: 200px;
        margin-top: -150px;
        border-width: 3px;
        border-color: #ccc;
        border-style: solid;
        z-index: 1;
    }
</style>
<body>

<button class="layui-btn" onclick="AddTopic()">
    <i class="layui-icon" >&#xe608;</i> 添加
</button>
<script type="text/javascript">
    function  AddTopic(){


        document.getElementById('TopicAdd').style.display="block";


    }
    function AddTopic1() {
        document.getElementById('TopicAdd').style.display="none";

    }

</script>
<div>
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="200">
                <col width="300">
                <col width="300">
                <col >
            </colgroup>
            <thead>

            <tr>
                <th>ID</th>
                <th>名字</th>
                <th>备注</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>

            </thead>
            <tbody>

<s:iterator value="list" status="st" var="b">

            <tr>
                <td><s:property value="toId"/></td>
                <td><s:property value="topicName"/></td>
                <td><s:property value="remarks"/></td>
                <td><s:property value="createDate"/></td>
                <td><a href="<%=basePath %>/admin/qaBackTopic_DeleteTopic.action?id=${b.toId}"class="layui-btn layui-btn-normal" onClick="return confirm('删除后将无法恢复,确定要删除?')">删除</a></td>
               <th> <button class="layui-btn layui-btn-normal" onclick="updateTopic(${b.toId})">修改</button><th>

                <script type="text/javascript">
                    function  updateTopic(i){


                        document.getElementById('TopicUpdate').style.display="block";
                        document.getElementById("toId11").value=i;

                    }
                    function updateTopic1() {
                        document.getElementById('TopicUpdate').style.display="none";

                    }
                    function check1(){
                            var name = document.getElementById("topicName").value;

                           if(name ==  null || name == ''){
                                     alert("名字不能为空");
                                     return false;
                                }

                            return true;
                         }
                    function check(){

                        var name1 = document.getElementById("topicNameAdd").value;

                        if(name1 ==  null || name1 == ''){
                            alert("名字不能为空");
                            return false;
                        }

                        return true;
                    }

                </script>

            </tr>



</s:iterator>
            </tbody>
        </table>
    <div id="TopicUpdate" class="TopicUpdate" style="display: none;margin-top: -400px;margin-left: 540px;">
        <s:form class="layui-form" action="qaBackTopic_UpdateTopic" style="margin-left: -47px; margin-top: 40px;" onsubmit="return check1()">
            <div class="layui-form-item">
                <label class="layui-form-label">名字</label>
                <div class="layui-input-block">
                    <input type="text" name="topicName" id="topicName" placeholder="请输入名字"  class="layui-input"  value="">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-block">
                    <textarea name="remarks" placeholder="请输入内容" id="remarks" class="layui-textarea"  value=""></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 160px;margin-top: 40px;">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    <a onclick="updateTopic1()" class="layui-btn" >取消</a>
                </div>

            </div>

            <input type="text" name="toId"  class="layui-input" id="toId11" style="display: none"  >
        </s:form>

    </div>

    <div id="TopicAdd" class="TopicUpdate" style="display: none;margin-top: -400px;margin-left: 540px; ">
        <s:form class="layui-form" action="qaBackTopic_AddTopic" style="margin-left: -47px; margin-top: 40px;" onsubmit="return check()">
            <div class="layui-form-item">
                <label class="layui-form-label">名字</label>
                <div class="layui-input-block">
                    <input type="text" name="topicName" id="topicNameAdd" placeholder="请输入名字"  class="layui-input"  value="">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-block">
                    <textarea name="remarks" placeholder="请输入内容" class="layui-textarea"  value=""></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 160px;margin-top: 40px;">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    <a onclick="AddTopic1()" class="layui-btn" >取消</a>
                </div>

            </div>

        </s:form>

    </div>
</div>



</body>
</html>
