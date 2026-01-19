<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head lang="en">
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="../img/mm.png" />
	<title>教务管理系统</title>
	<link rel="stylesheet"
		  href="<%=request.getContextPath()%>/css/public.css" />
	<link rel="stylesheet"
		  href="<%=request.getContextPath()%>/css/style.css" />
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
				<li><a href="<%=request.getContextPath()%>/stu/student1.action">学生信息</a></li>
				<li><a href="<%=request.getContextPath() %>/teacherInfo/getList1.action">教师信息</a></li>
				<li><a href="<%=request.getContextPath()%>/pay/payment.action">缴费记录</a></li>
				<li><a href="<%=request.getContextPath() %>/keshi/getList1.action">课时统计</a></li>
				<li><a href="<%=request.getContextPath() %>/inc/income.action">收支明细</a></li>
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
			<strong>你现在所在的位置是:</strong> <span>缴费记录 >> 缴费记录表修改页面</span>
		</div>
		<div class="search" style="background: url('<%=request.getContextPath()%>/img/background3.jpeg')  repeat center!important;background-size:100% 100%;">
			<span style="color:red">${msg}</span>

		</div>
		<div class="providerAdd">
			<form action="<%=request.getContextPath()%>/pay/update.action">
				<div>
					<label for="id">序号：</label>
					<input type="text" readonly="readonly" name="id" id="id" value="${payment.id}"/>
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
					<label for="paid">定金金额：</label><input type="number"
														  name="paid" id="paid" value="${payment.paid }" />
				</div>
				<div>
					<label for="money">学费金额：</label> <input type="number" name="money"
															id="money" value="${payment.money }" />
				</div>
				<div>
					<label for="paiment">缴费方式：</label>
					<select name="paiment" id="paiment">
						<c:forEach items="${shezhi}" var="shezhi">
							<option>${shezhi.paiment}</option>
						</c:forEach>
					</select>
					<input type="text" name="paiment2" hidden="hidden"
						   id="paiment2" value="${payment.paiment }" />
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
<script>
	window.onload=function(){
		var paiment2=$("#paiment2").val();
		$("#paiment").val(paiment2);
	};

	function shujv() {
		alert($('#rongliang').val());
		return false;
	}

	document.addEventListener('DOMContentLoaded', function() {
		var select = document.getElementById('paiment');
		var options = select.options;
		var uniqueValues = [];

		// 从后往前遍历，保留第一个出现的选项
		for (var i = options.length - 1; i >= 0; i--) {
			if (uniqueValues.indexOf(options[i].value) > -1) {
				select.remove(i);
			} else {
				uniqueValues.push(options[i].value);
			}
		}
	});
	setTimeout(function(){
		var link = document.querySelector('.list a[href*="pay"]');
		if (link) {
			link.style.background = 'linear-gradient(135deg, #003366, #002244)';
			link.style.color = 'white';
			link.style.transform = 'translateY(-3px)';
			link.style.boxShadow = '0 4px 8px rgba(0, 0, 0, 0.2)';
		}
	}, 100);
</script>
</html>