<%--
  Created by IntelliJ IDEA.
  User: Mr.liang
  Date: 2017/12/6
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!doctype html>
<html lang="en">
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
    <link type="text/css" href='<%=basePath %>/static/plugins/css/685fd913f1e14aebad0cc9d3713ee469.css' rel='stylesheet' />
    <link type="text/css" href="<%=basePath %>/static/plugins/css/pe-icon-7-stroke.css" rel="stylesheet" />

</head>
<body>

<div class="wrapper">

    <%--侧边栏--%>
    <div class="sidebar" data-color="black" data-image="<%=basePath %>/static/images/full-screen-image-1.jpg">

        <div class="logo">
            <a href="#" class="logo-text">
                QA Community
            </a>
        </div>
        <div class="logo logo-mini">
            <a href="#" class="logo-text">
                QAC
            </a>
        </div>

        <div class="sidebar-wrapper">
            <div class="user">
                <div class="photo">
                    <img src="<%=basePath %>/static/images/default-avatar.png" />
                </div>
                <div class="info">
                    <a data-toggle="collapse" href="#collapseExample" class="collapsed">
                        An hao
                        <b class="caret"></b>
                    </a>
                    <div class="collapse" id="collapseExample">
                        <ul class="nav">
                            <li><a href="#">个人信息</a></li>
                            <li><a href="#">修改密码</a></li>
                            <li><a href="#">设置</a></li>
                        </ul>
                    </div>
                </div>
            </div>


            <%--添加点击链接请参照这里--%>
            <ul class="nav">
                <li class="active">
                    <a href="<%=basePath %>/admin/dashboard.jsp" target="iframepage">
                        <i class="pe-7s-graph"></i>
                        <p>控制面板</p>
                    </a>
                </li>
                <li>
                    <a data-toggle="collapse" href="#componentsExamples">
                        <i class="pe-7s-plugin"></i>
                        <p>Components
                            <b class="caret"></b>
                        </p>
                    </a>
                    <div class="collapse" id="componentsExamples">
                        <ul class="nav">
                            <li><a href="../test2.jsp" target="iframepage">测试页面</a></li>
                            <li><a href="components/grid.html">Grid System</a></li>
                            <li><a href="components/icons.html">Icons</a></li>
                            <li><a href="components/notifications.html">Notifications</a></li>
                            <li><a href="components/panels.html">Panels</a></li>
                            <li><a href="components/sweet-alert.html">Sweet Alert</a></li>
                            <li><a href="components/typography.html">Typography</a></li>
                        </ul>
                    </div>
                </li>

                <li>
                    <a data-toggle="collapse" href="#formsExamples">
                        <i class="pe-7s-note2"></i>
                        <p>Forms
                            <b class="caret"></b>
                        </p>
                    </a>
                    <div class="collapse" id="formsExamples">
                        <ul class="nav">
                            <li><a href="forms/regular.html">Regular Forms</a></li>
                            <li><a href="forms/extended.html">Extended Forms</a></li>
                            <li><a href="forms/validation.html">Validation Forms</a></li>
                            <li><a href="forms/wizard.html">Wizard</a></li>
                        </ul>
                    </div>
                </li>

                <li>
                    <a data-toggle="collapse" href="#tablesExamples">
                        <i class="pe-7s-news-paper"></i>
                        <p>Tables
                            <b class="caret"></b>
                        </p>
                    </a>
                    <div class="collapse" id="tablesExamples">
                        <ul class="nav">
                            <li><a href="tables/regular.html">Regular Tables</a></li>
                            <li><a href="tables/extended.html">Extended Tables</a></li>
                            <li><a href="tables/bootstrap-table.html">Bootstrap Table</a></li>
                            <li><a href="tables/datatables.net.html">DataTables.net</a></li>
                        </ul>
                    </div>
                </li>

                <li>
                    <a data-toggle="collapse" href="#mapsExamples">
                        <i class="pe-7s-map-marker"></i>
                        <p>Maps
                            <b class="caret"></b>
                        </p>
                    </a>
                    <div class="collapse" id="mapsExamples">
                        <ul class="nav">
                            <li><a href="maps/google.html">Google Maps</a></li>
                            <li><a href="maps/vector.html">Vector Maps</a></li>
                            <li><a href="maps/fullscreen.html">Full Screen Map</a></li>
                        </ul>
                    </div>
                </li>

                <li>
                    <a href="charts.html">
                        <i class="pe-7s-graph1"></i>
                        <p>Charts</p>
                    </a>
                </li>

                <li>
                    <a href="calendar.html">
                        <i class="pe-7s-date"></i>
                        <p>Calendar</p>
                    </a>
                </li>

                <li>
                    <a data-toggle="collapse" href="#pagesExamples">
                        <i class="pe-7s-gift"></i>
                        <p>Pages
                            <b class="caret"></b>
                        </p>
                    </a>
                    <div class="collapse" id="pagesExamples">
                        <ul class="nav">
                            <li><a href="pages/login.html">Login Page</a></li>
                            <li><a href="pages/register.html">Register Page</a></li>
                            <li><a href="pages/lock.html">Lock Screen Page</a></li>
                            <li><a href="pages/user.html">User Page</a></li>
                            <li><a href="#">More coming soon...</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <%--内容容器--%>
    <div class="main-panel">
        <%--顶部栏--%>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-minimize">
                    <button id="minimizeSidebar" class="btn btn-info btn-fill btn-round btn-icon">
                        <i class="fa fa-ellipsis-v visible-on-sidebar-regular"></i>
                        <i class="fa fa-navicon visible-on-sidebar-mini"></i>
                    </button>
                </div>
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Dashboard PRO</a>
                </div>
                <div class="collapse navbar-collapse">

                    <form class="navbar-form navbar-left navbar-search-form" role="search">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-search"></i></span>
                            <input type="text" value="" class="form-control" placeholder="Search...">
                        </div>
                    </form>

                    <ul class="nav navbar-nav navbar-right">
                        <%--<li>--%>
                        <%--<a href="charts.html">--%>
                        <%--<i class="fa fa-line-chart"></i>--%>
                        <%--<p>Stats</p>--%>
                        <%--</a>--%>
                        <%--</li>--%>

                        <%--<li class="dropdown">--%>
                        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--%>
                        <%--<i class="fa fa-gavel"></i>--%>
                        <%--<p class="hidden-md hidden-lg">--%>
                        <%--Actions--%>
                        <%--<b class="caret"></b>--%>
                        <%--</p>--%>
                        <%--</a>--%>
                        <%--<ul class="dropdown-menu">--%>
                        <%--<li><a href="#">Create New Post</a></li>--%>
                        <%--<li><a href="#">Manage Something</a></li>--%>
                        <%--<li><a href="#">Do Nothing</a></li>--%>
                        <%--<li><a href="#">Submit to live</a></li>--%>
                        <%--<li class="divider"></li>--%>
                        <%--<li><a href="#">Another Action</a></li>--%>
                        <%--</ul>--%>
                        <%--</li>--%>

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-bell-o"></i>
                                <span class="notification">5</span>
                                <p class="hidden-md hidden-lg">
                                    Notifications
                                    <b class="caret"></b>
                                </p>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
                            </ul>
                        </li>

                        <li class="dropdown dropdown-with-icons">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-list"></i>
                                <p class="hidden-md hidden-lg">
                                    More
                                    <b class="caret"></b>
                                </p>
                            </a>
                            <ul class="dropdown-menu dropdown-with-icons">
                                <li>
                                    <a href="#">
                                        <i class="pe-7s-mail"></i> 信息
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="pe-7s-help1"></i> 帮助中心
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="pe-7s-tools"></i> 设置
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <i class="pe-7s-lock"></i> 锁屏
                                    </a>
                                </li>
                                <li>
                                    <a class="text-danger" onclick="delcfm('<%=path %>/admin/qaBackUser_logout.action')">
                                        <i class="pe-7s-close-circle"></i>
                                        退出登录
                                    </a>
                                </li>
                            </ul>
                        </li>

                    </ul>

                </div>
            </div>
        </nav>
            <%--iframe主体部分--%>
            <div class="content">
                <div class="container-fluid">

                    <iframe src="<%=basePath %>/admin/dashboard.jsp" id="iframepage" name="iframepage" frameBorder=0 scrolling=no width="100%"
                            onLoad="IframeLoadEND();">

                    </iframe>
                </div>
            </div>


            <%--页面底部--%>
            <footer class="footer">
                <div class="container-fluid">
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

