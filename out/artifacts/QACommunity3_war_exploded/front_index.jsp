<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: Mr.liang
  Date: 2017/12/28
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%
    Map frontUser = (Map) session.getAttribute("frontUser");
%>
<%--<s:iterator value="quesList.quesLists" var="qq">--%>
    <%--<s:property value="#qq.quesTitle"></s:property>--%>
    <%--<br>--%>
<%--</s:iterator>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>QA问答社区</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="QA问答社区">
    <link rel="stylesheet" href="<%=basePath %>/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/global.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/front_index.css">
</head>
<body>
<%--header部分--%>
<div class="fly-header layui-bg-cyan">
    <div class="layui-container">
        <a class="fly-logo" href="/">
            <img src="<%=basePath %>/static/images/logo.png" alt="layui">
        </a>
        <ul class="layui-nav fly-nav layui-hide-xs">
            <li class="layui-nav-item">
                <a href="<%=basePath %>/index.jsp"><i class="iconfont icon-shouye"></i>首页</a>
            </li>
            <li class="layui-nav-item  layui-this">
                <a href="<%=basePath %>/front/frontIndex_getQuestionIndex?page=1&orderType=1"><i class="iconfont icon-wenda"></i>问题</a>
            </li>
            <li class="layui-nav-item">
                <a href="<%=basePath %>/front/frontIndex_topicIndex"><i class="iconfont icon-iconmingxinganli"></i>话题</a>
            </li>
        </ul>

        <ul class="layui-nav fly-nav-user">

            <% if(frontUser != null){ %>
                <!-- 登入的状态 -->
            <li class="layui-nav-item">
                <a class="fly-nav-avatar" href="javascript:;">
                    <cite class="layui-hide-xs"><%=frontUser.get("name")%></cite>
                    <img src="<%=basePath%>/<%=frontUser.get("photo")%>">
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="<%=basePath %>/frontUser/FrontUser_userSet.action"><i class="layui-icon">&#xe620;</i>基本设置</a></dd>
                    <dd><a href="<%=basePath %>/frontUser/FrontUser_userHome.action"><i class="layui-icon" style="margin-left: 2px; font-size: 22px;">&#xe68e;</i>我的主页</a></dd>
                    <hr style="margin: 5px 0;">
                    <dd id="logout"><a style="text-align: center;">退出</a></dd>
                </dl>
            </li>
            <% }else { %>
            <!-- 未登入的状态 -->
            <li class="layui-nav-item">
                <a class="iconfont icon-touxiang layui-hide-xs" href="<%=path %>/frontUser/FrontUser_UserLogin.action"></a>
            </li>
            <li class="layui-nav-item">
                <a href="<%=path %>/frontUser/FrontUser_UserLogin.action" class="layui-btn layui-btn-sm login-btn" style="background: #5dade2; color:#fff;">登录</a>
            </li>
            <li class="layui-nav-item">
                <a href="<%=path %>/frontUser/FrontUser_registerUser.action" class="layui-btn  layui-btn-sm regist-btn" style="margin-left: 9px;background: #1abc9c;color:#fff;">注册</a>
            </li>
            <li class="layui-nav-item layui-hide-xs">
                <a href="#" onclick="layer.msg('还未获得腾讯许可', {icon:16, shade: 0.1, time:0})" title="QQ登入" class="iconfont icon-qq"></a>
            </li>
            <li class="layui-nav-item layui-hide-xs">
                <a href="#" onclick="layer.msg('还未获得新浪许可', {icon:16, shade: 0.1, time:0})" title="微博登入" class="iconfont icon-weibo"></a>
            </li>
            <% } %>
        </ul>
    </div>
</div>
<%--header结束--%>

