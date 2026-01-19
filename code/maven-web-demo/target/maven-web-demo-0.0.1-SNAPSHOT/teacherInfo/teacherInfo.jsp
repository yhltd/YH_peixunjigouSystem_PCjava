<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/8/27
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
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
    <style>
        .visible{
            top:0;
        }
    </style>
</head>
<body>
<header class="publicHeader" id="navbar">
<%--    <div class="flow-bg"></div>--%>

    <h1>教务管理系统</h1>

    <div class="publicHeaderR">
        <p><span id="hours"></span><span style="color: #fff21b">${GLOBAL_USER.realName} </span> , 欢迎你！</p>
        <input hidden="hidden" id="rongliang" value="${rongliang }"/>
        <a  onclick="shujv()" >数据空间</a>
        <a  href="<%=request.getContextPath() %>/login.jsp" >退出</a>
    </div>
<%--        <a href="<%=request.getContextPath() %>/tea/teacher.action"><img src="../img/yyh.png" style="width: 32px;height: 32px;float:right;margin-top: 8px;"></a>--%>

</header>
<!--时间-->
<%--<section class="publicTime">--%>
<%--    <span id="time"></span>--%>
<%--</section>--%>
<!--主体内容-->
<section class="publicMian ">
    <div class="left-bg">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="<%=request.getContextPath() %>/main.jsp">主页</a></li>
                <%--原有代码     <li><a href="<%=request.getContextPath() %>/tea/teacher.action">设置</a></li>--%>
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
    </div>
    <div class="right">
        <div class="all">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>教师信息</span>
            <span id="time"></span>
            <div title="教师信息页面可以对教师基本信息进行增删改查操作" style="color: red">*</div>
        </div>
        <div class="search" style="background-size:100% 100%;">
<%--            <span style="color:red">${msg}</span>--%>
            <form action="<%=request.getContextPath()%>/teacherInfo/getList1.action"
                  method="post" id="myForm"></form>
            <input type="text" placeholder="请输入教师姓名" name="t_name_sel" form="myForm"/>
            <input class="btn-3d" type="submit" value="查询" form="myForm" style="width:90px"/>
            <a class="btn-3d" href="<%=request.getContextPath() %>/teacherInfo/toAdd.action" style="width:70px">添加信息</a>
            <%--            <a href="<%=request.getContextPath()%>/stu/add.jsp">添加学生</a>--%>

        </div>
        <table id="data" class="gradient-table">
<%--            <caption style="font-size: 14px;margin-bottom: 0.5%;">教师信息</caption>--%>
            <tr class="firstTr">
                <th width="5%">序号</th>
                <th width="5%">教师姓名</th>
                <th width="5%">性别</th>
                <th width="10%">身份证号码</th>
                <th width="5%">民族</th>
                <th width="10%">生日</th>
                <th width="5%">职位</th>
                <th width="5%">学历</th>
                <th width="10%">联系电话</th>
                <th width="10%">入职日期</th>
                <th width="5%">在职状态</th>
                <th width="5%">社保情况</th>
                <th width="10%">地址</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${list }" var="t">
                <tr class="end">
                    <td>${t.id}</td>
                    <td>${t.t_name}</td>
                    <td>${t.sex}</td>
                    <td>${t.id_code}</td>
                    <td>${t.minzu}</td>
                    <td>${t.birthday}</td>
                    <td>${t.post}</td>
                    <td>${t.education}</td>
                    <td>${t.phone}</td>
                    <td>${t.rz_riqi}</td>
                    <td>${t.state}</td>
                    <td>${t.shebao}</td>
                    <td>${t.address}</td>
                    <td>
                        <a href="<%=request.getContextPath() %>/teacherInfo/toUpdate.action?id=${t.id}"><img src="<%=request.getContextPath() %>/img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="<%=request.getContextPath() %>/teacherInfo/delete.action?id=${t.id}" class="removeProvider" onclick="return confirm('您确认要删除本记录么？')"><img src="<%=request.getContextPath() %>/img/schu.png" alt="删除" title="删除"/></a>
                    </td>
                </tr>

            </c:forEach>
        </table>
        <div class="page">
            <div class="page_cell"><a class="page-btn" href="<%=request.getContextPath() %>/teacherInfo/getList1.action">首页</a></div>
            <div class="page_cell" onclick="last_page(<%=session.getAttribute("page")%>)"><a class="page-btn" href="<%=request.getContextPath() %>/teacherInfo/getList2.action">上一页</a></div>
            <div style="float: left;margin: 2px;height: 40px; font-size: 16px;color: #0802e9;display: flex;justify-content: center;align-items: center;"><%=session.getAttribute("page")%>页</div>
            <div class="page_cell" onclick="next_page(<%=session.getAttribute("page")%>)"><a class="page-btn" href="<%=request.getContextPath() %>/teacherInfo/getList3.action">下一页</a></div>
            <div class="page_cell"><a class="page-btn" href="<%=request.getContextPath() %>/teacherInfo/getList4.action">末页</a></div>
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
<script>
    function shujv() {
        alert($('#rongliang').val());
        return false;
    }


    window.addEventListener('scroll', function() {
        const navbar = document.getElementById('navbar');
        if (window.scrollY > 100) {
            navbar.classList.add('visible');
        } else {
            navbar.classList.remove('visible');
        }
    });
    $(document).ready(function() {
        var url = window.location.href;
        $('.list a').each(function() {
            if (url.includes($(this).attr('href'))) {
                // 使用内联样式，优先级最高
                $(this).attr('style',
                    'background: linear-gradient(135deg, #003366, #002244) !important; ' +
                    'color: white !important; ' +
                    'transform: translateY(-3px); ' +
                    'box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2) !important;'
                );
            }
        });
    });
</script>
</html>
