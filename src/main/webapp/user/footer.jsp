<%--
  Created by IntelliJ IDEA.
  User: pjy
  Date: 18-1-1
  Time: 下午1:27
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<div class="fly-footer">
    <p><a href="http://fly.layui.com/" target="_blank">QA问答社区</a> 2017 &copy; <a href="http://www.layui.com/" target="_blank">CUIT 出品</a></p>
</div>
<script src="<%=basePath %>/static/plugins/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/plugins/layui/layui.js"></script>
<script>
    layui.use(['element','laypage','form'], function() {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        laypage = layui.laypage;
        form = layui.form;

        laypage.render({
            elem: 'laypage' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: 50 //数据总数，从服务端得到
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