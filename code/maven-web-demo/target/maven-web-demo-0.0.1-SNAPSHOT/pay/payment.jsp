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
        <a class="btn-3d" onclick="shujv()" style="width:80px">数据空间</a>
        <a class="btn-3d" href="<%=request.getContextPath() %>/login.jsp" style="width:80px">退出</a>
    </div>
<%--    <a href="<%=request.getContextPath() %>/tea/teacher.action"><img src="../img/yyh.png" style="width: 32px;height: 32px;float:right;margin-top: 8px;"></a>--%>
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
                <li><a href="<%=request.getContextPath() %>/tea/jisuan.jsp">教师工资</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getTeacherKeshiList.action">教师课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/teacher.action">用户管理</a></li>
                <li><a href="<%=request.getContextPath() %>/pdf/云合教务管理系统_使用说明.rar">使用说明</a></li>
                <li><a href="<%=request.getContextPath() %>/pdf/app-debug.apk">下载app</a></li>
                <li><a href="<%=request.getContextPath() %>/pdf/教务管理系统（20230618）.xlsm">下载表格</a></li>
            </ul>
        </nav>
    </div>
    </div>
    <div class="right" id="right">
        <div class="all">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>缴费记录</span>
            <span id="time"></span>
            <div title="此页面为缴费记录，在这里添加数据后学生信息会自动更新已缴费金额" style="color: red">*</div>
        </div>
        <div class="search" style="background-size:100% 100%;">
<%--            <span style="color:red">${msg}</span>--%>
            <form action="<%=request.getContextPath()%>/pay/payment1.action"
                  method="post" id="myForm"></form>
            <input id="ks" type="date" placeholder="请输入开始时间" name="date1" form="myForm" style="height: 40px;width: 120px;border: 1px solid #0f0f0f;border-radius: 4px"/>
            <input id="js" type="date" placeholder="请输入结束时间" name="date2" form="myForm" style="height: 40px;width: 120px;border: 1px solid #0f0f0f;border-radius: 4px"/>
            <input id="name" type="text" placeholder="请输入学生姓名" name="realname" form="myForm"/>
            <input class="btn-3d" id="sel_button" type="submit" value="查询" form="myForm"/>
            <a class="btn-3d" onclick="printpage()" >打印</a>
            <a class="btn-3d" href="<%=request.getContextPath()%>/pay/toAdd.action">添加记录</a>
            <a class="btn-3d" id="toExcel" >导出excel</a>
        </div>
        <div id="div">
<%--       cellpadding="1" cellspacing="1"     --%>
            <table id="data" class="gradient-table"  >
