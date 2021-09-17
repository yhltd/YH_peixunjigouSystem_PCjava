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
</section>
<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="<%=request.getContextPath() %>/main.jsp">主页</a></li>
                <li><a href="<%=request.getContextPath() %>/te/shezhi.action">设置</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/student.action">学生信息</a></li>
                <li><a href="<%=request.getContextPath() %>/pay/payment.action">缴费记录</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getList.action">课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/inc/income.action">收支明细</a></li>
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
            <span>教师课时统计表</span>

        </div>
        <div class="search">
            <span style="color:red">${msg}</span>
<%--            <a href="<%=request.getContextPath()%>/teacher/add.jsp">添加信息</a>--%>
            <form action="<%=request.getContextPath()%>/keshi/select.action"
                  method="post" id="myForm"></form>

            <span>教师名称</span>
            <input type="text"  name="teacher_name" form="myForm"/>
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

<%-- <!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeProv">
   <div class="removerChid">
       <h2>提示</h2>
       <div class="removeMain" >
           <p>你确定要删除该学生吗？</p>
           <a href="<%=request.getContextPath()%>/user/delete.action?id=${s.id}" id="yes">确定</a>
           <a href="#" id="no">取消</a>
       </div>
   </div>
</div> --%>


<footer class="footer">
</footer>

<script src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script src="<%=request.getContextPath() %>/js/js.js"></script>
<script src="<%=request.getContextPath() %>/js/time.js"></script>

</body>
</html>