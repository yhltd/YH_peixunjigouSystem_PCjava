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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/min.css"/>
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
                <li><a href="<%=request.getContextPath() %>/stu/student.action">学生信息</a></li>
                <li><a href="<%=request.getContextPath() %>/pay/payment.action">缴费记录</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getList.action">课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/inc/income.action">收支明细</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/arr.action">欠费学生</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/jisuan.jsp">教师工资</a></li>
                <li><a href="<%=request.getContextPath() %>/teacher/kstj.action">教师课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/teacher.action">用户管理</a></li>
                <li><a href="<%=request.getContextPath() %>/help.jsp">帮助</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>收入支出明细表</span>
        </div>

        <div class="search">
            <span style="color:red">${msg}</span>
            <form action="<%=request.getContextPath()%>/inc/select.action"
                  method="post" id="myForm"></form>
            <span>起始：</span>
            <input type="date"  name="rgdate" form="myForm"/>
            <span>结束</span>
            <input type="date"  name="rgdate2" form="myForm"/>

            <input type="submit" value="查询" form="myForm"/>
            <a id="toExcel" >导出excel</a>
            <a href="<%=request.getContextPath()%>/inc/shezhi.action">添加明细</a>
        </div>
        <table id="data"  class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="15%" rowspan="2">日期</th>
                <th width="30%" colspan="3">收入</th>
                <th width="30%" colspan="3">支出</th>
                <th width="10%" rowspan="2">经手人</th>
            </tr>
            <tr class="firstTr">
                <th width="10%">金额</th>
                <th width="10%">分类</th>
                <th width="10%">备注</th>
                <th width="10%">金额</th>
                <th width="10%">分类</th>
                <th width="10%">备注</th>
            </tr>
            <c:forEach items="${inclist }" var="s">
                <tr>
                    <td>${s.rgdate}</td>
                    <td>${s.money}</td>
                    <td>${s.msort}</td>
                    <td>${s.mremark}</td>
                    <td>${s.paid}</td>
                    <td>${s.psort}</td>
                    <td>${s.premark}</td>
                    <td>${s.handle}</td>
                    <td>
                        <a href="<%=request.getContextPath() %>/inc/toUpdate.action?id=${s.id}"><img src="<%=request.getContextPath() %>/img/read.png" alt="查看" title="查看"/></a>
                        <a href="<%=request.getContextPath() %>/inc/toUpdate.action?id=${s.id}"><img src="<%=request.getContextPath() %>/img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="<%=request.getContextPath() %>/inc/delete.action?id=${s.id}" class="removeProvider" onclick="return confirm('您确认要删除本记录么？')"><img src="<%=request.getContextPath() %>/img/schu.png" alt="删除" title="删除"/></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div id="min5">
            <div id="min6">
                收支汇总
            </div>
            <div id="min7">
                <li class="min8">
                    <div class="min10">累计收入</div>
                    <div class="min9">
                        <c:forEach items="${inclist}" begin="0" end="0" var="use" >
                            ${use.mall }
                        </c:forEach>
                    </div>
                </li>
                <li class="min8">
                    <div class="min10">累计支出</div>
                    <div class="min9">
                        <c:forEach items="${inclist}" begin="0" end="0" var="use" >
                            ${use.pall }
                        </c:forEach>
                    </div>
                </li>
                <li class="min8">
                    <div class="min10">学费收入</div>
                    <div class="min9">
                        <c:forEach items="${inclist}" begin="0" end="0" var="use" >
                            ${use.xall }
                        </c:forEach>
                    </div>
                </li>
                <li class="min8">
                    <div class="min10">累计结余</div>
                    <div class="min9">
                        <c:forEach items="${inclist}" begin="0" end="0" var="use" >
                            ${use.yall }
                        </c:forEach>
                    </div>
                </li>
            </div>
        </div>
<%--        <div style="width: 600px; height: 400px; overflow-x: scroll;margin-right: 1px">--%>
<%--            <div id="main" style="width: 600px;height: 400px;"></div>--%>
<%--        </div>--%>
    </div>
</section>


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
        var blob=new Blob([html],{type:"application/vnd.ms-excel"});
        var a=event.target;
        a.href=URL.createObjectURL(blob);
        a.download="收支明细";
    }
    element.onclick=toExcel;

</script>
<%--<script type="text/javascript">--%>
<%--    var renyuanChart = echarts.init(document.getElementById('main'));--%>
<%--    renyuanChart.showLoading();--%>
<%--    $.get('/inc/select.action').done(function (data) {--%>
<%--        renyuanChart.hideLoading();--%>
<%--        data = JSON.parse(data);--%>

<%--        var columns = []--%>
<%--        var values = []--%>
<%--        for (let col in data){--%>
<%--            columns.push(col);--%>
<%--            values.push(data[col])--%>
<%--        }--%>

<%--        renyuanChart.setOption({--%>
<%--            title: {--%>
<%--                text: "",--%>
<%--                textStyle:{--%>
<%--                    color:'#000000', //颜色--%>
<%--                    fontStyle:'normal', //风格--%>
<%--                    fontWeight:'normal', //粗细--%>
<%--                    fontFamily:'Microsoft yahei', //字体--%>
<%--                    fontSize:20, //大小--%>
<%--                    align:'center' //水平对齐--%>
<%--                },--%>
<%--            },--%>
<%--            grid:{--%>
<%--                left:'14px'--%>
<%--            },--%>
<%--            tooltip: {--%>
<%--                trigger: "axis",--%>
<%--                axisPointer: {--%>
<%--                    type: "shadow"--%>
<%--                }--%>
<%--            },--%>
<%--            xAxis: {--%>
<%--                type: category,--%>
<%--                data: [累计收入, 累计支出, 学费收入, 累计结余]--%>
<%--            },--%>
<%--            yAxis: {--%>
<%--                type: value--%>
<%--            },--%>
<%--            series: [{--%>
<%--                data: [${use.mall },${use.pall }, ${use.xall }, ${use.yall }],--%>
<%--                type: bar,--%>
<%--                label: {--%>
<%--                    show: true,--%>
<%--                    position: top--%>
<%--                },--%>
<%--            }],--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
</html>