<%--
  Created by IntelliJ IDEA.
  User: Mr.liang
  Date: 2017/12/17
  Time: 14:51
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
    <title>问题详情</title>

    <link type="text/css" href="<%=basePath %>/static/plugins/layui/css/layui.css" rel="stylesheet" />
    <link type="text/css" href="<%=basePath %>/static/plugins/css/semantic.min.css" rel="stylesheet" />
    <link type="text/css" href="<%=basePath %>/static/plugins/css/font-awesome.min.css" rel="stylesheet" />
    <style>
        body {
            background: #f5f5f5;
        }
        .layui-btn-sm{
            background-color: #11bfe3;
        }
        .layui-btn-warm{
            background-color: #FFB800;
        }
        .quote1{
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
        .ct-chart {
            margin: 50px 0 10px;
            height: 260px;
        }
        .quote2 {
            border-left: 5px solid #fb760699;
            border-radius: 4px;
            background-color: #ebf3f24d;
            margin-left: 5px;margin-top: 10px;
        }
        .quote3 {
            border-left: 5px solid #365ce399;
            border-radius: 4px;
            background-color: #ebf3f24d;
            margin-left: 5px;margin-top: 10px;
        }
        .brow-comm {
            margin: 10px 20px 0 20px;
        }
        .comment_box {
            margin-left: 20px;
        }
        .text_style {
            margin-top: 10px;
        }
        .tool_comment {
            margin-top: 20px;
            font-size: 1.0em;
        }
        .comment_html_style {
            margin-left:30px;
            margin-right: 30px;
        }
        .ui.comments {
            max-width: 100%;
        }
        .ui.comments .comment .metadata .date {
            margin-left: 15px;
        }
        .ui.comments .comment .text {
            margin: 1.05em 0.92em 1.05em;
        }
        .ui.comments .comment .metadata .rating {
            margin: 1.05em 0.92em .05em;
            font-size: 1.20em;
        }
        .ui.comments .comment .metadata .reply {
            margin-left:10px;
            color: rgba(0,0,0,.4);
            cursor: pointer;
        }
        .ui.comments .comment .metadata .reply:hover {

            color: rgba(0,0,0,.8);
            cursor: pointer;
        }
        .ui.section.divider {
            margin-top: 13px;
        }
        .sign-style {
            font-family: Lato,'Helvetica Neue',Arial,Helvetica,sans-serif;
            font-weight: 400;
            line-height: 1em;
            color: #1B1C1D;
            text-transform: uppercase;
            text-align: center;
        }
        .title-style {
            margin-left: 50px;
            font-size: 16px;
            font-family: Lato,'Helvetica Neue',Arial,Helvetica,sans-serif;
            font-weight: 500;
            line-height: 1em;
            color: #1B1C1D;
            text-transform: uppercase;
            text-align: center;
        }
    </style>


</head>
<body>
    <div class="">
            <blockquote class="layui-elem-quote quote1">
                <a href="javascript:;" class="layui-btn layui-btn-sm">
                    <i class="layui-icon">&#xe615;</i> 返回
                </a>
                <span class="title-style">问题标题：<s:property value="singleInfo.title"/></span>
            </blockquote>

        <%--问题的浏览日期图表--%>
        <div class="log">
            <div class="brow-comm">
                <fieldset class="layui-elem-field">
                    <legend>问题浏览信息</legend>
                    <blockquote class="layui-elem-quote quote2">
                        <form class="layui-form" style="display: inline-block;margin-left: 10px; min-height: inherit; vertical-align: bottom;">
                            <span class="sign-style">问题总的浏览量： <s:property value="singleInfo.browse"/> 人次</span>
                            <div class="layui-input-block" style="display: inline-block;margin-left: 20px; min-height: inherit; vertical-align: bottom;">
                                    <input type="hidden" value="<s:property value="singleInfo.lId"/>" name="quesId" id="quesId">
                                    <div class="layui-form-pane">
                                        <label class="layui-form-label"  style="padding: 4px 15px;height:30px;">日期范围</label>
                                        <div class="layui-input-inline">
                                            <input type="text" class="layui-input" id="browse" placeholder=" - " style="width: 300px;height:30px; line-height:30px;">
                                        </div>
                                    </div>
                            </div>
                                    <a href="javascript:;" class="layui-btn layui-btn-sm" id="search-brow">
                                        <i class="layui-icon">&#xe615;</i> 查看
                                    </a>
                        </form>
                    </blockquote>
                    <div class="brow-echarts">
                        <div id="browCharts" class="ct-chart">

                        </div>
                    </div>
                </fieldset>
            </div>


        </div>
        <%--问题的评论--%>
        <div class="log">
            <div class="brow-comm">
                <fieldset class="layui-elem-field">
                    <legend>评论信息</legend>
                    <blockquote class="layui-elem-quote quote3">
                        <form class="layui-form" style="display: inline-block;margin-left: 10px; min-height: inherit; vertical-align: bottom;">
                            <span class="sign-style">问题总的评论量： <s:property value="singleInfo.comment"/> 条</span>
                            <div class="layui-input-block" style="display: inline-block;margin-left: 20px; min-height: inherit; vertical-align: bottom;">

                            </div>
                        </form>
                    </blockquote>
                    <div class="comment_html_style">
                        <div class="comment_box ui comments " id="comment_html"><h3 class="ui dividing header">评论</h3>

                        </div>
                    </div>
                </fieldset>
            </div>
        </div>

    </div>

</body>
<script src="<%=basePath %>/static/plugins/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/plugins/layui/layui.all.js"></script>
<script src="<%=basePath %>/static/plugins/js/echarts.min.js"></script>
<%--<script src="<%=basePath %>/static/js/basigleques.js"></script>--%>

<script type="text/javascript">
    layui.use(['laydate','table','laytpl'], function() {
        var table = layui.table;
        var laydate = layui.laydate;
        var laytpl = layui.laytpl;


        //初始化日期选择
        laydate.render({
            elem: '#browse'
            , type: 'date'
            , range: true
            , done: function (value, date, endDate) {
                // console.log(date);
                console.log(endDate); //得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
                date = date['year'] + "-" + date['month'] + "-" + date['date'] + " " + date['hours'] + ":" + "" + date['minutes'] + ":" + date['seconds'];
                endDate = endDate['year'] + "-" + endDate['month'] + "-" + endDate['date'] + " " + endDate['hours'] + ":" + "" + endDate['minutes'] + ":" + endDate['seconds'];


            }
        });
        var quesId = $('#quesId').val();        //问题id
        //初始化ajax加载浏览图表
        $.ajax({
            url: '<%=path%>/admin/qaBackQues_getBrowForDate.action'
            , data: {'browdate': "", 'qId':quesId}
            , dataType: 'json'
            // 返回成功的
            , success: function (data) {
                if (data.status == "0") {
                    browseChart(data);
                } else {

                }
            }
        });
        //初始化ajax加载评论
        $.ajax({
            url: '<%=path%>/admin/qaBackQues_getComment.action'
            , data: {'qId':quesId}
            , dataType: 'json'
            // 返回成功的
            , success: function (data) {
                if (data.status == "0") {
                    getComment_one(data);
                } else {

                }
            }
        });

        $("#search-brow").on('click', function () {
            var inputDate = $("#browse").val();
            console.log(inputDate);
            getBrowseByAjax(inputDate, quesId);
        });

        /**
         * 选择日期后通过ajax动态获取数据
         * */
        function getBrowseByAjax(inputDate) {
            $.ajax({
                url: '<%=path%>/admin/qaBackQues_getBrowForDate.action'
                , data: {'browdate': inputDate, 'qId':quesId}
                , dataType: 'json'
                // 返回成功的
                , success: function (data) {
                    if (data.status == "0") {
                        browseChart(data);
                    } else {

                    }
                }
            });
        }

        /**
         *获取到json数据对其进行组装，嵌入评论页
         * */
        function getComment_one(data) {
            console.log(data);
            var commList = data.commList;
            console.log(commList);
            //$("#comment_html").html("");        //清空初始化
            var html;
//            var html1 = '<div class="comment_box ui comments ">'+'<h3 class="ui dividing header">评论</h3>';
//            $("#comment_html").append(html1);
            $.each(commList, function(index, item) {
                console.log(item);
                var date = new Date(item.createDate['time']).toLocaleDateString();
                var time = new Date(item.createDate['time']).toLocaleTimeString();
                var dateTime = date + " " + time;

                html = '<div class="comment">'+
                            '<a class="avatar">'+
                                '<img src="../static/images/elliot.jpg"></a>'+
                                    '<div class="content">'+
                                        '<a class="author">'+item.accountName+'</a>'+
                                            '<div class="metadata">'+
                                                '<span class="date">'+dateTime+'</span>'+
                                            '</div>'+
                                            '<div class="text text_style">'+item.content+'</div>'+
                                            '<div class="metadata tool_comment">'+
                                                '<div class="rating"><i class="fa fa-thumbs-o-up">'+item.likes+'</i></div>'+
                                                '<a class="reply"><i class="fa fa-comments"></i>查看回复</a>'+
                                                '<a class="reply"><i class="fa fa-trash-o"></i>删除</a>'+
                                            '</div>'+
                                    '</div>'+
                        '</div>'+
                    '<div class="ui section divider"></div>';

                $("#comment_html").append(html);
            });
//            var html3 = '</div>';
//            $("#comment_html").append(html3);



        }

        /**
         * 浏览信息图表数据显示
         * @param data 返回的json数据
         */
        function browseChart(data) {
            var myChart1 = echarts.init(document.getElementById('browCharts'));

            //按逗号分隔字符串，形成数组（too difficult !!!）
            var dataString1 = null;
            var t1 = data.dataString;
            dataString1 = t1.split(",");

            var browCount1 = null;
            var t2 = data.browCount;
            browCount1 = t2.split(",");

            option1 = {
                title: {
                    text: '该段时间问题浏览量',
                    subtext: '来源于数据中心'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['每日浏览量']
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataZoom: {
                            yAxisIndex: 'none'
                        },
                        dataView: {readOnly: false},
                        magicType: {type: ['line', 'bar']},
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: dataString1,
                },
                yAxis: {
                    type: 'value',
                    axisLabel: {
                        formatter: '{value} 次'
                    }
                },
                series: [
                    {
                        name: '访问量',
                        type: 'line',
                        data: browCount1,
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        },
                        markLine: {
                            data: [
                                {type: 'average', name: '平均值'}
                            ]
                        }
                    },
//            {
//                name:'最低气温',
//                type:'line',
//                data:[1, -2, 2, 5, 3, 2, 0],
//                markPoint: {
//                    data: [
//                        {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
//                    ]
//                },
//                markLine: {
//                    data: [
//                        {type: 'average', name: '平均值'},
//                        [{
//                            symbol: 'none',
//                            x: '90%',
//                            yAxis: 'max'
//                        }, {
//                            symbol: 'circle',
//                            label: {
//                                normal: {
//                                    position: 'start',
//                                    formatter: '最大值'
//                                }
//                            },
//                            type: 'max',
//                            name: '最高点'
//                        }]
//                    ]
//                }
//            }
                ]
            };
            myChart1.setOption(option1);

        }
    });


</script>
</html>
