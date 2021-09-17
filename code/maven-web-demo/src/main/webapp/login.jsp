<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>培训管理系统</title>
    <script src="js/jquery.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/min.css"/>
    <script type="text/javascript">

        $(document).ready(function(){
            $.ajax({
                type: 'post',
                url:'denglu/xiala.action',
                data:{

                },
                success:function (result){
                    // alert("1");
                    var user = eval('('+result+')');
                    var str = "<label >公司名：</label> <select name=\"Company\" id=\"Company\" style='width: 238.19px;height: 37px;margin: 0 auto'>";
                    var strcontent ="";
                    for(var i=0;i<user.length;i++){
                        strcontent+="<option>"+user[i]+"</option>"
                    }
                    str+=strcontent+"</select>";
                    $("#content").html(str);

                },error:function () {
                    alert("error!");
                }
            })
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
            <form class="loginForm" method="post" action="<%=request.getContextPath() %>/aa.action">

                <div class="inputbox" id="content" >

<%--                    style="width: 300px;height:40px;margin:0 auto "--%>
                </div>
                <div class="inputbox">
                    <label for="userName">用户名：</label>
                    <input id="userName" type="text" name="userName" value="${cookie.userName.value}" placeholder="请输入用户名" required/>
                </div>
                <div class="inputbox">
                    <label for="password">密码：</label>
                    <input id="password" type="password" name="password" value="${cookie.password.value}" placeholder="请输入密码" required/>
                </div>
<%--                	<div id="min11">--%>
<%--                	<c:if test="${not empty cookie.userName and not empty cookie.password}">--%>
<%--                		<input type="checkbox" id="isRemPwd" checked="true"/>--%>
<%--                	</c:if>--%>
<%--                	<c:if test="${empty cookie.userName or empty cookie.password}">--%>
<%--                		<input type="checkbox" id="isRemPwd"/>--%>
<%--                	</c:if>--%>
<%--                	十天内免登录--%>
<%--                </div>--%>
                
                <div class="subBtn">
<%--                    --%>
                    <input type="submit" id="loginBtn" value="登录" />
                    <input type="reset" value="重置"/>
                </div>

            </form>
        </section>
    </section>

</body>
</html>