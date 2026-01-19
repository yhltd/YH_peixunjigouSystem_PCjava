<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="../img/mm.png" />
    <title>教务管理系统</title>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/public.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css"/>

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
    <span style="color:red">${msg}</span>
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
            <strong>你现在所在的位置是:</strong>
            <span>权限管理 >> 权限管理修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="<%=request.getContextPath() %>/power/update.action">
                <div>
                    <label for="id">序号：</label>
                    <input type="text" readonly="readonly" name="id" id="id" value="${power.id}" readonly="readonly"/>
                    <span >*</span>
                </div>
                <div>
                    <input hidden="hidden" id="t_id2" value="${power.t_id }"/>
                    <label for="t_id">姓名：</label>
                    <select name="t_id" id="t_id" style="width: 270px">
                        <c:forEach items="${tea}" var="tea">
                            <option value="${tea.id }">${tea.realName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div>
                    <input hidden="hidden" id="view_name2" value="${power.view_name }"/>
                    <label for="view_name">页面名称：</label>
                    <select name="view_name" id="view_name" style="width: 270px">
                        <option>学生信息</option>
                        <option>教师信息</option>
                        <option>缴费记录</option>
                        <option>课时统计</option>
                        <option>收支明细</option>
                        <option>欠费学员</option>
                        <option>教师工资</option>
                        <option>教师课时统计</option>
                        <option>考勤表</option>
                        <option>教师课表</option>
                        <option>用户管理</option>
                        <option>权限管理</option>
                    </select>
                </div>
                <div>
                    <input hidden="hidden" id="add2" value="${power.add }"/>
                    <label for="add">增：</label>
                    <select name="add" id="add" style="width: 270px">
                        <option></option>
                        <option>√</option>
                    </select>
                </div>
                <div>
                    <input hidden="hidden" id="del2" value="${power.del }"/>
                    <label for="del">删：</label>
                    <select name="del" id="del" style="width: 270px">
                        <option></option>
                        <option>√</option>
                    </select>
                </div>
                <div>
                    <input hidden="hidden" id="upd2" value="${power.upd }"/>
                    <label for="upd">改：</label>
                    <select name="upd" id="upd" style="width: 270px">
                        <option></option>
                        <option>√</option>
                    </select>
                </div>
                <div>
                    <input hidden="hidden" id="sel2" value="${power.sel }"/>
                    <label for="sel">查：</label>
                    <select name="sel" id="sel" style="width: 270px">
                        <option></option>
                        <option>√</option>
                    </select>
                </div>
                <div class="providerAddBtn">
                    <input type="submit" value="保存" onclick="history.back(-1)"/>
                    <input type="button" value="返回" onclick="history.back(-1)"/>
                </div>
            </form>
        </div>
    </div>
</section>
<footer class="footer">
</footer>
<script src="<%=request.getContextPath() %>/js/time.js"></script>
</body>
<script type="text/javascript">
    window.onload=function(){

        $("#t_id").val($("#t_id2").val());
        $("#view_name").val($("#view_name2").val());
        $("#add").val($("#add2").val());
        $("#del").val($("#del2").val());
        $("#upd").val($("#upd2").val());
        $("#sel").val($("#sel2").val());


    };

    function shujv() {
        alert($('#rongliang').val());
        return false;
    }
    setTimeout(function(){
        var link = document.querySelector('.list a[href*="tea"]');
        if (link) {
            link.style.background = 'linear-gradient(135deg, #003366, #002244)';
            link.style.color = 'white';
            link.style.transform = 'translateY(-3px)';
            link.style.boxShadow = '0 4px 8px rgba(0, 0, 0, 0.2)';
        }
    }, 100);
</script>
</html>