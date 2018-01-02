
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%
  String frontUser = (String) session.getAttribute("frontUser");
%>

<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta charset="utf-8">
  <title>注册</title>
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
        <a href="<%=path%>"><i class="iconfont icon-shouye"></i>首页</a>
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
          <cite class="layui-hide-xs">贤心</cite>
          <i class="iconfont icon-renzheng layui-hide-xs" title="认证信息：layui 作者"></i>
          <i class="layui-badge fly-badge-vip layui-hide-xs">VIP3</i>
          <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg">
        </a>
        <dl class="layui-nav-child">
          <dd><a href="user/set.html"><i class="layui-icon">&#xe620;</i>基本设置</a></dd>
          <dd><a href="user/message.html"><i class="iconfont icon-tongzhi" style="top: 4px;"></i>我的消息</a></dd>
          <dd><a href="user/home.html"><i class="layui-icon" style="margin-left: 2px; font-size: 22px;">&#xe68e;</i>我的主页</a></dd>
          <hr style="margin: 5px 0;">
          <dd><a href="/user/logout/" style="text-align: center;">退出</a></dd>
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

<div class="layui-container fly-marginTop">

  <div class="fly-panel fly-panel-user" >

    <div class="layui-tab layui-tab-brief" lay-filter="user">

      <ul class="layui-tab-title">
        <li><a href="<%=path%>/frontUser/FrontUser_UserLogin.action">登入</a></li>
        <li class="layui-this">注册</li>
      </ul>

      <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">

        <div class="layui-tab-item layui-show">

          <div class="layui-form layui-form-pane">

            <form class="layui-form">

              <div class="layui-form-item">
                <label for="account" class="layui-form-label">账户</label>
                <div class="layui-input-inline">
                    <s:textfield id="account" name="user.account" cssClass="layui-input"  lay-verify="username"  autocomplete="off"/>
                  <%--<input type="text" id="account" name="account" required lay-verify="username|checkuser" autocomplete="off" class="layui-input">--%>
                </div>
                  <div class="layui-form-mid layui-word-aux">将会成为您唯一的登入名</div>
              </div>

              <div class="layui-form-item">
                <label for="email" class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                  <s:textfield id="email" name="user.email" cssClass="layui-input"  lay-verify="email"  autocomplete="off"/>
                  <%--<input type="text" id="email" name="email" required lay-verify="email" autocomplete="off" class="layui-input">--%>
                </div>
                <div class="layui-form-mid layui-word-aux">可以利用邮箱找回密码</div>
              </div>

              <div class="layui-form-item">
                <label for="username" class="layui-form-label">昵称</label>
                <div class="layui-input-inline">
                  <s:textfield id="username" name="user.name" cssClass="layui-input"  lay-verify="required"  autocomplete="off"/>
                  <%--<input type="text" id="username" name="username" required lay-verify="required" autocomplete="off" class="layui-input">--%>
                </div>
              </div>

              <div class="layui-form-item">
                <label for="pass" class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                  <s:password id="pass" name="user.password" cssClass="layui-input"  lay-verify="pass"  autocomplete="off"/>
                  <%--<input type="password" id="pass" name="pass" required lay-verify="pass" autocomplete="off" class="layui-input">--%>
                </div>
                <div class="layui-form-mid layui-word-aux">6到16个字符</div>
              </div>

              <div class="layui-form-item">
                <label for="repass" class="layui-form-label">确认密码</label>
                <div class="layui-input-inline">
                  <s:password id="repass" cssClass="layui-input"  lay-verify="repass"  autocomplete="off"/>
                  <%--<input type="password" id="repass" name="repass" required lay-verify="repass" autocomplete="off" class="layui-input">--%>
                </div>
              </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-inline">
                        <input type="radio" name="user.sex" value="0" title="男" checked>
                        <input type="radio" name="user.sex" value="1" title="女" >
                    </div>
                </div>


                <div class="layui-form-item">
                <label for="phone" class="layui-form-label">电话</label>
                <div class="layui-input-inline">
                  <s:textfield id="phone" name="user.phone" cssClass="layui-input"  lay-verify="phone"  autocomplete="off"/>
                  <%--<input type="text" id="phone" name="phone" required lay-verify="phone" autocomplete="off" class="layui-input">--%>
                </div>
                <div class="layui-form-mid layui-word-aux"></div>
              </div>

              <div class="layui-form-item">
                <button class="layui-btn" lay-filter="register" lay-submit>立即注册</button>
              </div>

            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

</div>

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
              if (/(^•••\_)|(\__)|(\_+$)/.test(value)) {
                  return '用户名首尾不能出现下划线\'_\'';
              }
              if (/^\d+\d+\d$/.test(value)) {
                  return '用户名不能全为数字';
              }
              if(!/^[\S]{4,10}$/.test(value)){
                  return '用户名为4到10位';
              }

              // 检查账户是否已经存在
              var flag = false;
              // 必须使用方法,否则执行顺序为先判断flag,后执行ajax,即flag始终为false
              function checkU(){
                  $.ajax({
                      url: "<%=path%>/frontUser/FrontUser_checkAccount.action",
                      type: "POST",
                      async:false,
                      data: {"name":value},
                      success: function (data2) {
                          if(data2 == "1"){
                              flag = true;
                          }
                      }
                  });
              }

              checkU();
              if(flag){
                  return "账户已经存在!";
              }
          },


          // 确认密码验证
          repass: function (value, item) {
              var pass = $("#pass").val();
              if (pass !== value) {
                  return "密码不一致!";
              }
          }

          , pass: [
              /^[\S]{6,12}$/
              , '密码必须6到12位，且不能出现空格'
          ]

      });

        // 提交表单
        form.on('submit(register)', function (data) {

            layer.confirm('确认提交？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                layer.msg('已提交！', {icon: 1});
                $.ajax({
                    url: "<%=path%>/frontUser/FrontUser_addUser.action",
                    type: "POST",
                    data: data.field,
                    beforeSend: function () {
                        //
                    },
                    success: function (data2) {
                        if (data2 == true) {
                            layer.msg("创建成功!", {time: 1000, icon: 1}, function () {location.reload();});
                        } else {
                            layer.msg("创建失败!", {time: 1000, icon: 2},function () {location.reload();});
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