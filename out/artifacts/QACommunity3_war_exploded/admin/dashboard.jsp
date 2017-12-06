<%--
  Created by IntelliJ IDEA.
  User: Mr.liang
  Date: 2017/12/6
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
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
    <link type="text/css" href='<%=basePath %>/static/plugins/css/685fd913f1e14aebad0cc9d3713ee469.css' rel='stylesheet' />
    <link type="text/css" href="<%=basePath %>/static/plugins/css/pe-icon-7-stroke.css" rel="stylesheet" />

</head>
<body>
<div class="row">
    <div class="col-md-12">
        <div class="card ">
            <div class="header">
                <h4 class="title">社区用户占比</h4>
                <p class="category">来源于统计中心</p>
            </div>
            <div class="content">
                <div class="row">
                    <div class="col-md-5">
                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <td>
                                        <div class="flag">
                                            <img src="<%=basePath %>/static/images/China.png">
                                        </div>
                                    </td>
                                    <td>China</td>
                                    <td class="text-right">
                                        6,660
                                    </td>
                                    <td class="text-right">
                                        65.5%
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="flag">
                                            <img src="<%=basePath %>/static/images/us.png">
                                        </div>
                                    </td>
                                    <td>USA</td>
                                    <td class="text-right">
                                        2,920
                                    </td>
                                    <td class="text-right">
                                        20.23%
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="flag">
                                            <img src="<%=basePath %>/static/images/de.png">
                                        </div>
                                    </td>
                                    <td>Germany</td>
                                    <td class="text-right">
                                        1,000
                                    </td>
                                    <td class="text-right">
                                        10.00%
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="flag">
                                            <img src="<%=basePath %>/static/images/au.png">
                                        </div>
                                    </td>
                                    <td>Australia</td>
                                    <td class="text-right">
                                        760
                                    </td>
                                    <td class="text-right">
                                        3.02%
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="flag">
                                            <img src="<%=basePath %>/static/images/gb.png">
                                        </div>
                                    </td>
                                    <td>United Kingdom</td>
                                    <td class="text-right">
                                        690
                                    </td>
                                    <td class="text-right">
                                        2.25%
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="flag">
                                            <img src="<%=basePath %>/static/images/ro.png">
                                        </div>
                                    </td>
                                    <td>Romania</td>
                                    <td class="text-right">
                                        600
                                    </td>
                                    <td class="text-right">
                                        2.10%
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-6 col-md-offset-1">
                        <div id="worldMap" style="height: 300px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="row">
    <div class="col-md-4">
        <div class="card">
            <div class="header">
                <h4 class="title">Email Statistics</h4>
                <p class="category">Last Campaign Performance</p>
            </div>
            <div class="content">
                <div id="chartEmail" class="ct-chart "></div>
            </div>
            <div class="footer">
                <div class="legend">
                    <i class="fa fa-circle text-info"></i> Open
                    <i class="fa fa-circle text-danger"></i> Bounce
                    <i class="fa fa-circle text-warning"></i> Unsubscribe
                </div>
                <hr>
                <div class="stats">
                    <i class="fa fa-clock-o"></i> Campaign sent 2 days ago
                </div>
            </div>

        </div>
    </div>

    <div class="col-md-8">
        <div class="card">
            <div class="header">
                <h4 class="title">Users Behavior</h4>
                <p class="category">24 Hours performance</p>
            </div>
            <div class="content">
                <div id="chartHours" class="ct-chart"></div>
            </div>
            <div class="footer">
                <div class="legend">
                    <i class="fa fa-circle text-info"></i> Open
                    <i class="fa fa-circle text-danger"></i> Click
                    <i class="fa fa-circle text-warning"></i> Click Second Time
                </div>
                <hr>
                <div class="stats">
                    <i class="fa fa-history"></i> Updated 3 minutes ago
                </div>
            </div>
        </div>
    </div>
</div>



<div class="row">
    <div class="col-md-6">
        <div class="card ">
            <div class="header">
                <h4 class="title">2014 Sales</h4>
                <p class="category">All products including Taxes</p>
            </div>
            <div class="content">
                <div id="chartActivity" class="ct-chart"></div>
            </div>
            <div class="footer">
                <div class="legend">
                    <i class="fa fa-circle text-info"></i> Tesla Model S
                    <i class="fa fa-circle text-danger"></i> BMW 5 Series
                </div>
                <hr>
                <div class="stats">
                    <i class="fa fa-check"></i> Data information certified
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="card ">
            <div class="header">
                <h4 class="title">Tasks</h4>
                <p class="category">Backend development</p>
            </div>
            <div class="content">
                <div class="table-full-width">
                    <table class="table">
                        <tbody>
                        <tr>
                            <td>
                                <label class="checkbox">
                                    <input type="checkbox" value="" data-toggle="checkbox">
                                </label>
                            </td>
                            <td>Sign contract for "What are conference organizers afraid of?"</td>
                            <td class="td-actions text-right">
                                <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs">
                                    <i class="fa fa-edit"></i>
                                </button>
                                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                    <i class="fa fa-times"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="checkbox">
                                    <input type="checkbox" value="" data-toggle="checkbox" checked="">
                                </label>
                            </td>
                            <td>Lines From Great Russian Literature? Or E-mails From My Boss?</td>
                            <td class="td-actions text-right">
                                <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs">
                                    <i class="fa fa-edit"></i>
                                </button>
                                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                    <i class="fa fa-times"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="checkbox">
                                    <input type="checkbox" value="" data-toggle="checkbox" checked="">
                                </label>
                            </td>
                            <td>Flooded: One year later, assessing what was lost and what was found when a ravaging rain swept through metro Detroit
                            </td>
                            <td class="td-actions text-right">
                                <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs">
                                    <i class="fa fa-edit"></i>
                                </button>
                                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                    <i class="fa fa-times"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="checkbox">
                                    <input type="checkbox" value="" data-toggle="checkbox">
                                </label>
                            </td>
                            <td>Create 4 Invisible User Experiences you Never Knew About</td>
                            <td class="td-actions text-right">
                                <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs">
                                    <i class="fa fa-edit"></i>
                                </button>
                                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                    <i class="fa fa-times"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="checkbox">
                                    <input type="checkbox" value="" data-toggle="checkbox">
                                </label>
                            </td>
                            <td>Read "Following makes Medium better"</td>
                            <td class="td-actions text-right">
                                <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs">
                                    <i class="fa fa-edit"></i>
                                </button>
                                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                    <i class="fa fa-times"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="checkbox">
                                    <input type="checkbox" value="" data-toggle="checkbox">
                                </label>
                            </td>
                            <td>Unfollow 5 enemies from twitter</td>
                            <td class="td-actions text-right">
                                <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs">
                                    <i class="fa fa-edit"></i>
                                </button>
                                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                    <i class="fa fa-times"></i>
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="footer">
                <hr>
                <div class="stats">
                    <i class="fa fa-history"></i> Updated 3 minutes ago
                </div>
            </div>

        </div>
    </div>
</div>
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


    });

//    function delcfm(url) {
//        $('#url').val(url);//给会话中的隐藏属性URL赋值
//        $('#delcfmModel').modal();
//    }
//    function urlSubmit(){
//        var url=$.trim($("#url").val());//获取会话中的隐藏属性URL
//        window.location.href=url;
//    }
</script>

</html>

