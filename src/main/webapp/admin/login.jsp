<%--
  Created by IntelliJ IDEA.
  User: Mr.liang
  Date: 2017/11/30
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="<%=basePath %>/static/images/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>Q&A问答社区后台登录</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link type="text/css" href="<%=basePath %>/static/plugins/css/bootstrap.min.css" rel="stylesheet" />

    <!--  Light Bootstrap Dashboard core CSS    -->
    <link type="text/css" href="<%=basePath %>/static/plugins/css/light-bootstrap-dashboard.css" rel="stylesheet"/>

    <!--     Fonts and icons     -->
    <link type="text/css" href="<%=basePath %>/static/plugins/css/font-awesome.min.css" rel="stylesheet">
    <link type="text/css" href='<%=basePath %>/static/plugins/css/685fd913f1e14aebad0cc9d3713ee469.css' rel='stylesheet' type='text/css'>
    <link type="text/css" href="<%=basePath %>/static/plugins/css/pe-icon-7-stroke.css" rel="stylesheet" />

</head>
<body>

<nav class="navbar navbar-transparent navbar-absolute">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="../dashboard.html">Q&A问答社区</a>
        </div>
        <%--<div class="collapse navbar-collapse">--%>

            <%--<ul class="nav navbar-nav navbar-right">--%>
                <%--<li>--%>
                    <%--<a href="register.html">--%>
                        <%--Register--%>
                    <%--</a>--%>
                <%--</li>--%>
            <%--</ul>--%>
        <%--</div>--%>
    </div>
</nav>


<div class="wrapper wrapper-full-page">
    <div class="full-page login-page" data-color="black" data-image="<%=basePath %>/static/images/full-screen-image-1.jpg">

        <!--   you can change the color of the filter page using: data-color="blue | azure | green | orange | red | purple" -->
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                        <form id="loginForm">

                            <!--   if you want to have the card without animation please remove the ".card-hidden" class   -->
                            <div class="card card-hidden">
                                <div class="header text-center">登录</div>
                                <div class="content">
                                    <div class="form-group">
                                        <label>账户</label>
                                        <input type="text" placeholder="请输入账户" class="form-control" name="qaBackUser.account" id="account1">
                                    </div>
                                    <div class="form-group">
                                        <label>密码</label>
                                        <input type="password" placeholder="请输入密码" class="form-control" name="qaBackUser.password" id="password1">
                                    </div>
                                </div>
                                <div class="footer text-center">
                                    <input type="button" class="btn btn-fill btn-info btn-wd" id="login-btn" value="Login"/>
                                    <%--<button type="submit" class="btn btn-fill btn-info btn-wd " id="login-btn">Login</button>--%>
                                </div>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>

        <footer class="footer footer-transparent">
            <div class="container">
                <nav class="pull-left">
                    <ul>
                        <li>
                            <a href="#">
                                社区首页
                            </a>
                        </li>
                    </ul>
                </nav>
                <p class="copyright pull-right">
                    &copy; 2017 <a href="#"> CUIT </a>, 拥有一切解释权
                </p>
            </div>
        </footer>

    </div>

</div>


</body>

<!--   Core JS Files and PerfectScrollbar library inside jquery.ui   -->
<script src="<%=basePath %>/static/plugins/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/plugins/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/plugins/js/bootstrap.min.js" type="text/javascript"></script>




<!-- Light Bootstrap Dashboard Core javascript and methods -->
<script src="<%=basePath %>/static/plugins/js/light-bootstrap-dashboard.js"></script>
<script src="<%=basePath %>/static/plugins/js/layer/layer.js"></script>
<script src="<%=basePath %>/static/plugins/js/jquery.validate.min.js"></script>

<script type="text/javascript">
    //匿名函数
    $(document).ready(function() {
        lbd.checkFullPageBackgroundImage();     //图片填充屏幕

        setTimeout(function () {          //加载1s显示登录框
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700);

//        $("#loginForm").validate({
//            onkeyup:null,
//            rules:{
//                account: {
//                    required: true,
//
//                },
//                password: {
//                    required: true,
//                }
//            },
//            messages: {
//                account: {
//                    required: "请输入账户",
//
//                },
//                password: {
//                    required: "请输入密码",
//                }
//            }
//        });
        $("#login-btn").on("click", function () {
            var value1 = $("#account1").val();
            var value2 = $("#password1").val();
            if(value1 === "") {
                layer.msg("请输入用户名！");
            }else if(value2 === ""){
                layer.msg("请输入密码！");
            }else {
                loginDo();  //执行函数
            }

        });

    });
    $(document).keydown(function(event){
        //监听enter键登录事件
        if (event.keyCode == 13) {
            $("#login-btn").click();  //执行点击
        }
    });
    //登录动作
    function loginDo() {
        $.ajax({
            type:"POST",
            url:"<%=path%>/admin/qaBackUser_baLogin.action",
            data:$("form").serialize(),
            dataType:"json",
            success: function(data) {
                var data2 = eval("("+data+")");  //转化为json对象
                //console.log(data2);
                if(data2.status == "0") {
                    layer.msg("登录成功！", {
                        icon: 1,
                        skin: 'layer-ext-moon'
                    });
                    window.location.href = "<%=path%>/admin/qaBackUser_dashboard.action";
                }else {
                    layer.msg("用户名或密码错误！", {
                        icon: 0,
                        skin: 'layer-ext-moon'
                    });
                }
            },
            error: function() {
                layer.msg("系统异常，请稍后重试！");
            }
        });
    }
</script>


</html>
