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
                <li><a href="<%=request.getContextPath() %>/te/shezhi.action">设置</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/student.jsp">学生信息</a></li>
                <li><a href="<%=request.getContextPath() %>/pay/payment.jsp">缴费记录</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getList.action">课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/ksclass.action">收支明细</a></li>
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
            <span>学生信息登记表 >> 修改课时明细</span>
        </div>
        <div class="providerAdd">
            <form action="<%=request.getContextPath() %>/keshi/upd.action">
                <div>
                    <input type="text" name="id" id="id" hidden="hidden" value="${keshidetail.id}" />
                </div>
                <div>
                    <label for="student_name">学生姓名：</label>
                    <input type="text" name="student_name" id="student_name" value="${keshidetail.student_name}"/>
                </div>
                <div>
                    <label for="riqi">日期：</label>
                    <input type="date" id="riqi" name="riqi" value="${keshidetail.riqi}"/>
                </div>
                <div>
                    <label for="course">培训课程：</label>
                    <select name="course" id="course" style="width: 270px">
                        <option selected="selected">${keshidetail.course}</option>
                        <c:forEach items="${shezhiList}" var="shezhi">
                            <option>${shezhi.course}</option>
                        </c:forEach>
                    </select>
                </div>
                <div>
                    <label for="keshi">课时：</label>
                    <input type="number" name="keshi" id="keshi" value="${keshidetail.keshi}"/>
                </div>
                <div>
                    <label for="teacher_name">责任老师：</label>
                    <select name="teacher_name" id="teacher_name" style="width: 270px">
                        <option selected="selected">${keshidetail.teacher_name}</option>
                        <c:forEach items="${shezhiList}" var="shezhi">
                            <option>${shezhi.teacher}</option>
                        </c:forEach>
                    </select>
                </div>
                <div>
                    <label for="jine">课时：</label>
                    <input type="number" name="jine" id="jine" value="${keshidetail.jine}"/>
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