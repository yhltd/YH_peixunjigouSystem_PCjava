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
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>培训管理系统</h1>

    <div class="publicHeaderR">
        <p><span id="hours"></span><span style="color: #fff21b">${GLOBAL_USER.realName} </span> , 欢迎你！</p>
        <a href="<%=request.getContextPath() %>/login.jsp">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
    <a href="#" style="color: red">${msg}</a>
</section>
<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="<%=request.getContextPath() %>/main.jsp">主页</a></li>
                <%--原有代码     <li><a href="<%=request.getContextPath() %>/tea/teacher.action">设置</a></li>--%>
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
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>课时统计记表</span>
        </div>
        <%--    <div class="search">
               <span>学生姓名：</span>
               <form action="<%=request.getContextPath()%>/stu/student.action"
               method="post" id="myForm"></form>
               <input type="text" placeholder="请输入学生姓名" name="realName" form="myForm"/>
               <input type="submit" value="查询" form="myForm"/>
               <a href="<%=request.getContextPath()%>/stu/add.jsp">添加学生</a>
           </div> --%>
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">学生姓名</th>
                <th width="10%">欠费金额</th>
                <th width="10%">报名时间</th>
                <th width="10%">培训课程</th>
                <th width="10%">责任教师</th>
                <th width="10%">班级</th>
                <th width="10%">电话</th>
                <th width="10%">剩余课时</th>
            </tr>
            <c:forEach items="${arrlist }" var="s">
                <tr>
                    <td>${s.realName}</td>
                    <td>${s.nocost}</td>
                    <td>${s.rgdate}</td>
                    <td>${s.course}</td>
                    <td>${s.teacher}</td>
                    <td>${s.classnum}</td>
                    <td>${s.phone}</td>
                    <td>${s.nohour}</td>
                </tr>
            </c:forEach>
        </table>

    </div>
</section>

<%-- <!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeProv">
   <div class="removerChid">
       <h2>提示</h2>
       <div class="removeMain" >
           <p>你确定要删除该学生吗？</p>
           <a href="<%=request.getContextPath()%>/user/delete.action?id=${s.id}" id="yes">确定</a>
           <a href="#" id="no">取消</a>
       </div>
   </div>
</div> --%>


<footer class="footer">
</footer>

<script src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script src="<%=request.getContextPath() %>/js/js.js"></script>
<script src="<%=request.getContextPath() %>/js/time.js"></script>

</body>
</html>