<!-- 信息删除确认 -->
<div class="modal fade" id="delcfmModel">
    <div class="modal-dialog">
        <div class="modal-content message_align">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <div class="modal-body">
                <p>您确认要退出登录吗？</p>
            </div>
            <div class="modal-footer">
                <input type="hidden" id="url"/>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <a  onclick="urlSubmit()" class="btn btn-success" data-dismiss="modal">确定</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
<!--   Core JS Files and PerfectScrollbar library inside jquery.ui   -->
<script src="<%=basePath %>/static/plugins/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/plugins/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/plugins/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="<%=basePath %>/static/plugins/js/moment.min.js"></script>

<!--  Date Time Picker Plugin is included in this js file -->
<script src="<%=basePath %>/static/plugins/js/bootstrap-datetimepicker.js"></script>

<!--  Select Picker Plugin -->
<script src="<%=basePath %>/static/plugins/js/bootstrap-selectpicker.js"></script>

<!--  Checkbox, Radio, Switch and Tags Input Plugins -->
<script src="<%=basePath %>/static/plugins/js/bootstrap-checkbox-radio-switch-tags.js"></script>

<!--  Charts Plugin -->
<script src="<%=basePath %>/static/plugins/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="<%=basePath %>/static/plugins/js/bootstrap-notify.js"></script>

