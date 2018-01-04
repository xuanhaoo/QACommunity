<%@ page import="com.qa.entity.QaFrontUser" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: pjy
  Date: 17-12-26
  Time: 下午1:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<link type="text/css" href="<%=basePath %>/static/plugins/layui/css/layui.css" rel="stylesheet" />
<head>

</head>

<body>
<style type="text/css">
    .layui-input-block {
        margin-left: 90px;
    }

    .layui-form-label {
        padding: 8px 0;
        text-align: center;
    }
    .admin-main {margin: 15px;}
</style>

<div class="admin-main">


    <form class="layui-form">

        <s:hidden name="user.id" value="%{user.id}"/>

        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <s:textfield name="user.name" cssClass="layui-input"  lay-verify="required" placeholder="请输入姓名"  value="%{user.name}"/>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="user.sex" value="0" title="男" <s:if test="%{user.sex == 0}">checked</s:if> >
                <input type="radio" name="user.sex" value="1" title="女" <s:if test="%{user.sex == 1}">checked</s:if> >
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-block">
                <s:textfield name="user.phone" cssClass="layui-input" lay-verify="phone" placeholder="请输入电话"  value="%{user.phone}"/>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <s:textfield name="user.email" cssClass="layui-input"  lay-verify="email" placeholder="请输入邮箱"  value="%{user.email}"/>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="editCom">保存</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>

    </form>
</div>
</body>
</html>

<script src="<%=basePath %>/static/plugins/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/plugins/layui/layui.all.js"></script>
<script>

    layui.use(['form','layer','jquery'], function() {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.jquery;

        //监听提交
        form.on('submit(editCom)', function (data) {
            console.log(data.field);

            layer.confirm('确认提交？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                layer.msg('已提交！', {icon: 1});
                $.ajax({
                    url: "<%=path%>/admin/qaCommunity_updateComUser.action",
                    type: "POST",
                    data: data.field,
                    beforeSend: function () {
                        //
                    },
                    success: function (data2) {
                        if (data2.status) {
                            layer.msg("更新成功", {time: 1000, icon: 1}, function () {
                                var index = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(index);
                            });
                        } else {
                            layer.msg("更新失败", {time: 1000, icon: 2});
                        }
                    },
                    error: function () {
                        layer.msg('请求服务器超时', {time: 1000, icon: 2});
                    }
                });
                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            }, function () {

            });

            return false;

        });
    });

</script>