<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">

            <div class="fly-panel" style="margin-bottom: 0;">

                <div class="fly-panel-title fly-filter">
                   <i class="layui-icon">&#xe68e;</i>&nbsp;发现
                    <%--<span class="fly-mid"></span>--%>
                    <%--<a href="">未结</a>--%>
                    <%--<span class="fly-mid"></span>--%>
                    <%--<a href="">已结</a>--%>
                    <%--<span class="fly-mid"></span>--%>
                    <%--<a href="">精华</a>--%>
                    <span class="fly-filter-right layui-hide-xs">
                        <a href="javascript:;" class="layui-this" id="byNew">按最新</a>
                        <span class="fly-mid"></span>
                        <a href="javascript:;" id="byHot" class="">按热议</a>
                    </span>
                </div>
                <%--问题循环开始--%>
                <ul class="fly-list">
                    <%--问题循环--%>
                      <s:iterator value="quesList.quesLists" var="qq">
                          <li>
                              <a href="user/home.html" class="fly-avatar">
                                  <img src="<%=basePath %>/<s:property value="#qq.headPhoto" />" alt="">
                              </a>
                              <h2>
                                  <a class="layui-badge"><s:property value="#qq.topicName"></s:property></a>
                                  <a href="javascript:;" class="quesDetail" data-id="<s:property value="#qq.quesId"></s:property>"><s:property value="#qq.quesTitle"></s:property></a>
                              </h2>
                              <div class="fly-list-info">
                                  <a href="user/home.html" link>
                                      <cite><s:property value="#qq.accountName"></s:property></cite>
                                  </a>
                                  <span><s:date name="#qq.createDate" format="yyyy年MM月dd日 hh:mm:ss"></s:date></span>

                                  <span class="fly-list-nums">
                                      <i class="iconfont" title="浏览">&#xe60b;</i><s:property value="#qq.browseCount"></s:property>
                                      <i class="iconfont icon-pinglun1" title="回复"></i><s:property value="#qq.commentCount"></s:property>
                                  </span>
                              </div>
                              <div class="fly-list-badge">
                                  <!--<span class="layui-badge layui-bg-red">精帖</span>-->
                              </div>
                          </li>
                      </s:iterator>

                </ul>
                <div style="text-align: center">
                    <div class="" id="pages">

                    </div>
                </div>

            </div>

            <%--问题循环结束--%>
        </div>

        <%--以下做demo数据--%>
        <div class="layui-col-md4">

            <div class="fly-panel">
                <h3 class="fly-panel-title">温馨通道</h3>
                <ul class="fly-panel-main fly-list-static">
                    <li>
                        <a href="http://fly.layui.com/jie/4281/" target="_blank">layui 的 GitHub 及 Gitee (码云) 仓库，欢迎Star</a>
                    </li>
                    <li>
                        <a href="http://fly.layui.com/jie/5366/" target="_blank">
                            layui 常见问题的处理和实用干货集锦
                        </a>
                    </li>
                    <li>
                        <a href="http://fly.layui.com/jie/4281/" target="_blank">Lavel问答知道</a>
                    </li>
                    <li>
                        <a href="http://fly.layui.com/jie/5366/" target="_blank">
                            Laravel社区，中文网官方社区
                        </a>
                    </li>
                    <li>
                        <a href="http://fly.layui.com/jie/4281/" target="_blank">知乎，你的问题专家</a>
                    </li>
                </ul>
            </div>


            <div class="fly-panel fly-signin">
                <div class="fly-panel-title">
                    签到
                    <i class="fly-mid"></i>
                    <a href="javascript:;" class="fly-link" id="LAY_signinHelp">说明</a>
                    <i class="fly-mid"></i>
                    <a href="javascript:;" class="fly-link" id="LAY_signinTop">活跃榜<span class="layui-badge-dot"></span></a>
                    <span class="fly-signin-days">已连续签到<cite>16</cite>天</span>
                </div>
                <div class="fly-panel-main fly-signin-main">
                    <button class="layui-btn layui-btn-danger" id="LAY_signin" style="border-radius: 5px;">今日签到</button>
                    <span>可获得<cite>5</cite>声望</span>

                    <!-- 已签到状态 -->
                    <!--
                    <button class="layui-btn layui-btn-disabled">今日已签到</button>
                    <span>获得了<cite>20</cite>飞吻</span>
                    -->
                </div>
            </div>

            <div class="fly-panel fly-rank fly-rank-reply" id="LAY_replyRank">
                <h3 class="fly-panel-title">回贴周榜</h3>
                <dl>
                    <!--<i class="layui-icon fly-loading">&#xe63d;</i>-->
                    <dd>
                        <a href="">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                    <dd>
                        <a href="">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                    <dd>
                        <a href="">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                    <dd>
                        <a href="">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                </dl>
            </div>
            <div class="fly-panel">
                <div class="fly-panel-title">
                    推荐
                </div>
                <div class="fly-panel-main">
                    <a href="http://layim.layui.com/?from=fly" target="_blank" class="fly-zanzhu" time-limit="2017.09.25-2099.01.01" style="background-color: #5FB878;">QAIM 3.0 - QA 旗舰之作</a>
                </div>
            </div>

            <div class="fly-panel fly-link">
                <h3 class="fly-panel-title">友情链接</h3>
                <dl class="fly-panel-main">
                    <dd><a href="http://www.layui.com/" target="_blank">layui</a><dd>
                    <dd><a href="http://layim.layui.com/" target="_blank">WebIM</a><dd>
                    <dd><a href="http://layer.layui.com/" target="_blank">layer</a><dd>
                    <dd><a href="http://www.layui.com/laydate/" target="_blank">layDate</a><dd>
                </dl>
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
    layui.use(['laydate','laypage','laytpl','layer','element'], function() {
        var laypage = layui.laypage;
        var laydate = layui.laydate;
        var laytpl = layui.laytpl;
        var layer = layui.layer;
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块


        var orderCode = "<s:property value="quesList.orderType" />";   //定义排序代号

        $("#byNew").on('click', function() {
            orderCode = 1;
            window.location.href = "<%=basePath %>/front/frontIndex_getQuestionIndex?page=1&orderType="+orderCode;
        });
        $("#byHot").on('click', function() {

            orderCode = 2;
            window.location.href = "<%=basePath %>/front/frontIndex_getQuestionIndex?page=1&orderType="+orderCode;
        });
        var counts = "<s:property value="quesList.count" />";
        var curr = "<s:property value="quesList.page" />";
        //执行一个laypage实例
        laypage.render({
            elem: 'pages' //注意，这里的是 ID，不用加 # 号
            ,count: counts //数据总数，从服务端得到
            ,limit: 15
            ,curr: curr
            ,group:6
            ,theme: '#1E9FFF'
            ,curr: curr
            ,jump: function(obj, first) {
                var curr = obj.curr;
                if(!first) {
                    window.location.href = "<%=basePath %>/front/frontIndex_getQuestionIndex?page="+curr+"&orderType="+orderCode;
                }
            }
        });

        $(".quesDetail").on('click', function() {
            var quesId = $(this).data("id");
            window.location.href = "<%=basePath %>/front/frontIndex_getTheQuestion?quesId="+quesId;
        });

        $("#logout").on("click",function(){
            layer.confirm('确认退出？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.ajax({
                    url: "<%=path%>/frontUser/FrontUser_userLogout.action",
                    type: "POST",
                    success: function (data2) {
                        if (data2 === "1") {
                            layer.msg("退出成功!", {time: 1000, icon: 1}, function () {location.reload();});
                        } else {
                            layer.msg("退出失败!", {time: 1000, icon: 2},function () {location.reload();});
                        }
                    },
                    error: function () {
                        layer.msg('请求服务器超时', {time: 1000, icon: 2},function () {location.reload();});
                    }
                });
            });
        });
    });
</script>

<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>

</body>
</html>
