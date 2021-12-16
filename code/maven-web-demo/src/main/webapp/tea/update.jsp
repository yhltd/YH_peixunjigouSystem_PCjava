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
        <p><span id="hours"></span><img src="../img/yyh.png" style="width: 14px;height: 14px"><span style="color: #fff21b">${GLOBAL_USER.realName} </span> , 欢迎你！</p>
        <a href="<%=request.getContextPath() %>/login.jsp">退出</a>
    </div>

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
                <li><a href="">设置</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>个人信息维护表</span>
        </div>
        <div class="providerAdd">
            <form action="<%=request.getContextPath() %>/tea/update.action?id=${GLOBAL_USER.id }" method="post">

                <div>
                    <label for="realName">姓名：</label>
                    <input type="text" name="realName" id="realName" value="${GLOBAL_USER.realName }"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="age">年龄：</label>
                    <input type="text" name="age" id="age" value="${GLOBAL_USER.age }"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="phone">手机号：</label>
                    <input type="text" name="phone" id="phone" value="${GLOBAL_USER.phone }"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="home">家庭住址：</label>
                    <input type="text" name="home" id="home" value="${GLOBAL_USER.home }"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="photo">身份证号：</label>
                    <input type="text" name="photo" id="photo" value="${GLOBAL_USER.photo }"/>
                </div>
                <div>
                    <label for="education">学历：</label>
                    <input type="text" name="education" id="education" value="${GLOBAL_USER.education }"/>
                </div>
                <div class="providerAddBtn">
                    <input type="submit" value="保存" />
                </div>
            </form>
        </div>

    </div>
</section>
<footer class="footer">
</footer>
<script src="<%=request.getContextPath() %>/js/time.js"></script>

</body>
</html>