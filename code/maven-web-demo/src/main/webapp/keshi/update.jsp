<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="../img/mm.png" />
    <title>教务管理系统</title>
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
                <li><a href="<%=request.getContextPath() %>/stu/student1.action">学生信息</a></li>
                <li><a href="<%=request.getContextPath() %>/teacherInfo/getList1.action">教师信息</a></li>
                <li><a href="<%=request.getContextPath() %>/pay/payment1.action">缴费记录</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getList1.action">课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/ksclass.action">收支明细</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/arr.action">欠费学员</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/jisuan.action">教师工资</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getTeacherKeshiList.action">教师课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/teacher.action">用户管理</a></li>
                <li><a href="<%=request.getContextPath() %>/pdf/云合教务管理系统_使用说明.rar">使用说明</a></li>
                <li><a href="<%=request.getContextPath() %>/pdf/app-debug.apk">下载app</a></li>
                <li><a href="<%=request.getContextPath() %>/pdf/教务管理系统（20231012）.xlsm">下载表格</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>课时统计 >> 修改课时明细</span>
        </div>
        <div class="providerAdd">
            <form action="<%=request.getContextPath() %>/keshi/upd.action">
                <div>
                    <input type="text" readonly="readonly" name="id" id="id" hidden="hidden" value="${keshidetail.id}" />
                </div>

                <div>
                    <label for="riqi">日期：</label>
                    <input type="date" id="riqi" name="riqi" value="${keshidetail.riqi}"/>
                </div>
                <div>
                    <label for="student_name">学生姓名：</label>
                    <input type="text" name="student_name" id="student_name" value="${keshidetail.student_name}"/>
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
                    <label for="jine">课时金额：</label>
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
<script>
    function shujv() {
        alert($('#rongliang').val());
        return false;
    }
    setTimeout(function(){
        var link = document.querySelector('.list a[href*="keshi"]');
        if (link) {
            link.style.background = 'linear-gradient(135deg, #003366, #002244)';
            link.style.color = 'white';
            link.style.transform = 'translateY(-3px)';
            link.style.boxShadow = '0 4px 8px rgba(0, 0, 0, 0.2)';
        }
    }, 100);
</script>
</html>