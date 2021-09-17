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
    <span id="time"></span>
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
                <li><a href="<%=request.getContextPath() %>/stu/student.action">学生信息</a></li>
                <li><a href="<%=request.getContextPath() %>/pay/payment.action">缴费记录</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getList.action">课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/ksclass.action">收支明细</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/arr.action">欠费学生</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/inq1.jsp">学生查询</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getTeacherKeshiList.action">教师课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/teacher.action">用户管理</a></li>
                <li><a href="<%=request.getContextPath() %>/help.jsp">帮助</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>员工信息登记表  >> 员工信息增加页面</span>
        </div>
        <div class="providerAdd">
            <form action="<%=request.getContextPath() %>/tea/add.action">
                <div>
                    <label for="userName">登录名：</label>
                    <input type="text" name="userName" id="userName" value="${teacher.userName }"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="password">密码：</label>
                    <input type="text" name="password" id="password" value="${teacher.password }"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="realName">真实姓名：</label>
                    <input type="text" name="realName" id="realName" value="${teacher.realName }"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="useType">用户类别：</label>
                    <input type="text" name="useType" id="useType" value="${teacher.useType }"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="age">年龄：</label>
                    <input type="text" name="age" id="age" value="${teacher.age }"/>
                </div>
                <div>
                    <label for="phone">电话：</label>
                    <input type="text" name="phone" id="phone" value="${teacher.phone }"/>
                </div>
                <div>
                    <label for="home">家庭住址：</label>
                    <input type="text" name="home" id="home" value="${teacher.home }"/>
                </div>
                <div>
                    <label for="photo">身份证号：</label>
                    <input type="text" name="photo" id="photo" value="${teacher.photo }"/>
                </div>
                <div>
                    <label for="education">学历：</label>
                    <input type="text" name="education" id="education" value="${teacher.education }"/>
                </div>
                <div class="providerAddBtn">
                    <input type="submit" value="保存" onclick="history.back(-1)"/>
                    <input type="button" value="返回" onclick="history.back(-1)"/>
                </div>
            </form>
        </div>

    </div>
</section>
<footer class="footer">
</footer>
<script src="<%=request.getContextPath() %>/js/time.js"></script>

</body>
</html>