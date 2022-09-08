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
                <%--原有代码     <li><a href="<%=request.getContextPath() %>/tea/teacher.action">设置</a></li>--%>
                <li><a href="<%=request.getContextPath() %>/te/shezhi.action">设置</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/student1.action">学生信息</a></li>
                <li><a href="<%=request.getContextPath() %>/teacherInfo/getList1.action">教师信息</a></li>
                <li><a href="<%=request.getContextPath() %>/pay/payment1.action">缴费记录</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getList1.action">课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/ksclass.action">收支明细</a></li>
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
            <span>学生信息 >> 学生信息增加页面</span>
        </div>
        <div class="providerAdd">
            <form action="<%=request.getContextPath() %>/stu/add.action">
                <div>
                    <label for="realName">学生姓名：</label>
                    <input type="text" name="realName" id="realName" value="${student.realName }"/>
                    <span >*</span>
                </div>
                <div>
                    <label  for="sex">学生性别：</label>
                    <select name="sex" id="sex" style="width: 270px">
                        <option >男</option>
                        <option selected>女</option>
                    </select>
                    <span >*</span>
                </div>
                <div>
                    <label for="rgdate">报名时间：</label>
                    <%--    原先代码      <input type="text" name="rgdate" id="rgdate" value="${student.rgdate }"/>--%>
                    <input type="date" id="rgdate" name="rgdate" />
                    <span >*</span>
                </div>
                <div>
                    <label for="course">培训课程：</label>
                    <%--    原有代码     <input type="text" name="course" id="course" value="${student.course }"/>--%>
                    <select name="course" id="course" style="width: 270px">
<%--                        <option > </option>--%>
<%--                        <option >作文写作</option>--%>
<%--                        <option >口才演讲</option>--%>
<%--                        <option >健身</option>--%>
<%--                        <option >跆拳道</option>--%>
<%--                        <option >吉他</option>--%>
<%--                        <option >架子鼓</option>--%>
                        <c:forEach items="${shezhiList}" var="shezhi">
                            <option>${shezhi.course}</option>
                        </c:forEach>
                    </select>
                    <span >*</span>
                </div>
                <div>
                    <label for="teacher">责任老师：</label>
                    <%--    原有代码     <input type="text" name="teacher" id="teacher" value="${student.teacher }"/>--%>
                    <select name="teacher" id="teacher" style="width: 270px">
<%--                        <option > </option>--%>
<%--                        <option >琪一</option>--%>
<%--                        <option >陈二</option>--%>
<%--                        <option >张三</option>--%>
<%--                        <option >李四</option>--%>
<%--                        <option >王五</option>--%>
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
<%--                <div>--%>
<%--                    <label for="cost">已缴费：</label>--%>
<%--                    <input type="number" name="cost" id="cost" value="${student.cost }"/>--%>
<%--                </div>--%>
<%--                <div>--%>
<%--                    <label for="hour">已上课时：</label>--%>
<%--                    <input type="text" name="hour" id="hour" value="${student.hour }"/>--%>
<%--                </div>--%>
                <div>
                    <label for="allHour">总课时：</label>
                    <input type="text" name="allHour" id="allHour" value="${student.allHour }"/>
                </div>
                <div>
                    <label for="type">状态：</label>
                    <%--    原有代码     <input type="text" name="type" id="type" value="${student.type }"/>--%>
                    <select name="type" id="type" style="width: 270px">
<%--                        <option >意向预定</option>--%>
<%--                        <option selected>在训</option>--%>
<%--                        <option >暂停</option>--%>
<%--                        <option >结束</option>--%>
<%--                        <option >退学</option>--%>
                        <c:forEach items="${shezhiList}" var="shezhi">
                            <option >${shezhi.type}</option>
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
<script>
    function shujv() {
        alert($('#rongliang').val());
        return false;
    }
</script>
</html>