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
            <span>教师工资</span>
        </div>
        <div class="search">
            <span style="color:red">${msg}</span>
            <form action="<%=request.getContextPath()%>/keshi/select1.action"
                  method="post" id="myForm"></form>
            <input type="date" placeholder="请输入年月" name="date2" form="myForm"/>
            <input type="submit" value="查询" form="myForm"/>
        </div>
        <div class="search">

        </div>
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <%--            <tr>--%>
            <%--                <th width="10%">--%>
            <%--                    <select  style="width: 50%">--%>
            <%--                        <option >2019</option>--%>
            <%--                        <option >2020</option>--%>
            <%--                        <option >2021</option>--%>
            <%--                        <option >2022</option>--%>
            <%--                    </select>--%>
            <%--                </th>--%>
            <%--                <th width="10%">年</th>--%>
            <%--                <th width="10%">--%>
            <%--                    <select  style="width: 40%">--%>
            <%--                        <option >1</option>--%>
            <%--                        <option >2</option>--%>
            <%--                        <option >3</option>--%>
            <%--                        <option >4</option>--%>
            <%--                        <option >5</option>--%>
            <%--                        <option >6</option>--%>
            <%--                        <option >7</option>--%>
            <%--                        <option >8</option>--%>
            <%--                        <option >9</option>--%>
            <%--                        <option >10</option>--%>
            <%--                        <option >11</option>--%>
            <%--                        <option >12</option>--%>
            <%--                    </select>--%>
            <%--                </th>--%>
            <%--                <th width="10%">月</th>--%>
            <%--                <th width="10%"></th>--%>
            <%--            </tr>--%>
            <tr>
                <th colspan="5"></th>
            </tr>
            <tr class="firstTr">
                <th width="10%">教师姓名</th>
                <th width="10%">课程名称</th>
                <th width="10%">上课课时</th>
                <th width="10%">每节金额</th>
                <th width="10%">工资核算</th>
            </tr>
            <c:forEach items="${teacherKeshiList }" var="tkl">
                <tr>
                    <td>${tkl.teacher_name}</td>
                    <td>${tkl.course}</td>
                    <td>${tkl.keshi}</td>
                    <td>${tkl.jine}</td>
                    <td>${tkl.gongzi}</td>
                        <%--                    <td>--%>
                        <%--                        <a href="<%=request.getContextPath() %>/teacher/toalter.action?id=${s.id}"><img src="<%=request.getContextPath() %>/img/read.png" alt="查看" title="查看"/></a>--%>
                        <%--                        <a href="<%=request.getContextPath() %>/teacher/toalter.action?id=${s.id}"><img src="<%=request.getContextPath() %>/img/xiugai.png" alt="修改" title="修改"/></a>--%>
                        <%--                        <a href="<%=request.getContextPath() %>/teacher/delete.action?id=${s.id}" class="removeProvider" onclick="return confirm('您确认要删除本记录么？')"><img src="<%=request.getContextPath() %>/img/schu.png" alt="删除" title="删除"/></a>--%>
                        <%--                    </td>--%>
                </tr>
            </c:forEach>
        </table>
    </div>

</section>
