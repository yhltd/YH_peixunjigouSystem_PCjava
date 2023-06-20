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
                <%--原有代码     <li><a href="<%=request.getContextPath() %>/tea/teacher.action">设置</a></li>--%>
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
                <li><a href="<%=request.getContextPath() %>/pdf/云合教务管理系统_使用说明.rar">帮助</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>学生信息 >> 学生信息修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="<%=request.getContextPath() %>/stu/update.action">
                <div>
                    <label for="id">序号：</label>
                    <input type="text" readonly="readonly" name="id" id="id" value="${student.id}" readonly="readonly"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="realName">学生姓名：</label>
                    <input type="text" name="realName" id="realName" value="${student.realName }"/>
                    <span >*</span>
                </div>
                <div>
                    <label  for="sex">学生性别：</label>
                    <input hidden="hidden" id="sex2" value="${student.sex }"/>
                    <select name="sex" id="sex" style="width: 270px">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                    <span >*</span>
                </div>
                <div>
                    <label for="rgdate">报名时间：</label>
                    <%--      原有代码    <input type="text" name="rgdate" id="rgdate" value="${student.rgdate }"/>--%>
                    <input type="date" name="rgdate" id="rgdate" value="${student.rgdate }"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="course">培训课程：</label>
                    <input hidden="hidden" id="course2" value="${student.course }"/>
                    <select name="course" id="course" style="width: 270px">
                        <c:forEach items="${shezhiList}" var="shezhi">
                            <option>${shezhi.course}</option>
                        </c:forEach>
                    </select>
                    <span >*</span>
                </div>
                <div>
                    <label for="teacher">责任老师：</label>
                    <input hidden="hidden" id="teacher2" value="${student.teacher }"/>
                    <select name="teacher" id="teacher" style="width: 270px">
                        <c:forEach items="${shezhiList}" var="shezhi">
                            <option>${shezhi.teacher}</option>
                        </c:forEach>
                    </select>
                    <span >*</span>
                </div>
                <div>
                    <label for="classnum">班级：</label>
                    <input type="text" name="classnum" id="classnum" value="${student.classnum }"/>
                </div>
                <div>
                    <label for="phone">电话：</label>
                    <input type="text" name="phone" id="phone" value="${student.phone }"/>
                </div>
                <div>
                    <label for="fee">学费：</label>
                    <input type="number" name="fee" id="fee" value="${student.fee }"/>
                </div>


                <div>
                    <label for="allHour">总课时：</label>
                    <input type="text" name="allHour" id="allHour" value="${student.allHour }"/>
                </div>
                <div>
                    <label for="type">状态：</label>
                    <input hidden="hidden" id="type2" value="${student.type }"/>
                    <select name="type" id="type" style="width: 270px">
                        <c:forEach items="${shezhiList}" var="shezhi">
                            <option>${shezhi.type}</option>
                        </c:forEach>
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
        var sex2=$("#sex2").val();
        var course2=$("#course2").val();
        var teacher2=$("#teacher2").val();
        var type2=$("#type2").val();

        $("#sex").val(sex2);
        $("#course").val(course2);
        $("#teacher").val(teacher2);
        $("#type").val(type2);
    }

    function shujv() {
        alert($('#rongliang').val());
        return false;
    }
</script>
</html>