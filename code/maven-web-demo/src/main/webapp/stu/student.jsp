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
                <%--原有代码     <li><a href="<%=request.getContextPath() %>/tea/teacher.action">设置</a></li>--%>
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
                <li><a href="<%=request.getContextPath() %>/pdf/云合教务管理系统_使用说明.rar">使用说明</a></li>
                <li><a href="<%=request.getContextPath() %>/pdf/app-debug.apk">下载app</a></li>
                <li><a href="<%=request.getContextPath() %>/pdf/教务管理系统（20230618）.xlsm">下载表格</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>学生信息</span>
            <div title="学生信息页面可以对学生基本信息进行操作，已上课时和已缴费会根据后面页面的数据自动计算" style="color: red">*</div>
        </div>
        <div class="search" style="background: url('<%=request.getContextPath()%>/img/background3.jpeg')  repeat center!important;background-size:100% 100%;">
            <span style="color:red">${msg}</span>
            <form action="<%=request.getContextPath()%>/stu/student1.action"
                  method="post" id="myForm"></form>
            <input type="date" placeholder="请输入开始时间" name="date1" form="myForm"/>
            <input type="date" placeholder="请输入结束时间" name="date2" form="myForm"/>
            <input type="text" placeholder="请输入学生姓名" name="realName" form="myForm"/>
            <input type="text" placeholder="请输入教师姓名" name="teacher" form="myForm"/>
            <input type="text" placeholder="请输入培训课程" name="peixun" form="myForm"/>
            <input type="submit" value="查询" form="myForm" style="width:90px"/>
            <a id="toExcel" style="width:70px">导出excel</a>
            <a href="<%=request.getContextPath() %>/stu/shezhi.action" style="width:70px">添加信息</a>
            <%--            <a href="<%=request.getContextPath()%>/stu/add.jsp">添加学生</a>--%>

        </div>
        <table id="data" class="providerTable" cellpadding="0" cellspacing="0">
            <caption style="font-size: 14px;margin-bottom: 0.5%;">学生信息</caption>
            <tr class="firstTr">
                <th width="5%">序号</th>
                <th width="5%">学生姓名</th>
                <th width="5%">性别</th>
                <th width="10%">报名日期</th>
                <th width="5%">培训课程</th>
                <th width="5%">责任教师</th>
                <th width="5%">班级</th>
                <th width="10%">电话</th>
                <th width="5%">学费</th>
                <th width="5%">已缴费</th>
                <th width="5%">未交费</th>
                <th width="5%">已上课时</th>
                <th width="5%">剩余课时</th>
                <th width="5%">总课时</th>
                <th width="5%">状态</th>
            </tr>
            <c:forEach items="${list }" var="s">
                <tr>
                    <td>${s.id}</td>
                    <td>${s.realName}</td>
                    <td>${s.sex}</td>
                    <td>${s.rgdate}</td>
                    <td>${s.course}</td>
                    <td>${s.teacher}</td>
                    <td>${s.classnum}</td>
                    <td>${s.phone}</td>
                    <td>${s.fee}</td>
                    <td>${s.mall}</td>
                    <td>${s.fee-s.mall}</td>
                    <td>${s.nall}</td>
                    <td>${s.allHour-s.nall}</td>
                    <td>${s.allHour}</td>
                    <td>${s.type}</td>

                    <td>
                        <a href="<%=request.getContextPath() %>/stu/toSelect.action?id=${s.id}"><img src="<%=request.getContextPath() %>/img/read.png" alt="查看" title="查看"/></a>
                        <a href="<%=request.getContextPath() %>/stu/toUpdate.action?id=${s.id}"><img src="<%=request.getContextPath() %>/img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="<%=request.getContextPath() %>/stu/delete.action?id=${s.id}" class="removeProvider" onclick="return confirm('您确认要删除本记录么？')"><img src="<%=request.getContextPath() %>/img/schu.png" alt="删除" title="删除"/></a>
                    </td>

                </tr>

            </c:forEach>
        </table>

        <div class="page">
            <div class="page_cell"><a href="<%=request.getContextPath() %>/stu/student1.action">首页</a></div>
            <div class="page_cell" onclick="last_page(<%=session.getAttribute("page")%>)"><a href="<%=request.getContextPath() %>/stu/student2.action">上一页</a></div>
            <div style="float: left;margin: 2px"><%=session.getAttribute("page")%>页</div>
            <div class="page_cell" onclick="next_page(<%=session.getAttribute("page")%>)"><a href="<%=request.getContextPath() %>/stu/student3.action">下一页</a></div>
            <div class="page_cell"><a href="<%=request.getContextPath() %>/stu/student4.action">末页</a></div>
        </div>

        <%--        <div style="text-align: center">--%>
        <%--            <input type="submit" value="首页" form="myForm"/>--%>
        <%--            <input type="submit" value="上一页" form="myForm"/>--%>
        <%--            <div style="float: left;margin: 2px"><%=session.getAttribute("page")%>页</div>--%>
        <%--            <input type="submit" value="下一页" form="myForm"/>--%>
        <%--            <input type="submit" value="末页" form="myForm"/>--%>
        <%--        </div>--%>
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
<script>
    var element=document.getElementById("toExcel")
    var toExcel=function (event) {
        var html="<html><head><meta charset='UTF-8'></head><body>"+document.getElementById("data").outerHTML+"</body></html>";
        var html2 = document.getElementById("data");
        var zhong_html = "<html><head><meta charset='UTF-8'></head><body><table><tbody>"
        var rows = html2.rows;
        var columns = rows[0].cells.length

        for (var i = 0;i<rows.length;i++){
            zhong_html += "<tr>"
            var cells=rows[i].cells
            for(var j = 0;j<cells.length-1;j++){
                var cells2 = cells[j].outerHTML
                zhong_html += cells2
                if (j == cells.length-2){
                    zhong_html += "</tr>"
                }
            }
        }
        zhong_html += "</tbody></table></body></html>"
        var blob=new Blob([zhong_html],{type:"application/vnd.ms-excel"});
        var a=event.target;
        a.href=URL.createObjectURL(blob);
        a.download="学生信息";
    };
    element.onclick=toExcel;

    function shujv() {
        alert($('#rongliang').val());
        return false;
    }



    // function next_page(page){
    //         var data = {
    //             "page":page
    //       };
    //         $.ajax({
    //                 type:"post",
    //                 url:"/Student/stu/next_pagedo",
    //                 data:JSON.stringify(data),
    //                 dataType:"json",
    //                 contentType:"application/json",
    //                 success:function(data){
    //                  var show_data = document.getElementById("show_data")
    //                    show_data.innerHTML = " ";
    //                  for(i=0; i<data.length; i++){
    //                              //.....异步刷新页面
    //                         }
    //                 }, error:function(data){
    //                alert("网络连接错误");
    //            }
    //         });
    // }
    // function last_page(page){
    //     var data = {
    //         "page":page
    //     };
    //     $.ajax({
    //         type:"post",
    //         url:"/Student/next_pageup",
    //         data:JSON.stringify(data),
    //         dataType:"json",
    //         contentType:"application/json",
    //         success:function(data){
    //             var show_data = document.getElementById("show_data")
    //             show_data.innerHTML = " ";
    //             for(i=0; i<data.length; i++){
    //                 //.....异步刷新页面
    //             }
    //         }, error:function(data){
    //             alert("网络连接错误");
    //         }
    //     });
    // }

</script>





</html>