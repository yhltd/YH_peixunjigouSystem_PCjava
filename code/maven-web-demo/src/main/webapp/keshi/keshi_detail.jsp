<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="../img/mm.png"/>
    <title>教务管理系统</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/public.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css"/>

    <style>
        .black_overlay {
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: #222;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=78);
        }

        .pop_win {
            display: none;
            position: absolute;
            top: 10%;
            left: 20%;
            width: 60%;
            height: 75%;
            padding: 10px;
            border: 2px solid #3b3e41;
            background-color: white;
            z-index: 9999;
            overflow: auto;
            border-radius: 25px;
        }

        .fancybox-button {
            background: rgba(30, 30, 30, .6);
            border: 0;
            border-radius: 0;
            box-shadow: none;
            cursor: pointer;
            display: inline-block;
            height: 44px;
            margin: 0;
            padding: 10px;
            position: relative;
            transition: color .2s;
            vertical-align: top;
            visibility: inherit;
            width: 44px;
        }
         .visible{
             top:0;
         }

    </style>

</head>
<body>
<!--头部-->
<header class="publicHeader" id="navbar">
    <h1>教务管理系统</h1>

    <div class="publicHeaderR">
        <p><span id="hours"></span><span style="color: #fff21b">${GLOBAL_USER.realName} </span> , 欢迎你！</p>
        <input hidden="hidden" id="rongliang" value="${rongliang }"/>
        <a style="background: url(../img/数据空间.png);box-sizing: border-box;" onclick="shujv()" >数据空间</a>
        <a style="background: url(../img/退出.png);box-sizing: border-box;" href="<%=request.getContextPath() %>/login.jsp" >退出</a>
    </div>
<%--    <a href="<%=request.getContextPath() %>/tea/teacher.action"><img src="../img/yyh.png"--%>
<%--                                                                     style="width: 32px;height: 32px;float:right;margin-top: 8px;"></a>--%>
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
    <div class="right">
        <div class="all">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>课时统计</span>
            <span id="time"></span>
            <div title="此页面为课时统计，这里可以手动维护数据，在这里添加数据后学生信息会自动更新已上课时" style="color: red">*</div>
        </div>
        <div class="search"
             style="background-size:100% 100%;">
<%--            <span style="color:red">${msg}</span>--%>
            <form action="<%=request.getContextPath()%>/keshi/getList1.action"
                  method="post" id="myForm"></form>
            <input type="text" placeholder="请输入老师姓名" name="teacher_name" form="myForm"/>
            <input type="text" placeholder="请输入培训课程" name="course" form="myForm"/>
            <input type="date" placeholder="请输入开始时间" name="date1" form="myForm" style="height: 40px;width: 120px;border: 1px solid #0f0f0f;border-radius: 4px"/>
            <input type="date" placeholder="请输入结束时间" name="date2" form="myForm" style="height: 40px;width: 120px;border: 1px solid #0f0f0f;border-radius: 4px"/>
            <a href="<%=request.getContextPath()%>/kaoqin/getList1.action" style="width:65px">考勤表</a>
            <a href="<%=request.getContextPath()%>/keshi/toadd.action" style="width:65px">添加明细</a>
            <input class="btn-3d" type="submit" value="查询" style="width:85px" form="myForm"/>
            <a class="btn-3d" id="toExcel">导出excel</a>

        </div>
        <table id="data" class="gradient-table">
