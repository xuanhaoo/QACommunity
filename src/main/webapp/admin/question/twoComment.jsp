<%--
  Created by IntelliJ IDEA.
  User: Mr.liang
  Date: 2017/12/24
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <title>二级评论</title>
    <link type="text/css" href="<%=basePath %>/static/plugins/layui/css/layui.css" rel="stylesheet" />
    <link type="text/css" href="<%=basePath %>/static/plugins/css/semantic.min.css" rel="stylesheet" />
    <link type="text/css" href="<%=basePath %>/static/plugins/css/font-awesome.min.css" rel="stylesheet" />
    <style>

        .ui.comments .comment .avatar img, .ui.comments .comment img.avatar {
            height:auto;
        }
        .comment_html_style {
            margin-top:5px;
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
<div class="comment_html_style">
    <div class="comment_box ui comments " id="comment_html"><h3 class="ui dividing header">评论</h3>
        <s:iterator value="qaTwoComment.two_list" var="cc">
            <div class="comment">
                <a class="avatar">
                    <img src="../static/images/elliot.jpg"></a>
                <div class="content">
                    <a class="author"><s:property value="#cc.accountName"/></a>
                    <div class="metadata">
                        <span class="date"><s:date name="#cc.createDate" format="yyyy/MM/dd HH:mm:ss" /></span>
                    </div>
                    <div class="text text_style"><s:property value="#cc.content"/></div>
                    <div class="metadata tool_comment">
                        <div class="rating"><i class="fa fa-thumbs-o-up"><s:property value="#cc.likes"/></i></div>
                        <a class="reply deleteTwo" data-id="<s:property value="#cc.commId"/>"><i class="fa fa-trash-o"></i>删除</a>
                    </div>
                </div>
            </div>
            <div class="ui section divider"></div>
        </s:iterator>
    </div>
</div>

</body>
<script src="<%=basePath %>/static/plugins/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/plugins/layui/layui.js"></script>
<script>
    layui.use(['layer'], function() {

        var layer = layui.layer;


        $(document).on('click', '.deleteTwo', function() {
            var commId = $(this).data("id");
            layer.confirm('确定删除该条评论吗？', {
                icon:3,
                btn: ['确定删除', '我在想想']
            },function() {
                $.ajax({
                    url: "<%=path%>/admin/qaBackQues_deleteComment.action",
                    type: 'POST',
                    dataType: 'json',
                    data: {'cId': commId},
                    error: function(request){
                        layer.msg("请求服务器超时", {time: 1000, icon: 5});
                    },
                    success: function(data){
                        if (data.status = "0"){
                            layer.msg("删除成功！",{time: 1000,icon: 1}, function(){
                                var index = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(index);
                            });
                        }else{
                            layer.msg('删除失败！', {time: 1000,icon: 2});
                        }
                    }
                });
            });
        });
    });
</script>
</html>
