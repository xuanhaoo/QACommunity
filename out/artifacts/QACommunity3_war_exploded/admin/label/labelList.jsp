<%--
  Created by IntelliJ IDEA.
  User: Mr.liang
  Date: 2017/12/10
  Time: 21:27
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
                <div class="content">
                    <legend>标签列表</legend>
                    <div class="toolbar">
                    <!--        Here you can write extra buttons/actions for the toolbar              -->
                        <div class="columns columns-left" style="margin-right: 50px;">
                            <button class="btn btn-default addLabel" type="button" name="addLabel" title="添加标签">
                                <i class="fa fa-plus"></i>
                            </button>
                        </div>

                    </div>

                    <table id="bootstrap-table" class="table">
                        <thead>
                        <th data-field="state" data-checkbox="true"></th>
                        <th data-field="lId" data-sortable="true">标签ID</th>
                        <th data-field="labelName" data-sortable="true">标签名</th>
                        <th data-field="remarks">简述</th>
                        <th data-field="topicName" data-sortable="true">所属话题</th>
                        <th data-field="createDate" data-sortable="true">创建时间</th>
                        <th data-field="actions" class="td-actions text-right" data-events="operateEvents" data-formatter="operateFormatter">操作</th>
                        </thead>
                        <tbody>
                        <s:iterator value="qaLabelsList" var="label">
                            <tr>
                                <td></td>
                                <td><s:property value="#label.lId"/></td>
                                <td><s:property value="#label.labelName"/></td>
                                <td><s:property value="#label.remarks"/></td>
                                <td><s:property value="#label.topicName"/></td>
                                <td><s:date name="#label.createDate" format="yyyy年MM月dd日"/></td>
                                <td></td>
                            </tr>
                        </s:iterator>
                        </tbody>
                    </table>
                </div>


            </div><!--  end card  -->
        </div> <!-- end col-md-12 -->
    </div> <!-- end row -->
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


<script type="text/javascript">
    var $table = $('#bootstrap-table');
//    var timer1 = window.setInterval("reinitIframe()", 500); //定时调用开始
//    window.clearInterval(timer1);

    function operateFormatter(value, row, index) {
        return [
//            '<a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)">',
//            '<i class="fa fa-image"></i>',
//            '</a>',
            '<a rel="tooltip" title="编辑" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)">',
            '<i class="fa fa-edit"></i>',
            '</a>',
            '<a rel="tooltip" title="删除" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)">',
            '<i class="fa fa-remove"></i>',
            '</a>'
        ].join('');
    }

    $().ready(function(){

        window.operateEvents = {
//            'click .view': function (e, value, row, index) {
//                console.log(row.lId);
//                info = JSON.stringify(row);
//
//                swal('You click view icon, row: ', info);
//                console.log(info);
//            },
            'click .edit': function (e, value, row, index) {
                //console.log(row.lId+"test");
                window.location.href = "<%=path%>/admin/qaBackLabel_updateView.action?lId="+row.lId;
            },
            'click .remove': function (e, value, row, index) {
                deleteLabel(row.lId);
            }
        };

        $table.bootstrapTable({
            toolbar: ".toolbar",
            clickToSelect: true,
            showRefresh: true,
            search: false,
            showToggle: true,
            showColumns: true,
            pagination: true,
            searchAlign: 'left',
            striped: true, // 隔行加亮
            pagination: true, // 开启分页功能
            pageSize: 10,
            clickToSelect: false,
            pageList: [8,10,25,50,100],

            formatShowingRows: function(pageFrom, pageTo, totalRows){
                //do nothing here, we don't want to show the text "showing x of y from..."
            },
            formatRecordsPerPage: function(pageNumber){
                return pageNumber + " rows visible";
            },
            icons: {
                refresh: 'fa fa-refresh',
                toggle: 'fa fa-th-list',
                columns: 'fa fa-columns',
                detailOpen: 'fa fa-plus-circle',
                detailClose: 'fa fa-minus-circle'
            }
        });

        //activate the tooltips after the data table is initialized
        $('[rel="tooltip"]').tooltip();

//        $(window).resize(function () {
//            $table.bootstrapTable('resetView');
//        });

        function deleteLabel(lId) {
            layer.confirm('确定删除该标签?', {
                btn: ['确定', '取消']
            }, function(){
                //ajax
                $.ajax({
                    url: "<%=path%>/admin/qaBackLabel_deleteLabel.action",
                    type:"POST",
                    data:{
                        'lId': lId,
                    },
                    beforeSend: function(){
                        //
                    },
                    success:function(data)
                    {
                        var data2 = eval("("+data+")");  //转化为json对象
                        if(data2.status == "0"){
                            layer.msg("删除成功！", {time: 1000,icon: 1},function() {
                                location.reload();
                            });

                        }else {
                            layer.msg("删除失败！", {time: 1000,icon: 2});
                        }
                    },
                    error: function(){
                        layer.msg('请求服务器超时', {time: 1000,icon: 2});
                    }
                });
            })
        }


    });
    //添加事件
    $('.addLabel').on('click', function() {
        window.location.href = "<%=path%>/admin/qaBackLabel_topicSelect.action";
    });
</script>

</html>


