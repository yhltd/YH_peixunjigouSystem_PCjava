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
            <span>权限管理 >> 权限管理增加页面</span>
        </div>
        <div class="providerAdd">
            <form action="<%=request.getContextPath() %>/power/add.action">
                <div>
                    <label for="t_id">姓名：</label>
                    <select name="t_id" id="t_id" style="width: 270px">
                        <c:forEach items="${tea}" var="tea">
                            <option value="${tea.id }">${tea.realName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div>
                    <label for="view_name">页面名称：</label>
                    <select name="view_name" id="view_name" style="width: 270px">
                        <option>学生信息</option>
                        <option>教师信息</option>
                        <option>缴费记录</option>
                        <option>课时统计</option>
                        <option>收支明细</option>
                        <option>欠费学员</option>
                        <option>教师工资</option>
                        <option>教师课时统计</option>
                        <option>考勤表</option>
                        <option>教师课表</option>
                        <option>用户管理</option>
                        <option>权限管理</option>
                    </select>
                </div>
                <div>
                    <label for="add">增：</label>
                    <select name="add" id="add" style="width: 270px">
                        <option></option>
                        <option>√</option>
                    </select>
                </div>
                <div>
                    <label for="del">删：</label>
                    <select name="del" id="del" style="width: 270px">
                        <option></option>
                        <option>√</option>
                    </select>
                </div>
                <div>
                    <label for="upd">改：</label>
                    <select name="upd" id="upd" style="width: 270px">
                        <option></option>
                        <option>√</option>
                    </select>
                </div>
                <div>
                    <label for="sel">查：</label>
                    <select name="sel" id="sel" style="width: 270px">
                        <option></option>
                        <option>√</option>
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