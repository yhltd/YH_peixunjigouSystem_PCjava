<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>职场办公管理系统</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/min.css"/>
	<script type="text/javascript">
		$(function(){
			//给登陆按钮添加单击事件
			$("#loginBtn").click(function(){
				var userName=$("#userName").val();
				var password=$("#password").val();
				var isRemPwd=$("#isRemPwd").attr("checked");
	
				$.ajax({
					url:'/login.action',
					data:{
						userName:userName,
						password:password,
						isRemPwd:isRemPwd
						},
						type:'post',
						dataType:'json',
						success:function(data){
							if(data.code=="1"){
								window.location.href="/main.jsp";
							}else{
									$("#msg").(data.message);	
								}
							}	
					});
				});					
			});
	</script>
</head>
<body class="login_bg">
    <section class="loginBox">
        <header class="loginHeader">
            <h1>登录系统</h1>
        </header>
        <section class="loginCont">
        <div id="min2">${msg}</div>
            <form class="loginForm" action="<%=request.getContextPath() %>/login.action">
                <div class="inputbox">
                    <label for="userName">用户名：</label>
                    <input id="userName" type="text" name="userName" value="${cookie.userName.value}" placeholder="请输入用户名" required/>
                </div>
                <div class="inputbox">
                    <label for="password">密码：</label>
                    <input id="password" type="password" name="password" value="${cookie.password.value}" placeholder="请输入密码" required/>
                </div>
                	<div id="min11">
                	<c:if test="${not empty cookie.userName and not empty cookie.password}">
                		<input type="checkbox" id="isRemPwd" checked="true"/>
                	</c:if>
                	<c:if test="${empty cookie.userName or empty cookie.password}">
                		<input type="checkbox" id="isRemPwd"/>
                	</c:if>
                	十天内免登录
                </div>
                
                <div class="subBtn">
                    <input type="submit" id="loginBtn" value="登录" />
                    <input type="reset" value="重置"/>
                </div>

            </form>
        </section>
    </section>

</body>
</html>