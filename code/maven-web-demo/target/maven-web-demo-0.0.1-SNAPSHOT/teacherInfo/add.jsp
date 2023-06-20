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
            <span>教师信息 >> 教师信息增加页面</span>
        </div>
        <div class="providerAdd">
            <form action="<%=request.getContextPath() %>/teacherInfo/add.action">
                <div>
                    <label for="t_name">教师姓名：</label>
<%--                    <input type="text" name="t_name" id="t_name" value="${teacherInfo.t_name }"/>--%>
                    <select name="t_name" id="t_name" style="width: 270px">
                        <c:forEach items="${shezhi}" var="shezhi">
                            <option>${shezhi.teacher}</option>
                        </c:forEach>
                    </select>
                </div>
                <div>
                    <label  for="sex">性别：</label>
                    <select name="sex" id="sex" style="width: 270px">
                        <option >男</option>
                        <option selected>女</option>
                    </select>
                </div>
                <div>
                    <label for="id_code">身份证号：</label>
                    <input type="text" name="id_code" id="id_code" value="${teacherInfo.id_code }"/>
                </div>
                <div>
                    <label for="minzu">民族：</label>
                    <input type="text" name="minzu" id="minzu" value="${teacherInfo.minzu }"/>
                </div>
                <div>
                    <label for="birthday">生日：</label>
                    <input type="date" name="birthday" id="birthday" value="${teacherInfo.birthday }"/>
                </div>
                <div>
                    <label for="post">职位：</label>
                    <input type="text" name="post" id="post" value="${teacherInfo.post }"/>
                </div>
                <div>
                    <label for="education">学历：</label>
                    <input type="text" name="education" id="education" value="${teacherInfo.education }"/>
                </div>
                <div>
                    <label for="phone">联系电话：</label>
                    <input type="text" name="phone" id="phone" value="${teacherInfo.phone }"/>
                </div>
                <div>
                    <label for="rz_riqi">入职日期：</label>
                    <input type="date" name="rz_riqi" id="rz_riqi" value="${teacherInfo.rz_riqi }"/>
                </div>
                <div>
                    <label for="state">在职状态：</label>
<%--                    <input type="text" name="state" id="state" value="${teacherInfo.state }"/>--%>
                    <select name="state" id="state" style="width: 270px">
                        <option>在职</option>
                        <option>离职</option>
                    </select>
                </div>
                <div>
                    <label for="shebao">社保情况：</label>
                    <input type="text" name="shebao" id="shebao" value="${teacherInfo.shebao }"/>
                </div>
                <div>
                    <label for="address">家庭住址：</label>
                    <input type="text" name="address" id="address" value="${teacherInfo.address }"/>
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