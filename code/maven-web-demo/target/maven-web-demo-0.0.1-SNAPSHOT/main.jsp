<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>培训管理系统</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/public.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/min.css"/>

</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>培训管理系统</h1>

    <div class="publicHeaderR">
        <p><span id="hours"></span><span style="color: #fff21b">${GLOBAL_USER.realName} </span> , 欢迎你！</p>
        <a href="login.jsp">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time"></span>
    <a href="#" style="color: red">${msg}</a>
</section>
<!--主体内容-->
<section class="publicMian">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="<%=request.getContextPath() %>/main.jsp">主页</a></li>
                <li><a href="<%=request.getContextPath() %>/te/shezhi.action">设置</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/student.jsp">学生信息</a></li>
                <li><a href="<%=request.getContextPath() %>/pay/payment.jsp">缴费记录</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getList.action">课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/inc/income.action">收支明细</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/arr.action">欠费学生</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/inq.jsp">学生查询</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getTeacherKeshiList.action">教师课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/teacher.action">用户管理</a></li>
                <li><a href="<%=request.getContextPath() %>/help.jsp">帮助</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="wFont">
            <div id="min3">
                <span><a href="<%=request.getContextPath() %>/stu/student.jsp">学生信息</a></span>
                <span><a href="<%=request.getContextPath() %>/pay/payment.jsp">缴费记录</a></span>
                <span><a href="<%=request.getContextPath() %>/keshi/getList.action">课时统计</a></span>
                <span><a href="<%=request.getContextPath() %>/inc/income.action">收支明细</a></span>
                <span><a href="<%=request.getContextPath() %>/stu/arr.action">欠费学生</a></span>
                <span><a href="<%=request.getContextPath() %>/stu/inq.jsp">学生查询</a></span>
                <span><a href="<%=request.getContextPath() %>/te/shezhi.action">自定义参数</a></span>
                <span><a href="<%=request.getContextPath() %>/help.jsp">使用帮助</a></span>
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
</html>