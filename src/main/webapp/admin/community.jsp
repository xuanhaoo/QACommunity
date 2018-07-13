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
    th {
        text-align: center;
    }

</style>

<head>
    <title>社区用户</title>
</head>
<body>
    <div class="admin-main">
        <blockquote class="layui-elem-quote ">
            <form class="layui-form" style="display: inline-block;margin-left: 10px; min-height: inherit; vertical-align: bottom;">
                <div class="layui-input-block" style="display: inline-block;margin-left: 20px; min-height: inherit; vertical-align: bottom;">
                    <div class="layui-form-pane">
                        <label class="layui-form-label" style="padding: 4px 15px;height:30px;">创建时间</label>
                        <div class="layui-input-inline">
                            <input class="layui-input" placeholder="日期范围" id="com_beginDate" name="beginDate" style="width: 300px;height:30px; line-height:30px;"  value="" readonly="true">
                        </div>
                    </div>
                </div>

                <div class="layui-input-block" style="display: inline-block;margin-left: 20px; min-height: inherit; vertical-align: bottom;">
                    <div class="layui-form-pane">
                        <label class="layui-form-label" style="padding: 4px 15px;height:30px;">姓名关键字</label>
                            <input class="layui-input keywords" placeholder="姓名关键字" style="width: 300px;height:30px; line-height:30px;"  value="" >
                    </div>
                </div>

                <a href="javascript:;" class="layui-btn layui-btn-sm" style="margin-left: 20px;" id="com_search">
                <i class="layui-icon">&#xe615;</i> 搜索
                </a>

                <a href="javascript:;" class="layui-btn layui-btn-sm" id="com_searchAll">
                    <i class="layui-icon">&#xe615;</i> 查看全部
                </a>
            </form>
        </blockquote>
        <div class="log">
            <fieldset class="layui-elem-field">
            <legend>用户列表</legend>
            <div class="layui-field-box">
                <div class="layui-btn-group">
                    <button class="layui-btn layui-btn-sm" id="delChoose">删除选中行数据</button>
                </div>
                <table id="demo" lay-filter="community"></table>
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

    <%--性别模板--%>
    <script type="text/html" id="sexTpl">
        {{#  if(d.sex == 0){ }}
        <span>男士</span>
        {{#  } else  if(d.sex == 1) { }}
        <span>女士</span>
        {{#  } }}
    </script>

</body>
<script src="<%=basePath %>/static/plugins/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/plugins/layui/layui.all.js"></script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-bheighttn-warm layui-btn-sm" lay-event="alter">修改</a>
    <a class="layui-btn layui-btn-sm layui-bheighttn-warm"  lay-event="del">删除</a>


</script>

<script>
    layui.use(['laydate','table','laytpl'], function(){
        var table = layui.table;
        var laydate = layui.laydate;
        var laytpl = layui.laytpl;

        // 初始化日期选择
        laydate.render({
            elem: '#com_beginDate'
            ,type: 'datetime'
            ,range: true
            ,done:function(value, date, endDate){
                // console.log(date);
                console.log(endDate); //得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
                date = date['year']+"-"+date['month']+"-"+date['date']+" "+date['hours']+":"+""+date['minutes']+":"+date['seconds'];
                endDate = endDate['year']+"-"+endDate['month']+"-"+endDate['date']+" "+endDate['hours']+":"+""+endDate['minutes']+":"+endDate['seconds'];

                    table.reload('table_community',{
                        url: '<%=path%>/admin/qaCommunity_getCommunityList.action' //数据接口
                        ,where:{
                            "startDate":date,
                            "endDate":endDate
                        }
                    });

            }
        });


        table.render({
            elem: '#demo'
            ,id:'table_community'
            ,height: 700
            ,url: '<%=path%>/admin/qaCommunity_getCommunityList.action' //数据接口
            ,page: true //开启分页
            ,align:'center'
            ,cols: [[ //表头
                {type:'checkbox'}
                ,{field: 'id', title: 'ID',  sort: true}
                ,{field: 'account', title: '账户',  sort: true}
                ,{field: 'name', title: '姓名', sort: true}
                ,{field: 'sex', title: '性别', sort: true, templet:"#sexTpl"}
                ,{field: 'phone', title: '电话'}
                ,{field: 'email', title: '邮箱'}
                ,{field: 'createDate', title: '创建时间', sort: true, templet:'#timeTpl'} //指定tpl模板
                ,{toolbar: '#barDemo'}
            ]]

        });


        // 查看全部
        $("#com_searchAll").on('click',function () {

            table.reload('table_community',{
                url: '<%=path%>/admin/qaCommunity_getCommunityList.action' //数据接口
                ,where:{
                    startDate:"",
                    endDate:"",
                    name:""
                }
            });
        });


        // 搜索
        $("#com_search").on('click',function () {
            var name = $(".keywords").val();

            table.reload('table_community',{
                url: '<%=path%>/admin/qaCommunity_getCommunityList.action' //数据接口
                ,where:{
                    "name":name
                }
            });
        });



        // 删除选择
        $("#delChoose").on("click",function(){
            layer.confirm("确定删除选择的所有日志吗?",function(index) {
                // 获取选中的对象
                var checkStatus = table.checkStatus('table_community');
                // 得到对象中的数据
                var chooseData = checkStatus.data;
                // 创建一个id集,传给后台
                var ids = [];
                // 遍历取出id
                for (var i = 0; i < chooseData.length; i++) {
                    // console.log(chooseData[i].id);
                    ids.push(chooseData[i].id);
                }
                console.log(ids);
                $.ajax({
                    url: '<%=path%>/admin/qaCommunity_delComUser.action'
                    ,traditional:true   //  将数组序列化,防止传参数时将数组分割(id:ids[0] id: ids[1])
                    ,data:{"id":ids}
                    ,dataType:'json'
                    // 返回成功的
                    ,success:function(data){
                        if(data.status == "0"){
                            layer.msg("删除失败!!",{
                                icon:2,
                                timeout:2000
                            },function () {
                                location.reload();
                            });
                        }else{
                            layer.msg("删除成功!",{
                                icon:1,
                                timeout:2000
                            },function(){
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


        // 监听工具条
        table.on('tool(community)',function(obj){
            var data = obj.data;
            var layEvent = obj.event;
            // 删除事件
            if(layEvent === "del") {
                layer.confirm("确定删除吗?", function (index) {
                    console.log(data);
                    $.ajax({
                        url: '<%=path%>/admin/qaCommunity_delComUser.action'
                        , data: {"id": data.id}
                        , dataType: 'json'
                        // 返回成功的
                        , success: function (data) {
                            if (data.status == "0") {
                                layer.msg("删除失败!!", {
                                    icon: 2,
                                    timeout: 2000
                                }, function () {
                                    location.reload();
                                });
                            } else {
                                layer.msg("删除成功!", {
                                    icon: 1,
                                    timeout: 2000
                                }, function () {
                                    location.reload();
                                });
                            }
                        }
                        // 超时
                        , timeout: function () {
                            layer.msg("请求超时!", {
                                icon: 2,
                                timeout: 2000
                            }, function () {
                                location.reload();
                            });
                        }
                        // 错误
                        , error: function () {
                            layer.msg("发生错误!请与管理员联系!", {
                                icon: 2,
                                timeout: 2000
                            }, function () {
                                location.reload();
                            });
                        }
                    });

                });
            }

            // 修改事件
            else if (layEvent === "alter"){

                layer.open({
                    type: 2,
                    title: ['修改用户信息', 'text-align:center;'],
                    content: '<%=path%>/admin/qaCommunity_editUser.action?id='+data.id,
                    area:['500px', '350px'],  //宽高
                    resize: false,		//是否允许拉伸
                    scrollbar: false,
                    end: function(){
                        location.reload();
                    }
                });
            }
        });


    });


</script>
</html>
