<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="img/mm.png" />
    <title>教务管理系统</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/public.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <canvas id="particleCanvas"></canvas>
    <h1>教务管理系统</h1>
    <div class="publicHeaderR">
        <p style="font-size:13px"><span id="hours"></span><span style="color: #fff21b;">${GLOBAL_USER.realName} </span> , 欢迎你！</p>
        <input hidden="hidden" id="rongliang" value="${rongliang }"/>
        <a class="btn-3d" href="<%=request.getContextPath() %>/pdf/app-debug.apk">下载app</a>
        <a class="btn-3d" href="<%=request.getContextPath() %>/pdf/教务管理系统（20230618）.xlsm">下载表格</a>
        <a class="btn-3d" onclick="shujv()" style="width:80px">数据空间</a>
        <a class="btn-3d" href="<%=request.getContextPath() %>/login.jsp" style="width:80px">退出</a>
    </div>
<%--    <a href="<%=request.getContextPath() %>/tea/teacher.action"><img src="img/yyh.png" style="width: 32px;height: 32px;float:right;margin-top: 8px;"></a>--%>
</header>
<!--时间-->
<%--<section class="publicTime">--%>
<%--    <span id="time"></span>--%>
<%--    <a href="#" style="color: red">${msg}</a>--%>
<%--</section>--%>
<!--主体内容-->
<section class="publicMian">
    <div class="left-bg">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="<%=request.getContextPath() %>/main.jsp">主页</a></li>
                <li><a href="<%=request.getContextPath() %>/te/shezhi.action">设置</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/student1.action">学生信息</a></li>
                <li><a href="<%=request.getContextPath() %>/teacherInfo/getList1.action">教师信息</a></li>
                <li><a href="<%=request.getContextPath() %>/pay/payment1.action">缴费记录</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getList1.action">课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/inc/income.action">收支明细</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/arr.action">欠费学员</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/jisuan.jsp">教师工资</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getTeacherKeshiList.action">教师课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/teacher.action">用户管理</a></li>
                <li><a href="<%=request.getContextPath() %>/pdf/云合教务管理系统_使用说明.rar">使用说明</a></li>
            </ul>
        </nav>
    </div>
    </div>
    <div class="right" style="background: url(https://gips1.baidu.com/it/u=234355050,149471300&fm=3086&app=3086&f=JPEG&wm=1,baiduai3,0,0,13,9&wmo=5,5&w=1024&h=1024); background-size: cover">
        <div class="wFont">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>主页</span>
                <span id="time"></span>
                <div title="学生信息页面可以对学生基本信息进行操作，已上课时和已缴费会根据后面页面的数据自动计算" style="color: red">*</div>
            </div>
            <div id="min3">
                <p style="color: #00ccef;text-shadow: 1px 1px #414040;">${qianfei}</p>
                <span  style="display: inline-block; position: relative;">
    <a href="<%=request.getContextPath() %>/stu/student1.action" class="circle-link" style="display: block;">学生信息</a>
</span>
                <span style="display: inline-block; position: relative;">
    <a href="<%=request.getContextPath() %>/teacherInfo/getList1.action" class="circle-link" style="display: block;">教师信息</a>
</span>


                <span style="display: inline-block; position: relative;">
                    <a href="<%=request.getContextPath() %>/pay/payment.action" class="circle-link" style="display: block;">缴费记录</a>
                </span>
                <span style="display: inline-block; position: relative;">
                    <a href="<%=request.getContextPath() %>/keshi/getList1.action" class="circle-link" style="display: block;">课时统计</a>
                </span>
                <br>

                <span style="display: inline-block; position: relative;">
                    <a href="<%=request.getContextPath() %>/inc/income.action" class="circle-link" style="display: block;">收支明细</a>
                </span>
                <span style="display: inline-block; position: relative;">
                    <a href="<%=request.getContextPath() %>/stu/arr.action" class="circle-link" style="display: block; ">欠费学员</a>
                </span>


                <span style="display: inline-block; position: relative;">
                    <a href="<%=request.getContextPath() %>/tea/jisuan.jsp" class="circle-link" style="display: block; ">教师工资</a>
                </span>
                <span style="display: inline-block; position: relative;">
                    <a href="<%=request.getContextPath() %>/te/shezhi.action" class="circle-link" style="display: block; ">自定义参数</a>
                </span>
            </div>
        </div>
    </div>
</section>

<footer class="footer">
</footer>
<script src="<%=request.getContextPath() %>/js/time.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script src="<%=request.getContextPath() %>/js/js.js"></script>

<div style="text-align:center;">
</div>
</body>
<script>
    function shujv() {
        alert($('#rongliang').val());
        return false;
    }
</script>
</html>