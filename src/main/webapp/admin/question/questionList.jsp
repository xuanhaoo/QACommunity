<%--
  Created by IntelliJ IDEA.
  User: Mr.liang
  Date: 2017/12/13
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="org.apache.struts2.ServletActionContext" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<link type="text/css" href="<%=basePath %>/static/plugins/layui/css/layui.css" rel="stylesheet" />

<style>
    .layui-btn-sm{
        background-color: #11bfe3;
    }
    .layui-btn-warm{
        background-color: #FFB800;
    }
    .layui-elem-quote{
        border-left: 5px solid #11bfe3;
        border-radius: 4px;
        background-color: #fff;
    }
    .log{
        border-radius: 4px;
        background-color: #fff;
    }
    .layui-table-view .layui-form-checkbox, .layui-table-view .layui-form-radio, .layui-table-view .layui-form-switch {
        top: 0;
        margin: 4px;
        box-sizing: content-box;
    }
</style>

<head>
    <title>内容管理</title>
</head>
<body>
<div class="admin-main">
    <blockquote class="layui-elem-quote ">
        <form class="layui-form" style="display: inline-block;margin-left: 10px; min-height: inherit; vertical-align: bottom;">
            <div class="layui-input-block" style="display: inline-block;margin-left: 20px; min-height: inherit; vertical-align: bottom;">
                <div class="layui-form-pane">
                    <label class="layui-form-label" style="padding: 4px 15px;height:30px;">日期</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" placeholder="日期范围" id="log_beginDate" name="beginDate" style="width: 300px;height:30px; line-height:30px;"  value="" readonly="true">
                    </div>
                </div>
            </div>
            <%--<a href="javascript:;" class="layui-btn layui-btn-sm" id="log_searchAll">--%>
                <%--<i class="layui-icon">&#xe615;</i> 查看全部--%>
            <%--</a>--%>
        </form>
    </blockquote>
    <div class="log">
        <fieldset class="layui-elem-field">
            <legend>问题列表</legend>
            <div class="layui-field-box">
                <div class="layui-btn-group">
                    <button class="layui-btn layui-btn-sm" id="delChoose">删除选中行数据</button>
                </div>
                <table id="questionDemo" lay-filter="ques"></table>
            </div>
        </fieldset>
    </div>
</div>
<%--时间显示模板--%>
<script type="text/html" id="timeTpl">
    <%--时间转化--%>
    {{#
    var date = new Date(d.createDate['time']).toLocaleDateString();
    var time = new Date(d.createDate['time']).toLocaleTimeString();
    }}
    <span>{{ date+" "+time }}</span>
</script>

