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
        <a href="<%=request.getContextPath() %>/login.jsp">退出</a>
    </div>
    <img src="../img/yyh.png" style="width: 32px;height: 32px;float:right;margin-top: 8px;">
</header>
<!--时间-->
<section class="publicTime">
    <span id="time"></span>

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
                <li><a href="<%=request.getContextPath() %>/pay/payment.action">缴费记录</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getList1.action">课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/inc/income.action">收支明细</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/arr.action">欠费学生</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/jisuan.jsp">教师工资</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getTeacherKeshiList.action">教师课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/teacher.action">用户管理</a></li>
                <li><a href="<%=request.getContextPath() %>/help.jsp">帮助</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>课时统计</span>
        </div>
        <div class="search">
            <span style="color:red">${msg}</span>
            <input type="text" placeholder="请输入老师姓名" name="teacher_name" form="myForm"/>
            <input type="text" placeholder="请输入培训课程" name="course" form="myForm"/>
            <input type="date" placeholder="请输入开始时间" name="date1" form="myForm"/>
            <input type="date" placeholder="请输入结束时间" name="date2" form="myForm"/>
            <a href="<%=request.getContextPath()%>/keshi/toadd.action">添加明细</a>
            <input type="submit" value="查询" form="myForm"/>
            <form action="<%=request.getContextPath()%>/keshi/getList1.action"
                  method="post" id="myForm"></form>

        </div>
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="15%" hidden="hidden">序号</th>
                <th width="15%">日期</th>
                <th width="15%">学生姓名</th>
                <th width="15%">培训课程</th>
                <th width="15%">课时</th>
                <th width="15%">责任教师</th>
                <th width="15%">每节课时金额</th>
            </tr>
            <c:forEach items="${list}" var="l">
                <tr>
                    <td hidden="hidden">${l.id}</td>
                    <td>${l.riqi}</td>
                    <td>${l.student_name}</td>
                    <td>${l.course}</td>
                    <td>${l.keshi}</td>
                    <td>${l.teacher_name}</td>
                    <td>${l.jine}</td>
                    <td>
                        <a href="<%=request.getContextPath() %>/keshi/toupd.action?id=${l.id}"><img src="<%=request.getContextPath() %>/img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="<%=request.getContextPath() %>/keshi/del.action?id=${l.id}" class="removeProvider" onclick="return confirm('您确认要删除本记录么？')"><img src="<%=request.getContextPath() %>/img/schu.png" alt="删除" title="删除"/></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="page">
            <div class="page_cell"><a href="<%=request.getContextPath() %>/keshi/getList1.action">首页</a></div>
            <div class="page_cell" onclick="last_page(<%=session.getAttribute("page")%>)"><a href="<%=request.getContextPath() %>/keshi/getList2.action">上一页</a></div>
            <div style="float: left;margin: 2px"><%=session.getAttribute("page")%>页</div>
            <div class="page_cell" onclick="next_page(<%=session.getAttribute("page")%>)"><a href="<%=request.getContextPath() %>/keshi/getList3.action">下一页</a></div>
            <div class="page_cell"><a href="<%=request.getContextPath() %>/keshi/getList4.action">末页</a></div>
        </div>
    </div>
</section>


<footer class="footer">
</footer>

<script src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script src="<%=request.getContextPath() %>/js/js.js"></script>
<script src="<%=request.getContextPath() %>/js/time.js"></script>

</body>
</html>