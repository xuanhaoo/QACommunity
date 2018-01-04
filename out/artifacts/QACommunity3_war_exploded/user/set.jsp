<%--
  Created by IntelliJ IDEA.
  User: pjy
  Date: 18-1-1
  Time: 上午12:27
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
    <title>基本设置</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="QA问答社区">
    <link rel="stylesheet" href="<%=basePath %>/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath %>static/css/global.css">
    <link rel="stylesheet" href="<%=basePath %>static/css/front_index.css">
</head>
<html>
<body>

<s:include value="head.jsp"/>

<div class="layui-container fly-marginTop fly-user-main">
    <ul class="layui-nav layui-nav-tree layui-inline" >
        <li class="layui-nav-item">
            <a href="home.html">
                <i class="layui-icon">&#xe609;</i>
                我的主页
            </a>
        </li>
        <li class="layui-nav-item">
            <a href="<%=basePath %>/frontUser/FrontUser_userIndex.action">
                <i class="layui-icon">&#xe612;</i>
                用户中心
            </a>
        </li>
        <li class="layui-nav-item layui-this">
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
        <div class="layui-tab layui-tab-brief" >
            <ul class="layui-tab-title" id="LAY_mine">
                <li class="layui-this" lay-id="info">我的资料(在下次登录后生效)</li>
                <li lay-id="avatar">头像</li>
                <li lay-id="pass">密码</li>
            </ul>
            <div class="layui-tab-content" style="padding: 20px 0;">
                <div class="layui-form layui-form-pane layui-tab-item layui-show">
                    <form class="layui-from">
                        <div class="layui-form-item">
                            <label for="email" class="layui-form-label">邮箱</label>
                            <div class="layui-input-inline">
                                <input type="text" id="email" name="email" required lay-verify="email" autocomplete="off" value="<%=frontUser.get("email")%>" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label for="phone" class="layui-form-label">电话</label>
                            <div class="layui-input-inline">
                                <input type="text" id="phone" name="phone" required lay-verify="phone" autocomplete="off" value="<%=frontUser.get("phone")%>" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label for="L_username" class="layui-form-label">昵称</label>
                            <div class="layui-input-inline">
                                <input type="text" id="L_username" name="name" required lay-verify="required" autocomplete="off" value="<%=frontUser.get("name")%>" class="layui-input">
                            </div>
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input type="radio" name="sex" value="0" title="男" <s:if test="%{#session.frontUser.sex == 0}">checked</s:if> >
                                    <input type="radio" name="sex" value="1" title="女" <s:if test="%{#session.frontUser.sex == 1}">checked</s:if> >
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <button class="layui-btn" key="set-mine" lay-filter="baseChange" lay-submit>确认修改</button>
                        </div>
                </div>

                    <div class="layui-form layui-form-pane layui-tab-item">
                        <div class="layui-form-item">
                            <div class="avatar-add">
                                <p>建议尺寸168*168，支持jpg、png、gif，最大不能超过50KB</p>
                                <button type="button" id="upload" class="layui-btn upload-img">
                                    <i class="layui-icon">&#xe67c;</i>上传头像
                                </button>
                                <img src="<%=basePath%><%=frontUser.get("photo")%>">
                                <span class="loading"></span>
                            </div>
                        </div>
                    </div>

                <div class="layui-form layui-form-pane layui-tab-item">
                    <form class="layui-from" >
                        <div class="layui-form-item">
                            <label for="nowpass" class="layui-form-label">当前密码</label>
                            <div class="layui-input-inline">
                                <input type="password" id="nowpass" name="nowpass" required lay-verify="required|nowpass" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label for="pass" class="layui-form-label">新密码</label>
                            <div class="layui-input-inline">
                                <input type="password" id="pass" name="pass" required lay-verify="pass" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">6到12个字符</div>
                        </div>
                        <div class="layui-form-item">
                            <label for="repass" class="layui-form-label">确认密码</label>
                            <div class="layui-input-inline">
                                <input type="password" id="repass" name="repass" required lay-verify="repass" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn" key="set-mine" lay-filter="passChange" lay-submit>确认修改</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>file
</div>

<s:include value="footer.jsp"/>

<script>
    layui.use(['element','laypage','form','upload'], function() {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        laypage = layui.laypage;
        form = layui.form;
        upload = layui.upload;

        laypage.render({
            elem: 'laypage' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: 50 //数据总数，从服务端得到
        });

        // 表单验证
        form.verify({

            nowpass:function (value) {
                var flag = true;
                // 必须使用方法,否则执行顺序为先判断flag,后执行ajax,即flag始终为false
                function checkP(){
                    $.ajax({
                        url: "<%=path%>/frontUser/FrontUser_checkPass.action",
                        type: "POST",
                        async:false,
                        data: {"password":value},
                        success: function (data2) {
                            if(data2 == "1"){
                                flag = false;
                            }
                        }
                    });
                }

                checkP();
                if(flag){
                    return "原始密码错误!";
                }
            }

            // 确认密码验证
            ,repass: function (value, item) {
                var pass = $("#pass").val();
                if (pass !== value) {
                    return "密码不一致!";
                }
            }

            ,pass: [
                /^[\S]{6,12}$/
                , '密码必须6到12位，且不能出现空格'
            ]

        });

        // 修改基本信息
        form.on('submit(baseChange)',function (data) {
            layer.confirm('确认修改？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.ajax({
                    url: "<%=path%>/frontUser/FrontUser_userUpdate.action",
                    type: "POST",
                    data: data.field,
                    beforeSend: function () {
                        //
                    },
                    success: function (data2) {
                        if (data2 == "1") {
                            layer.msg("修改成功!", {time: 1000, icon: 1}, function () {location.reload();});
                        } else {
                            layer.msg("修改失败!", {time: 1000, icon: 2});
                        }
                    },
                    error: function () {
                        layer.msg('请求服务器超时', {time: 1000, icon: 2},function () {location.reload();});
                    }
                });
                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            }, function () {

            });

            return false;
        });


        // 修改密码
        form.on('submit(passChange)',function (data) {
            var pass = $("#pass").val();
            layer.confirm('确认修改？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.ajax({
                    url: "<%=path%>/frontUser/FrontUser_userPass.action",
                    type: "POST",
                    data: {"password":pass},
                    beforeSend: function () {
                        //
                    },
                    success: function (data2) {
                        if (data2 == "1") {
                            layer.msg("修改成功!", {time: 1000, icon: 1}, function () {location.reload()});
                        } else {
                            layer.msg("修改失败!", {time: 1000, icon: 2});
                        }
                    },
                    error: function () {
                        layer.msg('请求服务器超时', {time: 1000, icon: 2},function () {location.reload();});
                    }
                });
                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            }, function () {

            });

            return false;
        });


        // 修改头像
        var uploadInst = upload.render({
            elem: '#upload' //绑定元素
            ,url: '<%=path%>/frontUser/FrontUser_uploadPhoto.action' //上传接口
            ,accept:"images"
            ,exts:'jpg|png|gif'
            ,size:51200
            ,drag:true
            ,done: function(res){
                if(res == "1"){
                    layer.msg("上传成功!", {time: 1000, icon: 1});
                }else{
                    layer.msg("上传失败!", {time: 1000, icon: 2});
                }
            }
            ,error: function(){
                layer.msg("请求异常,请联系管理员!", {time: 1000, icon: 2});
            }
        });

    });
</script>

</body>
</html>