<%--            <caption style="font-size: 14px;margin-bottom: 0.5%;">课时统计</caption>--%>
            <tr class="firstTr">
                <th width="15%" hidden="hidden">序号</th>
                <th width="15%">日期</th>
                <th width="15%">学生姓名</th>
                <th width="15%">培训课程</th>
                <th width="15%">课时</th>
                <th width="15%">责任教师</th>
                <th width="15%">每节课时金额</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${list}" var="l">
                <tr class="end">
                    <td hidden="hidden">${l.id}</td>
                    <td>${l.riqi}</td>
                    <td><a href="#" onclick="popWin(this);">${l.student_name}</a></td>
                    <td>${l.course}</td>
                    <td>${l.keshi}</td>
                    <td>${l.teacher_name}</td>
                    <td>${l.jine}</td>
                    <td>
                        <a href="<%=request.getContextPath() %>/keshi/toupd.action?id=${l.id}"><img
                                src="<%=request.getContextPath() %>/img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="<%=request.getContextPath() %>/keshi/del.action?id=${l.id}" class="removeProvider"
                           onclick="return confirm('您确认要删除本记录么？')"><img
                                src="<%=request.getContextPath() %>/img/schu.png" alt="删除" title="删除"/></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="page">
            <div class="page_cell"><a class="page-btn" href="<%=request.getContextPath() %>/keshi/getList1.action">首页</a></div>
            <div class="page_cell" onclick="last_page(<%=session.getAttribute("page")%>)"><a class="page-btn"
                    href="<%=request.getContextPath() %>/keshi/getList2.action">上一页</a></div>
            <div style="float: left;margin: 2px ;height: 40px; font-size: 16px;color: #0802e9;display: flex;justify-content: center;align-items: center;"><%=session.getAttribute("page")%>页</div>
            <div class="page_cell" onclick="next_page(<%=session.getAttribute("page")%>)"><a class="page-btn"
                    href="<%=request.getContextPath() %>/keshi/getList3.action">下一页</a></div>
            <div class="page_cell"><a class="page-btn" href="<%=request.getContextPath() %>/keshi/getList4.action">末页</a></div>
        </div>


        <div id="light" class="pop_win">
            <table id="data2" class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="15%">学生姓名</th>
                    <th width="15%">性别</th>
                    <th width="15%">报名日期</th>
                    <th width="15%">培训课程</th>
                    <th width="15%">责任教师</th>
                    <th width="15%">班级</th>
                    <th width="15%">电话</th>
                </tr>
                <tr>
                    <td id="RealName"></td>
                    <td id="Sex"></td>
                    <td id="rgdate"></td>
                    <td id="Course"></td>
                    <td id="Teacher"></td>
                    <td id="Classnum"></td>
                    <td id="phone"></td>
                </tr>
            </table>
        </div>
        <div id="fade" class="black_overlay"><a href="javascript:void(0)" onclick="closeWin();"
                                                style="float: right;color: white"
                                                class="fancybox-button fancybox-button--close">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="background: white">
                <path d="M12 10.6L6.6 5.2 5.2 6.6l5.4 5.4-5.4 5.4 1.4 1.4 5.4-5.4 5.4 5.4 1.4-1.4-5.4-5.4 5.4-5.4-1.4-1.4-5.4 5.4z"></path>
            </svg>
        </a></div>
        </div>
    </div>
</section>


<footer class="footer">
</footer>

<script src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script src="<%=request.getContextPath() %>/js/js.js"></script>
<script src="<%=request.getContextPath() %>/js/time.js"></script>

</body>

<script type="text/javascript">
    function popWin(td) {
        document.getElementById('light').style.display = 'block';
        document.getElementById('fade').style.display = 'block';

        var parentTR = td.parentNode.parentNode;
        var firstTd_value = $(parentTR).children('td').eq(2).text();

        $.ajax({
            type: 'post',
            url: '../stu/getListByName.action',
            data: {
                RealName: firstTd_value,
            },
            success: function (result) {
                console.log(result);
                var user = eval('(' + result + ')');
                $('#RealName').html(user[0]);
                $('#Sex').html(user[1]);
                $('#rgdate').html(user[2]);
                $('#Course').html(user[3]);
                $('#Teacher').html(user[4]);
                $('#Classnum').html(user[5]);
                $('#phone').html(user[6]);
            }, error: function () {
                alert("error!");
            }
        })
    }

    function closeWin() {
        document.getElementById('light').style.display = 'none';
        document.getElementById('fade').style.display = 'none'
    }


    var element = document.getElementById("toExcel");
    var toExcel = function (event) {
        var html = "<html><head><meta charset='UTF-8'></head><body>" + document.getElementById("data").outerHTML + "</body></html>";
        var html2 = document.getElementById("data");
        var zhong_html = "<html><head><meta charset='UTF-8'></head><body><table><tbody>"
        var rows = html2.rows;
        var columns = rows[0].cells.length;

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
                    if (j == 2) {
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
        var blob = new Blob([zhong_html], {type: "application/vnd.ms-excel"});
        var a = event.target;
        a.href = URL.createObjectURL(blob);
        a.download = "课时统计";
    };
    element.onclick = toExcel;

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
</script>
</html>