<%--                <caption style="font-size: 14px;margin-bottom: 0.5%;">缴费记录</caption>--%>
                <tr class="firstTr">
                    <th style="border: 1px solid rgba(209, 218, 223, 0.4);" width="10%">日期</th>
                    <th style="border: 1px solid rgba(209, 218, 223, 0.4);" width="10%">学生姓名</th>
                    <th style="border: 1px solid rgba(209, 218, 223, 0.4);" width="10%">定金金额</th>
                    <th style="border: 1px solid rgba(209, 218, 223, 0.4);" width="10%">学费金额</th>
                    <th style="border: 1px solid rgba(209, 218, 223, 0.4);" width="10%">缴费方式</th>
                    <th style="border: 1px solid rgba(209, 218, 223, 0.4);" width="10%">收费人</th>
                    <th style="border: 1px solid rgba(209, 218, 223, 0.4);" width="20%">备注</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${plist }" var="p">
                    <tr class="end">
                        <td style="border: 1px solid rgba(209, 218, 223, 0.4);">${p.ksdate}</td>
                        <td style="border: 1px solid rgba(209, 218, 223, 0.4);"><a href="<%=request.getContextPath() %>/pay/dayin.jsp" onclick="popWin(this);">${p.realname}</a></td>
                        <td style="border: 1px solid rgba(209, 218, 223, 0.4);">${p.paid}</td>
                        <td style="border: 1px solid rgba(209, 218, 223, 0.4);">${p.money}</td>
                        <td style="border: 1px solid rgba(209, 218, 223, 0.4);">${p.paiment}</td>
                        <td style="border: 1px solid rgba(209, 218, 223, 0.4);">${p.keeper}</td>
                        <td style="border: 1px solid rgba(209, 218, 223, 0.4);">${p.remark}</td>
                        <td style="border: 1px solid rgba(209, 218, 223, 0.4);" name="yincang">
                            <a href="<%=request.getContextPath() %>/pay/toSelect.action?id=${p.id}"><img src="<%=request.getContextPath() %>/img/read.png" alt="查看" title="查看"/></a>
                            <a href="<%=request.getContextPath() %>/pay/toUpdate.action?id=${p.id}"><img src="<%=request.getContextPath() %>/img/xiugai.png" alt="修改" title="修改"/></a>
                            <a href="<%=request.getContextPath() %>/pay/delete.action?id=${p.id}" class="removeProvider" onclick="return confirm('您确认要删除本记录么？')"><img src="<%=request.getContextPath() %>/img/schu.png" alt="删除" title="删除"/></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>


        <div class="page">
            <div class="page_cell"><a class="page-btn" href="<%=request.getContextPath() %>/pay/payment1.action">首页</a></div>
            <div class="page_cell" onclick="last_page(<%=session.getAttribute("page")%>)"><a class="page-btn" href="<%=request.getContextPath() %>/pay/payment2.action">上一页</a></div>
            <div style="float: left;margin: 2px ;height: 40px; font-size: 16px;color: #0802e9;display: flex;justify-content: center;align-items: center;"><%=session.getAttribute("page")%>页</div>
            <div class="page_cell" onclick="next_page(<%=session.getAttribute("page")%>)"><a class="page-btn" href="<%=request.getContextPath() %>/pay/payment3.action">下一页</a></div>
            <div class="page_cell"><a class="page-btn" href="<%=request.getContextPath() %>/pay/payment4.action">末页</a></div>
        </div>
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
    // $(function () {
    //     $('#ks').val($.session.get('ks'));
    //     $('#js').val($.session.get('js'));
    //     $('#name').val($.session.get('name'));
    //     $.session.set('ks', '');
    //     $.session.set('js', '');
    //     $.session.set('name', '');
    //
    //     $('#sel_button').click(function () {
    //         $.session.set('ks', $('#ks').val());
    //         $.session.set('js', $('#js').val());
    //         $.session.set('name', $('#name').val());
    //     })
    // });


    var element=document.getElementById("toExcel");
    var toExcel=function (event) {
        var html="<html><head><meta charset='UTF-8'></head><body>"+document.getElementById("data").outerHTML+"</body></html>";
        var html2 = document.getElementById("data");
        var zhong_html = "<html><head><meta charset='UTF-8'></head><body><table><tbody>";
        var rows = html2.rows;
        var columns = rows[0].cells.length;

        // for (var i = 0;i<rows.length;i++){
        //     zhong_html += "<tr>";
        //     var cells=rows[i].cells;
        //     for(var j = 0;j<=cells.length-1;j++){
        //         var cells2 = cells[j].outerHTML;
        //         zhong_html += cells2;
        //         if (j == cells.length-1){
        //             zhong_html += "</tr>"
        //         }
        //     }
        // }

        for (var i = 0; i < rows.length; i++) {
            zhong_html += "<tr>";
            var cells = rows[i].cells;
            for (var j = 0; j <= cells.length - 1; j++) {
                if (i == 0) {
                    var cells2 = cells[j].outerHTML;
                    zhong_html += cells2;
                    if (j == cells.length) {
                        zhong_html += "</tr>"
                    }
                } else {
                    if (j == 1) {
                        var cells2 = cells[j].innerText;
                        zhong_html +="<td>"+ cells2 +"</td>"
                    } else {
                        var cells2 = cells[j].outerHTML;
                        zhong_html += cells2;
                        if (j == cells.length - 2) {
                            zhong_html += "</tr>"
                            break;
                        }
                    }
                }
            }
        }

        zhong_html += "</tbody></table></body></html>";
        var blob=new Blob([zhong_html],{type:"application/vnd.ms-excel"});
        var a=event.target;
        a.href=URL.createObjectURL(blob);
        a.download="缴费记录";
    };
    element.onclick=toExcel;

    function shujv() {
        alert($('#rongliang').val());
        return false;
    }

    function printpage(){
        $('[name="yincang"]').css("display","none");
        document.getElementById("div").border="1";
        var newstr = document.getElementById("div").innerHTML;
        var oldstr = document.body.innerHTML;
        document.body.innerHTML = newstr;
        window.print();
        document.body.innerHTML = oldstr;
        $('[name="yincang"]').css("display","block");
        document.getElementById("div").border="0";
        return false;
    }

    function popWin(td) {

        var parentTR = td.parentNode.parentNode;
        var val1 = $(parentTR).children('td').eq(0).text();
        var val2 = $(parentTR).children('td').eq(1).text();
        var val3 = $(parentTR).children('td').eq(2).text();
        var val4 = $(parentTR).children('td').eq(3).text();
        var val5 = $(parentTR).children('td').eq(4).text();
        var val6 = $(parentTR).children('td').eq(5).text();
        var val7 = $(parentTR).children('td').eq(6).text();

        $.session.set('val1', val1);
        $.session.set('val2', val2);
        $.session.set('val3', val3);
        $.session.set('val4', val4);
        $.session.set('val5', val5);
        $.session.set('val6', val6);
        $.session.set('val7', val7);
    }

</script>

</html>