<!-- Sweet Alert 2 plugin -->
<script src="<%=basePath %>/static/plugins/js/sweetalert2.js"></script>

<!-- Vector Map plugin -->
<script src="<%=basePath %>/static/plugins/js/jquery-jvectormap.js"></script>

<!--  Google Maps Plugin    -->
<script src="<%=basePath %>/static/plugins/js/aa743e8f448a4792bad10d201a7080f6.js"></script>

<!-- Wizard Plugin    -->
<script src="<%=basePath %>/static/plugins/js/jquery.bootstrap.wizard.min.js"></script>

<!--  Bootstrap Table Plugin    -->
<script src="<%=basePath %>/static/plugins/js/bootstrap-table.js"></script>

<!--  Plugin for DataTables.net  -->
<script src="<%=basePath %>/static/plugins/js/jquery.datatables.js"></script>


<!--  Full Calendar Plugin    -->
<script src="<%=basePath %>/static/plugins/js/fullcalendar.min.js"></script>

<!-- Light Bootstrap Dashboard Core javascript and methods -->
<script src="<%=basePath %>/static/plugins/js/light-bootstrap-dashboard.js"></script>
<script src="<%=basePath %>/static/plugins/js/layer/layer.js"></script>
<script src="<%=basePath %>/static/plugins/js/jquery.validate.min.js"></script>

<!--   Sharrre Library    -->
<script src="<%=basePath %>/static/plugins/js/jquery.sharrre.js"></script>
<script src="<%=basePath %>/static/plugins/js/demo.js"></script>

<script type="text/javascript">
    $(document).ready(function(){

        demo.initDashboardPageCharts();
        demo.initVectorMap();

        $.notify({
            icon: 'pe-7s-bell',
            message: "<b>Hello, </b>&nbsp;&nbsp;- 欢迎登录Q&A问答社区后台！"

        },{
            type: 'info',
            timer: 4000
        });


    });

    function delcfm(url) {
        $('#url').val(url);//给会话中的隐藏属性URL赋值
        $('#delcfmModel').modal();
    }
    function urlSubmit(){
        var url=$.trim($("#url").val());//获取会话中的隐藏属性URL
        window.location.href=url;
    }

    // 定义一个函数，定时调用并刷新iframe高度
    function reinitIframe(){
        var iframe = document.getElementById("iframepage");
        try{
            var bHeight = iframe.contentWindow.document.body.scrollHeight;
            var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
            var height = Math.max(bHeight, dHeight);
            iframe.height = height;
        }catch (ex){}
    }

    var timer1 = window.setInterval("reinitIframe()", 500); //定时调用开始

    //完毕后干掉定时器
    function IframeLoadEND(){
        var iframe = document.getElementById("iframepage");
        try{
            window.clearInterval(timer1);
            var bHeight = iframe.contentWindow.document.body.scrollHeight;
            var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
            var height = Math.max(bHeight, dHeight);
            iframe.height = height;
        }catch (ex){}
        // 停止定时
        window.clearInterval(timer1);

    }
</script>

<script>

</script>

</html>


