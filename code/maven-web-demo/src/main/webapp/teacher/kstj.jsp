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
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>教师课时统计</span>
            <div title="此页面为教师课时统计，这里会根据课时统计页面的数据来计算教师的工资" style="color: red">*</div>
        </div>
        <div class="search" style="background: url('<%=request.getContextPath()%>/img/background3.jpeg')  repeat center!important;background-size:100% 100%;">
            <span style="color:red">${msg}</span>
<%--            <a href="<%=request.getContextPath()%>/teacher/add.jsp">添加信息</a>--%>
            <form action="<%=request.getContextPath()%>/keshi/select.action"
                  method="post" id="myForm"></form>

            <span>教师名称</span>
            <input type="text" placeholder="请输入老师姓名" name="teacher_name" form="myForm"/>
            <input type="date" placeholder="请输入开始时间" name="date1" form="myForm"/>
            <input type="date" placeholder="请输入结束时间" name="date2" form="myForm"/>
            <input type="submit" value="查询" form="myForm"/>
            <a id="toExcel" >导出excel</a>
            <a href="<%=request.getContextPath() %>/course/getList1.action">教师课表</a>
        </div>
<%--        <div class="search" style="background: url('<%=request.getContextPath()%>/img/background3.jpeg')  repeat center!important;background-size:100% 100%;">--%>
<%--        </div>--%>
        <table id="data" class="providerTable" cellpadding="0" cellspacing="0">
            <caption style="font-size: 14px;margin-bottom: 0.5%;">教师课时统计</caption>
<%--            <tr>--%>
<%--                <th width="10%">--%>
<%--                    <select  style="width: 50%">--%>
<%--                        <option >2019</option>--%>
<%--                        <option >2020</option>--%>
<%--                        <option >2021</option>--%>
<%--                        <option >2022</option>--%>
<%--                    </select>--%>
<%--                </th>--%>
<%--                <th width="10%">年</th>--%>
<%--                <th width="10%">--%>
<%--                    <select  style="width: 40%">--%>
<%--                        <option >1</option>--%>
<%--                        <option >2</option>--%>
<%--                        <option >3</option>--%>
<%--                        <option >4</option>--%>
<%--                        <option >5</option>--%>
<%--                        <option >6</option>--%>
<%--                        <option >7</option>--%>
<%--                        <option >8</option>--%>
<%--                        <option >9</option>--%>
<%--                        <option >10</option>--%>
<%--                        <option >11</option>--%>
<%--                        <option >12</option>--%>
<%--                    </select>--%>
<%--                </th>--%>
<%--                <th width="10%">月</th>--%>
<%--                <th width="10%"></th>--%>
<%--            </tr>--%>
            <tr>
                <th colspan="5"></th>
            </tr>
            <tr class="firstTr">
                <th width="10%">教师姓名</th>
                <th width="10%">课程名称</th>
                <th width="10%">上课课时</th>
                <th width="10%">每节金额</th>
                <th width="10%">工资核算</th>
            </tr>
            <c:forEach items="${teacherKeshiList }" var="tkl">
                <tr>
                    <td>${tkl.teacher_name}</td>
                    <td>${tkl.course}</td>
                    <td>${tkl.keshi}</td>
                    <td>${tkl.jine}</td>
                    <td>${tkl.gongzi}</td>
<%--                    <td>--%>
<%--                        <a href="<%=request.getContextPath() %>/teacher/toalter.action?id=${s.id}"><img src="<%=request.getContextPath() %>/img/read.png" alt="查看" title="查看"/></a>--%>
<%--                        <a href="<%=request.getContextPath() %>/teacher/toalter.action?id=${s.id}"><img src="<%=request.getContextPath() %>/img/xiugai.png" alt="修改" title="修改"/></a>--%>
<%--                        <a href="<%=request.getContextPath() %>/teacher/delete.action?id=${s.id}" class="removeProvider" onclick="return confirm('您确认要删除本记录么？')"><img src="<%=request.getContextPath() %>/img/schu.png" alt="删除" title="删除"/></a>--%>
<%--                    </td>--%>
                </tr>
            </c:forEach>
        </table>
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
    var element=document.getElementById("toExcel");
    var toExcel=function (event) {
        var html="<html><head><meta charset='UTF-8'></head><body>"+document.getElementById("data").outerHTML+"</body></html>";
        var html2 = document.getElementById("data");
        var zhong_html = "<html><head><meta charset='UTF-8'></head><body><table><tbody>"
        var rows = html2.rows;
        var columns = rows[0].cells.length;

        for (var i = 0;i<rows.length;i++){
            zhong_html += "<tr>";
            var cells=rows[i].cells;
            for(var j = 0;j<=cells.length-1;j++){
                var cells2 = cells[j].outerHTML;
                zhong_html += cells2;
                if (j == cells.length-1){
                    zhong_html += "</tr>"
                }
            }
        }

        zhong_html += "</tbody></table></body></html>";
        var blob=new Blob([zhong_html],{type:"application/vnd.ms-excel"});
        var a=event.target;
        a.href=URL.createObjectURL(blob);
        a.download="教师课时统计";
    };
    element.onclick=toExcel;

    function shujv() {
        alert($('#rongliang').val());
        return false;
    }
</script>
</html>