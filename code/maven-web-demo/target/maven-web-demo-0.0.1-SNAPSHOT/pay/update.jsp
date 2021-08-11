<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
	<meta charset="UTF-8">
	<title>培训管理系统</title>
	<link rel="stylesheet"
		  href="<%=request.getContextPath()%>/css/public.css" />
	<link rel="stylesheet"
		  href="<%=request.getContextPath()%>/css/style.css" />
</head>
<body>
<!--头部-->
<header class="publicHeader">
	<h1>培训管理系统</h1>

	<div class="publicHeaderR">
		<p>
			<span>下午好！</span><span style="color: #fff21b">${teacher.userName}</span>
			, 欢迎你！
		</p>
		<a href="<%=request.getContextPath()%>/login.jsp">退出</a>
	</div>
</header>
<!--时间-->
<section class="publicTime">
	<span id="time"></span>
</section>
<!--主体内容-->
<section class="publicMian ">
	<div class="left">
		<h2 class="leftH2">
			<span class="span1"></span>功能列表 <span></span>
		</h2>
		<nav>
			<ul class="list">
				<li><a href="<%=request.getContextPath()%>/main.jsp">主页</a></li>
				<%--原有代码         <li><a href="<%=request.getContextPath() %>/tea/teacher.action">设置</a></li>--%>
				<li><a href="<%=request.getContextPath() %>/te/shezhi.action">设置</a></li>
				<li><a href="<%=request.getContextPath()%>/stu/student.action">学生信息</a></li>
				<li><a href="<%=request.getContextPath()%>/pay/payment.action">缴费记录</a></li>
				<li><a href="<%=request.getContextPath() %>/keshi/getList.action">课时统计</a></li>
				<li><a href="<%=request.getContextPath() %>/inc/income.action">收支明细</a></li>
				<li><a href="<%=request.getContextPath() %>/stu/arr.action">欠费学生</a></li>
				<li><a href="<%=request.getContextPath() %>/stu/inq.jsp">学生查询</a></li>
				<li><a href="<%=request.getContextPath() %>/keshi/getTeacherKeshiList.action">教师课时统计</a></li>
				<li><a href="<%=request.getContextPath() %>/tea/teacher.action">用户管理</a></li>
				<li><a href="<%=request.getContextPath() %>/help.jsp">帮助</a></li>
			</ul>
		</nav>
	</div>
	<div class="right">
		<div class="location">
			<strong>你现在所在的位置是:</strong> <span>缴费记录表 >> 缴费记录表修改页面</span>
		</div>
		<div class="search">
			<span style="color:red">${msg}</span>

		</div>
		<div class="providerAdd">
			<form action="<%=request.getContextPath()%>/pay/update.action">
				<div>
					<label for="id">序号：</label>
					<input type="text" name="id" id="id" value="${payment.id}"/>
					<span >*</span>
				</div>
				<div>
					<label for="id">日期：</label>
					<%--	原有代码			<input type="text" name="ksdate" id="ksdate" value="${payment.ksdate}" />--%>
					<input type="date" name="ksdate" value="${payment.ksdate}"/>
				</div>
				<div>
					<label for="realname">学生姓名：</label> <input type="text"
															   name="realname" id="realname" value="${payment.realname }" /> <span>*</span>
				</div>
				<div>
					<label for="paid">定金金额：</label><input type="text"
														  name="paid" id="paid" value="${payment.paid }" />
				</div>
				<div>
					<label for="money">学费金额：</label> <input type="text" name="money"
															id="money" value="${payment.money }" />
				</div>
				<div>
					<label for="paiment">缴费方式：</label> <input type="text" name="paiment"
															  id="paiment" value="${payment.paiment }" />
				</div>
				<div>
					<label for="keeper">收费人：</label> <input type="text"
															name="keeper" id="keeper" value="${payment.keeper }" /> <span>*</span>
				</div>
				<div>
					<label for="remark">备注：</label> <input type="text"
														   name="remark" id="remark" value="${payment.remark }" />
				</div>
				<div class="providerAddBtn">
					<input type="submit" value="保存" onclick="history.back(-1)" />
					<input	type="button" value="返回" onclick="history.back(-1)" />
				</div>
			</form>
		</div>

	</div>
</section>
<footer class="footer"> </footer>
<script src="<%=request.getContextPath()%>/js/time.js"></script>

</body>
</html>