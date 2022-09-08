<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="../img/mm.png" />
    <title>教务管理系统</title>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/public.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css"/>

</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>教务管理系统</h1>

    <div class="publicHeaderR">
        <p><span id="hours"></span><span style="color: #fff21b">${GLOBAL_USER.realName} </span> , 欢迎你！</p>
        <input hidden="hidden" id="rongliang" value="${rongliang }"/>
        <a onclick="shujv()" style="width:80px">数据空间</a>
        <a href="<%=request.getContextPath() %>/login.jsp" style="width:80px">退出</a>
    </div>
    <a href="<%=request.getContextPath() %>/tea/teacher.action"><img src="../img/yyh.png" style="width: 32px;height: 32px;float:right;margin-top: 8px;"></a>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time"></span>
    <span style="color:red">${msg}</span>
</section>
<!--主体内容-->
<section class="publicMian ">
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
                <li><a href="<%=request.getContextPath() %>/pdf/云合培训管理系统_PC.pdf">帮助</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>教师课表 >> 教师课表修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="<%=request.getContextPath() %>/course/update.action">
                <div>
                    <label for="id">序号：</label>
                    <input type="text" readonly="readonly" name="id" id="id" value="${course.id}" readonly="readonly"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="teacher">教师姓名：</label>
                    <input type="text" name="teacher" id="teacher" value="${course.teacher }"/>
                </div>
                <div>
                    <label  for="course">课程：</label>
                    <input type="text" name="course" id="course" value="${course.course }"/>
                </div>
                <div>
                    <label for="riqi">日期：</label>
                    <input type="date" name="riqi" id="riqi" value="${course.riqi }"/>
                </div>
                <div>
                    <label for="xingqi">星期：</label>
                    <input hidden="hidden" id="xingqi2" value="${course.xingqi }"/>
                    <select name="xingqi" id="xingqi" style="width: 270px">
                        <option selected>星期一</option>
                        <option>星期二</option>
                        <option>星期三</option>
                        <option>星期四</option>
                        <option>星期五</option>
                        <option>星期六</option>
                        <option>星期天</option>
                    </select>
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
<script type="text/javascript">
    window.onload=function(){
        var xingqi=$("#xingqi2").val();

        $("#xingqi").val(xingqi);
    };

    function shujv() {
        alert($('#rongliang').val());
        return false;
    }
</script>
</html>