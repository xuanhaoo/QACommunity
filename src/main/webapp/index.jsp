<%@ page contentType="text/html;charset=UTF-8" language="java"  import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<html>
<head>
    <title>跳转问答社区...</title>
    <link type="text/css" rel="stylesheet" href="static/css/test.css" />
    <style>
    </style>
</head>
<body>
<div class="sign">
    <p class="onep">
        Welcome to here, QA!
    </p>
    <p class="twop">
        正在跳转......
    </p>
    <div class="threep" style="margin-left: 120px;font-size: 22px;color: #bd0d13;">
        <form id="form1" runat="server">
            <div id='div1'>
            </div>
        </form>
    </div>

</div>

</body>
</html>
<script type="text/javascript">
    //设定倒数秒数
    var t = 5;
    //显示倒数秒数
    function showTime(){
        t -= 1;
        document.getElementById('div1').innerHTML= t;
        if(t==0){
            window.location.href="<%=basePath %>/front/frontIndex_getQuestionIndex?page=1&orderType=1";
        }
        //每秒执行一次,showTime()
        setTimeout("showTime()",1000);
    }
    //执行showTime()
    showTime();
</script>