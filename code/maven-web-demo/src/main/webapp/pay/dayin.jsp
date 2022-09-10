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
<body id="body">
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
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="<%=request.getContextPath() %>/main.jsp">主页</a></li>
                <li><a href="<%=request.getContextPath() %>/te/shezhi.action">设置</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/student1.action">学生信息</a></li>
                <li><a href="<%=request.getContextPath() %>/teacherInfo/getList1.action">教师信息</a></li>
                <li><a href="<%=request.getContextPath() %>/pay/payment1.action">缴费记录</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getList1.action">课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/inc/income.action">收支明细</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/arr.action">欠费学员</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/jisuan.jsp">教师工资</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getTeacherKeshiList.action">教师课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/teacher.action">用户管理</a></li>
                <li><a href="<%=request.getContextPath() %>/pdf/云合培训管理系统_PC.pdf">帮助</a></li>
            </ul>
        </nav>
    </div>
    <div class="right" id="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>缴费记录打印</span>
        </div>
        <div class="search" style="background: url('<%=request.getContextPath()%>/img/background3.jpeg')  repeat center!important;background-size:100% 100%;">
            <span style="color:red">${msg}</span>
            <form action="<%=request.getContextPath()%>/pay/payment1.action"
                  method="post" id="myForm"></form>
            <a onclick="printpage()" >打印</a>
        </div>
        <div id="div" style="margin-top: 20px;">
            <table style="margin: auto" id="table" border="1" cellspacing="0">
                <tr>
                    <td style="width: 150px;height: 50px;font-size: 16px">日期：</td>
                    <td style="width: 200px;height: 50px;font-size: 16px" id="riqi"></td>
                </tr>
                <tr>
                    <td style="width: 150px;height: 50px;font-size: 16px">学生姓名：</td>
                    <td style="width: 200px;height: 50px;font-size: 16px" id="name"></td>
                </tr>
                <tr>
                    <td style="width: 150px;height: 50px;font-size: 16px">定金金额：</td>
                    <td style="width: 200px;height: 50px;font-size: 16px" id="dingjin"></td>
                </tr>
                <tr>
                    <td style="width: 150px;height: 50px;font-size: 16px">学费金额：</td>
                    <td style="width: 200px;height: 50px;font-size: 16px" id="jine"></td>
                </tr>
                <tr>
                    <td style="width: 150px;height: 50px;font-size: 16px">缴费方式：</td>
                    <td style="width: 200px;height: 50px;font-size: 16px" id="pay"></td>
                </tr>
                <tr>
                    <td style="width: 150px;height: 50px;font-size: 16px">收费人：</td>
                    <td style="width: 200px;height: 50px;font-size: 16px" id="shoufeiren"></td>
                </tr>
                <tr>
                    <td style="width: 150px;height: 50px;font-size: 16px">备注：</td>
                    <td style="width: 200px;height: 50px;font-size: 16px" id="remarks"></td>
                </tr>
            </table>
        </div>
    </div>
</section>

<footer class="footer">
</footer>

<script src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script src="<%=request.getContextPath() %>/js/jquerysession.js"></script>
<script src="<%=request.getContextPath() %>/js/js.js"></script>
<script src="<%=request.getContextPath() %>/js/time.js"></script>

</body>

<script>
    function shujv() {
        alert($('#rongliang').val());
        return false;
    }

    function printpage(){
        var newstr = document.getElementById("div").innerHTML;
        var oldstr = document.body.innerHTML;
        document.body.innerHTML = newstr;
        window.print();
        document.body.innerHTML = oldstr;
        return false;
    }

    $(document).ready(function(){
        $('#riqi').html($.session.get('val1'));
        $('#name').html($.session.get('val2'));
        $('#dingjin').html($.session.get('val3'));
        $('#jine').html($.session.get('val4'));
        $('#pay').html($.session.get('val5'));
        $('#shoufeiren').html($.session.get('val6'));
        $('#remarks').html($.session.get('val7'));
    })



</script>

</html>