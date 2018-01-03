<%@ page import="com.qa.entity.QaFrontUser" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta charset="utf-8">
    <title>登入</title>
    <meta name="description" content="QA问答社区">
    <link rel="stylesheet" href="<%=basePath %>/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath %>static/css/global.css">
</head>
<body>

<div class="fly-header layui-bg-cyan">
  <div class="layui-container">
    <a class="fly-logo" href="/">
      <img src="<%=basePath %>/static/images/logo.png" alt="layui">
    </a>
    <ul class="layui-nav fly-nav layui-hide-xs">
      <li class="layui-nav-item layui-this">
        <a href="/"><i class="iconfont icon-shouye"></i>首页</a>
      </li>
      <li class="layui-nav-item">
        <a href="case/case.html"><i class="iconfont icon-wenda"></i>问题</a>
      </li>
      <li class="layui-nav-item">
        <a href="http://www.layui.com/" target="_blank"><i class="iconfont icon-iconmingxinganli"></i>话题</a>
      </li>
    </ul>

    <ul class="layui-nav fly-nav-user">

      <% if(frontUser != null){ %>
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
      <% }else {%>
      <!-- 未登入的状态 -->
      <li class="layui-nav-item">
        <a class="iconfont icon-touxiang layui-hide-xs" href="user/login.html"></a>
      </li>
      <li class="layui-nav-item">
        <a href="<%=path%>/frontUser/FrontUser_UserLogin.action" class="layui-btn layui-btn-sm login-btn" style="background: #5dade2; color:#fff;">登录</a>
      </li>
      <li class="layui-nav-item">
        <a href="<%=path%>/frontUser/FrontUser_registerUser.action" class="layui-btn  layui-btn-sm regist-btn" style="margin-left: 9px;background: #1abc9c;color:#fff;">注册</a>
      </li>
      <li class="layui-nav-item layui-hide-xs">
        <a href="/app/qq/" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" title="QQ登入" class="iconfont icon-qq"></a>
      </li>
      <li class="layui-nav-item layui-hide-xs">
        <a href="/app/weibo/" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" title="微博登入" class="iconfont icon-weibo"></a>
      </li>
      <% }%>
    </ul>
  </div>
</div>


<% if(frontUser == null){ %>
<div class="layui-container fly-marginTop">

  <div class="fly-panel fly-panel-user" pad20>

    <div class="layui-tab layui-tab-brief" lay-filter="user">

      <ul class="layui-tab-title">
        <li class="layui-this">登入</li>
        <li><a href="<%=path%>/frontUser/FrontUser_registerUser.action">注册</a></li>
      </ul>

      <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">

        <div class="layui-tab-item layui-show">

          <div class="layui-form layui-form-pane">

            <form method="post">

              <div class="layui-form-item">
                <label for="account" class="layui-form-label">账户</label>
                <div class="layui-input-inline">
                  <input type="text" id="account" name="account" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>

              <div class="layui-form-item">
                <label for="password" class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="password" name="password" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>


              <div class="layui-form-item">
                <button class="layui-btn" lay-filter="login" lay-submit>立即登录</button>
                <span style="padding-left:20px;">
                  <a href="forget.html">忘记密码？</a>
                </span>
              </div>

            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<%}else{%>
<h1><a href="<%=path%>/front/frontIndex_getQuestionIndex.action?page=1&orderType=1">你已登录...点击返回首页</a></h1>
<%}%>

<div class="fly-footer">
  <p><a href="http://fly.layui.com/" target="_blank">QA问答社区</a> 2017 &copy; <a href="http://www.layui.com/" target="_blank">CUIT 出品</a></p>

</div>

<script src="<%=basePath %>/static/plugins/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/plugins/layui/layui.js"></script>
<script>

    layui.use(['form','layer','jquery'], function() {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.jquery;


        // 表单验证
        form.verify({
            // 用户名验证
            username: function (value, item) { //value：表单的值、item：表单的DOM对象
                if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
                    return '用户名不能有特殊字符';
                }
                if (/(^\_)|(\__)|(\_+$)/.test(value)) {
                    return '用户名首尾不能出现下划线\'_\'';
                }
                if (/^\d+front_index\d+\d$/.test(value)) {
                    return '用户名不能全为数字';
                }
                if(!/^[\S]{4,10}$/.test(value)){
                    return '用户名为4到10位';
                }

            }

            , pass: [
                /^[\S]{6,12}$/
                , '密码必须6到12位，且不能出现空格'
            ]

        });

        // 提交表单
        form.on('submit(login)', function (data) {

            layer.confirm('确认登录？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.ajax({
                    url: "<%=path%>/frontUser/FrontUser_checkLogin.action",
                    type: "POST",
                    data: data.field,
                    beforeSend: function () {
                        //
                    },
                    success: function (data2) {
                        if (data2 === "1") {
                            layer.msg("登录成功!", {time: 1000, icon: 1}, function () {location.replace("<%=basePath %>/frontUser/FrontUser_userIndex.action");});
                        } else {
                            layer.msg("登录失败,请检查账户名或密码是否正确!", {time: 1000, icon: 2});
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



    });

</script>

</body>
</html>