<script type="text/html" id="labelsTpl">
    <%--时间转化--%>
    {{# for(var i = 0;i < d.labels.length;i++) { }}
    <button class="layui-btn layui-btn-xs">{{ d.labels[i] }}</button>
    {{# } }}

</script>
</body>
<script src="<%=basePath %>/static/plugins/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/plugins/layui/layui.all.js"></script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-bheighttn-normal layui-btn-sm" lay-event="detailQues">查看详情</a>
    <a class="layui-btn layui-bheighttn-warm layui-btn-sm" lay-event="delQues">删除</a>


</script>

<script>
    layui.use(['laydate','table','laytpl','layer'], function(){
        var table = layui.table;
        var laydate = layui.laydate;
        var laytpl = layui.laytpl;
        var layer = layui.layer;


        // 初始化日期选择
        laydate.render({
            elem: '#log_beginDate'
            ,type: 'datetime'
            ,range: true
            ,done:function(value, date, endDate){
                // console.log(date);
                console.log(endDate); //得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
                date = date['year']+"-"+date['month']+"-"+date['date']+" "+date['hours']+":"+""+date['minutes']+":"+date['seconds'];
                endDate = endDate['year']+"-"+endDate['month']+"-"+endDate['date']+" "+endDate['hours']+":"+""+endDate['minutes']+":"+endDate['seconds'];

                table.reload('table_log',{
                    url: '<%=path%>/admin/qaLog_getList.action' //数据接口
                    ,where:{
                        "startDate":date,
                        "endDate":endDate
                    }
                });
            }
        });


        // 查看全部
        $("#log_searchAll").on('click',function () {
            table.reload('table_log',{
                url: '<%=path%>/admin/qaLog_getList.action' //数据接口
                ,where:{
                    "startDate":""
                }
            });
        });


        //第一个实例，表格初始化
        table.render({
            elem: '#questionDemo'
            ,id:'questionDemo'
            ,height: 600
            ,url: '<%=path%>/admin/qaBackQues_getAllQuestion.action' //数据接口
            ,page: true //开启分页
            ,align:'center'
            ,where:{
                startDate:''
            }
            ,width: $(document).width()*0.96
//            ,height: $(document).height()*0.80      //高度
            ,cols: [[ //表头
                 {type:'checkbox',align:'center',fixed: true}
                ,{field: 'quesId', title: 'ID',  sort: true, align:'center',width: $(document).width()*0.07}
                ,{field: 'quesTitle', title: '问题标题',  sort: true, align:'center',width: $(document).width()*0.12}
                ,{field: 'quesDetail', title: '详细内容', align:'center',width: $(document).width()*0.3}
                ,{field: 'topicName', title: '所属话题', sort: true, align:'center',width: $(document).width()*0.1}
                ,{field: 'labels', title: '标签', templet:"#labelsTpl", align:'center',width: $(document).width()*0.2}
                ,{field: 'createDate', title: '时间', sort: true, templet:'#timeTpl',align:'center', width: $(document).width()*0.2} //指定tpl模板
                ,{field: 'account', title: '创建账号', sort: true, align:'center',width: $(document).width()*0.15}
                ,{field: 'accountName', title: '用户昵称', align:'center',width: $(document).width()*0.15}
                ,{toolbar: '#barDemo', title:"操作", align:'center',width: $(document).width()*0.15,fixed: 'right'}
            ]]
            ,done: function() {
                //数据渲染完毕后设置窗口高度
                ChangeIfmHeight();
            }

        });

        // 监听工具条
        table.on('tool(ques)',function(obj){
            var data = obj.data;//获取改行数据
            //查看详细信息
            if(obj.event == 'detailQues') {
                var theQuesId = data.quesId;
                getDetailQues(theQuesId);
            }
            //删除该问题
            if(obj.event == 'delQues') {
                layer.confirm('这样会将该问题的评论一起删除！确定删除吗？', {
                    icon:3,
                    btn: ['确定删除', '我在想想']
                },function() {
                    var theQuesId = data.quesId;
                    deleteQues(theQuesId);
                });

            }
        });

        /**
         *获取详细信息
         * @param quesId
         */
        function getDetailQues(quesId) {
            window.location.href = "<%=path%>/admin/qaBackQues_getTheQues.action?qId="+quesId;
        }


        function deleteQues(quesId) {
            $.ajax({
                url: "<%=path%>/admin/qaBackQues_deleteQues.action?qId="+quesId,
                type: 'POST',
                dataType: 'json',
                data: {'qId': quesId},
                error: function(request){
                    layer.msg("请求服务器超时", {time: 1000, icon: 5});
                },
                success: function(data){
                    if (data.status = "0"){
                        layer.msg("删除成功！",{time: 1000,icon: 1}, function(){
                            location.reload();
                        });
                    }else{
                        layer.msg('删除失败！', {time: 1000,icon: 2});
                    }
                }
            });
        }


        // 删除选择
        $("#delChoose").on("click",function(){
            layer.confirm('这样会将该问题的评论一起删除！确定删除已选择的问题吗？', {
                icon:3,
                btn: ['确定删除', '我在想想']
            },function(index) {
                // 获取选中的对象
                var checkStatus = table.checkStatus('questionDemo');
                // 得到对象中的数据
                var chooseData = checkStatus.data;
                // 创建一个id集,传给后台
                var ids = [];
                // 遍历取出id
                for (var i = 0; i < chooseData.length; i++) {
                    ids.push(chooseData[i].quesId);
                }

                $.ajax({
                    url: '<%=path%>/admin/qaBackQues_deleteQues.action'
                    ,traditional:true   //  将数组序列化,防止传参数时将数组分割(id:ids[0] id: ids[1])
                    ,data:{"qId":ids}
                    ,dataType:'json'
                    // 返回成功的
                    ,success:function(data){
                        if(data.status == "0"){
                            layer.msg("删除成功!",{
                                icon:1,
                                timeout:2000
                            },function(){
                                location.reload();
                            });

                        }else{
                            layer.msg("删除失败!!",{
                                icon:2,
                                timeout:2000
                            },function () {
                                location.reload();
                            });
                        }
                    }
                    // 超时
                    , timeout:function(){
                        layer.msg("请求超时!",{
                            icon:2,
                            timeout:2000
                        },function(){
                            location.reload();
                        });
                    }
                    // 错误
                    , error:function(){
                        layer.msg("发生错误!请与管理员联系!",{
                            icon:2,
                            timeout:2000
                        },function () {
                            location.reload();
                        });
                    }

                })
            });

        });

        //ajax加载完数据后重新修改iframe高度
        // 修改iframe的高度值
        function ChangeIfmHeight() {
            if ($(window.parent.document).find("#iframepage")) {
                var iframeObj = $(window.parent.document).find("#iframepage");
                var thisheight = $(document).height();
                iframeObj .height(thisheight);
            }
        }

    });


</script>
</html>


