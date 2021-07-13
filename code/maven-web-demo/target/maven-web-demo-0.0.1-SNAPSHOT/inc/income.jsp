<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>职场办公管理系统</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/public.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/min.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>培训机构管理系统</h1>

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
                <%--原有代码     <li><a href="<%=request.getContextPath() %>/tea/teacher.action">设置</a></li>--%>
                <li><a href="<%=request.getContextPath() %>/te/shezhi.action">设置</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/student.jsp">学生信息</a></li>
                <li><a href="<%=request.getContextPath() %>/pay/payment.jsp">缴费记录</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getList.action">课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/inc/income.action">收支明细</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/arr.action">欠费学生</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/inq.jsp">学生查询</a></li>
                <li><a href="<%=request.getContextPath() %>/teacher/kstj.action">教师课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/teacher.action">用户管理</a></li>
                <li><a href="<%=request.getContextPath() %>/help.jsp">帮助</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>收入支出明细表</span>
        </div>

        <div class="search">
            <span style="color:red">${msg}</span>
            <a href="<%=request.getContextPath()%>/inc/add.jsp">添加明细</a>
        </div>
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="15%" rowspan="2">日期</th>
                <th width="30%" colspan="3">收入</th>
                <th width="30%" colspan="3">支出</th>
                <th width="10%" rowspan="2">经手人</th>
            </tr>
            <tr class="firstTr">
                <th width="10%">金额</th>
                <th width="10%">分类</th>
                <th width="10%">备注</th>
                <th width="10%">金额</th>
                <th width="10%">分类</th>
                <th width="10%">备注</th>
            </tr>
            <c:forEach items="${inclist }" var="s">
                <tr>
                    <td>${s.rgdate}</td>
                    <td>${s.money}</td>
                    <td>${s.msort}</td>
                    <td>${s.mremark}</td>
                    <td>${s.paid}</td>
                    <td>${s.psort}</td>
                    <td>${s.premark}</td>
                    <td>${s.handle}</td>
                    <td>
<%--                        <a href="<%=request.getContextPath() %>/stu/toUpdate.action?id=${s.id}"><img src="<%=request.getContextPath() %>/img/xiugai.png" alt="修改" title="修改"/></a>--%>
<%--                        <a href="<%=request.getContextPath() %>/stu/delete.action?id=${s.id}" class="removeProvider" onclick="return confirm('您确认要删除本记录么？')"><img src="<%=request.getContextPath() %>/img/schu.png" alt="删除" title="删除"/></a>--%>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div id="min5">
            <div id="min6">
                收支汇总
            </div>
            <div id="min7">
                <li class="min8">
                    <div class="min10">累计收入</div>
                    <div class="min9">
                        <c:forEach items="${inclist}" begin="1" end="1" var="use" >
                            ${use.mall }
                        </c:forEach>
                    </div>
                </li>
                <li class="min8">
                    <div class="min10">累计支出</div>
                    <div class="min9">
                        <c:forEach items="${inclist}" begin="1" end="1" var="use" >
                            ${use.pall }
                        </c:forEach>
                    </div>
                </li>
                <li class="min8">
                    <div class="min10">学费收入</div>
                    <div class="min9">
                        <c:forEach items="${inclist}" begin="1" end="1" var="use" >
                            ${use.xall }
                        </c:forEach>
                    </div>
                </li>
                <li class="min8">
                    <div class="min10">累计结余</div>
                    <div class="min9">
                        <c:forEach items="${inclist}" begin="1" end="1" var="use" >
                            ${use.yall }
                        </c:forEach>
                    </div>
                </li>
            </div>
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