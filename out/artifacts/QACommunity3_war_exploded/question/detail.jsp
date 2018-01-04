<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: pjy
  Date: 18-1-2
  Time: 下午9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <meta charset="utf-8">
    <title>问题详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="fly,layui,前端社区">
    <link rel="stylesheet" href="<%=basePath %>/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/global.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/front_index.css">
</head>

<style>

    .fly-avatar {
        position: absolute;
        left: 10px;
        top: 5px;
    }

</style>
<body>

<s:include value="head.jsp"/>

<%--<div class="layui-hide-xs">--%>
    <%--<div class="fly-panel fly-column">--%>
        <%--<div class="layui-container">--%>
            <%--<ul class="layui-clear">--%>
                <%--<li class="layui-hide-xs"><a href="/">首页</a></li>--%>
                <%--<li class="layui-this"><a href="">提问</a></li>--%>
                <%--<li><a href="">分享<span class="layui-badge-dot"></span></a></li>--%>
                <%--<li><a href="">讨论</a></li>--%>
                <%--<li><a href="">建议</a></li>--%>
                <%--<li><a href="">公告</a></li>--%>
                <%--<li><a href="">动态</a></li>--%>
                <%--<li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><span class="fly-mid"></span></li>--%>

                <%--<!-- 用户登入后显示 -->--%>
                <%--<li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="../user/index.html">我发表的贴</a></li>--%>
                <%--<li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="../user/index.html#collection">我收藏的贴</a></li>--%>
            <%--</ul>--%>

            <%--<div class="fly-column-right layui-hide-xs">--%>
                <%--<span class="fly-search"><i class="layui-icon"></i></span>--%>
                <%--<a href="add.html" class="layui-btn">发表新帖</a>--%>
            <%--</div>--%>
            <%--<div class="layui-hide-sm layui-show-xs-block" style="margin-top: -10px; padding-bottom: 10px; text-align: center;">--%>
                <%--<a href="add.html" class="layui-btn">发表新帖</a>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8 content detail">
            <div class="fly-panel detail-box">
                <s:iterator value="question" id="ques" status="st">
                <h1><s:property value="question[#st.index][0]" /></h1>
                <%--<div class="fly-detail-info">--%>
                    <%--<span class="fly-list-nums">--%>
                        <%--<a href="#comment"><i class="iconfont" title="回答">&#xe60c;</i> 66</a>--%>
                        <%--<i class="iconfont" title="人气">&#xe60b;</i> 99999--%>
                    <%--</span>--%>
                <%--</div>--%>

                <div class="detail-about">
                    <a class="fly-avatar" href="">
                        <img src="<%=basePath%><s:property value="question[#st.index][6]" />" alt="<s:property value="question[#st.index][4]" />">
                    </a>
                    <div class="fly-detail-user">
                        <a href="../user/home.html" class="fly-link">
                            <cite><s:property value="question[#st.index][4]" /></cite>
                            <s:if test="%{question[#st.index][5] == 0}"><i class="iconfont icon-nan"></i></s:if>
                            <s:if test="%{question[#st.index][5] == 1}"><i class="iconfont icon-nv"></i></s:if>
                        </a>
                        <span><s:property value="question[#st.index][1]" /></span>
                    </div>
                </div>

                <div class="detail-body photos">
                   <s:property value="question[#st.index][2]" />
                </div>
                </s:iterator>
            </div>

            <div class="fly-panel detail-box" id="flyReply">

                <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
                    <legend>回帖</legend>
                </fieldset>

                <ul class="jieda" id="jieda">
                    <%--第一次遍历取出父评论--%>
                    <s:iterator value="comment" status="st">
                        <s:if test="%{comment[#st.index][2] == 0}" >

                        <li data-id="111" class="jieda-daan">
                            <a name="item-1111111111"></a>
                            <div class="detail-about detail-about-reply">
                                <a class="fly-avatar" href="">
                                    <img src="<%=basePath%><s:property value="comment[#st.index][7]"/>" alt="<s:property value="comment[#st.index][5]"/>">
                                </a>
                                <div class="fly-detail-user">
                                    <a href="" class="fly-link">
                                        <cite><s:property value="comment[#st.index][5]"/></cite>
                                        <s:if test="%{comment[#st.index][6] == 0}"><i class="iconfont icon-nan"></i></s:if>
                                        <s:if test="%{comment[#st.index][6] == 1}"><i class="iconfont icon-nv"></i></s:if>
                                    </a>
                                    <s:if test="%{comment[#st.index][4] == question[0][3]}"><span>(楼主)</span></s:if>
                                </div>

                                <div class="detail-hits">
                                    <span><s:property value="comment[#st.index][3]"/></span>
                                </div>

                            </div>
                            <div class="detail-body jieda-body photos">
                                <p><s:property value="comment[#st.index][1]"/></p>
                            </div>
                            <div class="jieda-reply">
                              <%--<span class="jieda-zan zanok" type="zan">--%>
                                <%--<i class="iconfont icon-zan"></i>--%>
                                <%--<em>66</em>--%>
                              <%--</span>--%>
                                <span class="toReply" data-name="<s:property value= "comment[#st.index][5]" />" data-id="<s:property value= "comment[#st.index][0]" />">
                                    <i class="iconfont icon-svgmoban53"></i>
                                    回复
                                </span>
                            </div>
                        </li>
                        </s:if>

                            <%-- 第二次遍历找出该评论的子评论 --%>
                            <s:iterator value="comment" status="st1">
                                <s:if test="%{comment[#st1.index][2] == comment[#st.index][0]}">
                                    <li data-id="111"<s:property value="comment[#st1.index][5]"/> class="jieda-daan" style="padding:20px 70px 10px;">
                                        <a name="item-1111111111"></a>
                                        <div class="detail-about detail-about-reply">
                                            <a class="fly-avatar" href="">
                                                <img src="<%=basePath%><s:property value="comment[#st1.index][7]"/>" alt="<s:property value="comment[#st1.index][5]"/>">
                                            </a>
                                            <div class="fly-detail-user">
                                                <a href="" class="fly-link">
                                                    <cite><s:property value="comment[#st1.index][5]"/></cite>
                                                    <s:if test="%{comment[#st1.index][6] == 0}"><i class="iconfont icon-nan"></i></s:if>
                                                    <s:if test="%{comment[#st1.index][6] == 1}"><i class="iconfont icon-nv"></i></s:if>
                                                </a>
                                                <s:if test="%{comment[#st1.index][4] == question[0][3]}"><span>(楼主)</span></s:if>
                                            </div>

                                            <div class="detail-hits">
                                                <span><s:property value="comment[#st1.index][3]"/></span>
                                            </div>

                                        </div>
                                        <div class="detail-body jieda-body photos">
                                            <p><s:property value="comment[#st1.index][1]"/></p>
                                        </div>
                                        <div class="jieda-reply">
                                                <%--<span class="jieda-zan zanok" type="zan">--%>
                                                <%--<i class="iconfont icon-zan"></i>--%>
                                                <%--<em>66</em>--%>
                                                <%--</span>--%>
                                        </div>
                                    </li>
                                </s:if>
                            </s:iterator>

                    </s:iterator>

                </ul>

                <div class="layui-form layui-form-pane">
                <% if (frontUser != null){%>
                    <form method="post">
                        <div class="layui-form-item layui-form-text">
                            <a name="comment"></a>
                            <div class="layui-input-block">
                                <textarea id="content" name="content" required lay-verify="required" placeholder="请输入内容"  class="layui-textarea fly-editor" style="height: 150px;"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <input type="hidden" name="jid" value="123">
                            <button class="layui-btn" lay-filter="reply" lay-submit>提交回复</button>
                        </div>
                    </form>
                <%}else{%>
                    <div class="layui-form-item layui-form-text">
                        <a name="comment"></a>
                        <div class="layui-input-block">
                            <textarea disabled  placeholder="登陆之后才能回复!"  class="layui-textarea fly-editor" style="height: 150px;"></textarea>
                        </div>
                    </div>
                <% }%>
                </div>
            </div>
        </div>


        <div class="layui-col-md4">
            <dl class="fly-panel fly-list-one">
                <dt class="fly-panel-title">本周热议</dt>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>

                <!-- 无数据时 -->
                <!--
                <div class="fly-none">没有相关数据</div>
                -->
            </dl>

            <div class="fly-panel">
                <div class="fly-panel-title">
                    这里可作为广告区域
                </div>
                <div class="fly-panel-main">
                    <a href="http://layim.layui.com/?from=fly" target="_blank" class="fly-zanzhu" time-limit="2017.09.25-2099.01.01" style="background-color: #5FB878;">LayIM 3.0 - layui 旗舰之作</a>
                </div>
            </div>

            <div class="fly-panel" style="padding: 20px 0; text-align: center;">
                <img src="../../res/images/weixin.jpg" style="max-width: 100%;" alt="layui">
                <p style="position: relative; color: #666;">微信扫码关注 layui 公众号</p>
            </div>

        </div>
    </div>
</div>

<s:include value="../user/footer.jsp"/>


</body>
</html>

<script>

    layui.use(['element','laypage','form'], function() {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        laypage = layui.laypage;
        form = layui.form;

        // 获取本页url,匹配到=
        var question_idName = window.location.search.toString().split("=");
        // 获取问题id信息
        var question_id = question_idName[1];
        var toSomeOneId = 0;
        // @对象
        var aite="";



        // @某人的回复
        $(".toReply").on("click",function(){
            toSomeOneId = $(this).data("id");   // 获取回复的id
            var someOneName = $(this).data("name"); // 获取回复的姓名

            // 获取输入框信息
            var val = $("#cotent").val();
            if(val == undefined){
                val = "";
            }
            aite = '@'+ someOneName;
            var toSomeOne = aite + ' ' +val;
            $("#content").val(toSomeOne); // 重新加载输入框(如果之前有信息)

        });

        // 提交回复表单
        form.on('submit(reply)',function(){
           var content = $("#content").val();
           var sp = content.split(" ");
           if(aite !== ""){
               if(sp[0] !== aite){
                   layer.msg('回复信息错误!请重新选择评论信息回复,或刷新重新回复!', {time: 3000, icon: 2});
                   return false;
               }
           }

            layer.confirm('确认回复？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.ajax({
                    url: "<%=path%>/front/frontQuestion_questionReply.action",
                    type: "POST",
                    data: {"qaComment.content":content,"qaComment.pid":parseInt(toSomeOneId),"qaComment.questionId":question_id},
                    success: function (data2) {
                        if (data2 == "1") {
                            layer.msg("回复成功!", {time: 1000, icon: 1}, function () {location.reload()});
                        } else {
                            layer.msg("回复失败!", {time: 1000, icon: 2});
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

