<%--
  Created by IntelliJ IDEA.
  User: Mr.liang
  Date: 2017/12/12
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
        <div class="card">
            <form id="addLabelForm" class="form-horizontal" method="post" novalidate="" onsubmit="return false;">
                <div class="content">
                    <legend>添加标签
                        <div class="columns columns-right" style="margin-right: 30px;margin-top: -4px;float: right;">
                            <button class="btn btn-default returnlast" type="button" name="addLabel" title="返回">
                                <i class="fa fa-arrow-left"></i>
                            </button>
                        </div>
                    </legend>

                    <fieldset>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">所属话题</label>
                            <div class="col-sm-6">
                                <select name="topicId" class="selectpicker" data-title="选择话题" required="required" data-style="btn-default btn-block" data-menu-style="dropdown-blue">
                                    <s:iterator value="qaTopicList" var="topic">
                                        <option value="<s:property value="#topic.toId"/>"><s:property value="#topic.topicName"/></option>
                                    </s:iterator>
                                </select>
                            </div>
                            <div class="col-sm-4"><code>必选</code></div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">标签名</label>
                            <div class="col-sm-6">
                                <input class="form-control"
                                       type="text"
                                       name="labelName"
                                       required="required"
                                />
                            </div>
                            <div class="col-sm-4"><code>必填</code></div>
                        </div>
                    </fieldset>

                    <fieldset>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">描述</label>
                            <div class="col-sm-6">
                                <input class="form-control"
                                       type="text"
                                       name="remarks"
                                />
                            </div>
                            <div class="col-sm-4"><code>可为空</code></div>
                        </div>
                    </fieldset>

                    <fieldset>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">排序</label>
                            <div class="col-sm-6">
                                <input class="form-control"
                                       type="text"
                                       name="sorted"
                                       number="true"
                                       required="required"
                                />
                            </div>
                            <div class="col-sm-4"><code>必填</code></div>
                        </div>
                    </fieldset>

                </div>
                <div class="footer text-center">
                    <button type="submit" class="btn btn-info btn-fill addHandle">提交</button>
                </div>
            </form>
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

<!--  Notifications Plugin    -->
<script src="<%=basePath %>/static/plugins/js/bootstrap-notify.js"></script>

<!-- Sweet Alert 2 plugin -->
<script src="<%=basePath %>/static/plugins/js/sweetalert2.js"></script>

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


<script>
    $().ready(function(){
        $('#addLabelForm').validate({
            onsubmit:true,// 是否在提交是验证
            messages: {     //定义显示信息
                topicId: {
                    required: "必选"
                },
                labelName: {
                    required: "必填"
                },
                sorted: {
                    required: "必填"
                }
            }
        });

        /**
         * 添加提交ajax
         */
        $('.addHandle').on('click', function() {
            if($("#addLabelForm").valid()) { //表单验证通过
                $.ajax({
                    type:"POST",
                    url:"<%=path%>/admin/qaBackLabel_addLabel.action",
                    dataType: "json",
                    data: $("form").serialize(),
                    success: function(data) {
                        var data2 = eval("("+data+")");  //转化为json对象
                        console.log(data2.status);
                        if(data2.status == "0") {
                            layer.msg("添加成功！", {
                                time:1000,
                                icon: 1,
                                skin: 'layer-ext-moon'
                            },function() {
                                window.location.href = "<%=path%>/admin/qaBackLabel_getAllLabel.action";
                            });

                        }else {
                            layer.msg("添加失败！", {
                                time:1000,
                                icon: 0,
                                skin: 'layer-ext-moon'
                            });
                        }
                    },
                    error: function() {
                        layer.msg("系统异常，请稍后重试！");
                    }

                });
            }else {

            }


        });

        $(".returnlast").on('click', function() {
            window.location.href = "<%=basePath %>/admin/qaBackLabel_getAllLabel.action";
        });

    });
</script>
</html>
