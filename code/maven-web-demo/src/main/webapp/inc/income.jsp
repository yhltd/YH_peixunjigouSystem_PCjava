<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="../img/mm.png" />
    <title>教务管理系统</title>
    <script src="<%=request.getContextPath() %>/echarts/echarts.js"></script>
<%--    <%=request.getContextPath() %>/echarts/--%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/public.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/min.css"/>
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
                <li><a href="<%=request.getContextPath() %>/teacher/kstj.action">教师课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/teacher.action">用户管理</a></li>
                <li><a href="<%=request.getContextPath() %>/pdf/云合教务管理系统_使用说明.rar">帮助</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>收支明细</span>
            <div title="此页面为收支明细，这里可以增删改查，下方可以统计支出和收入金额以及生成图表" style="color: red">*</div>
        </div>

        <div class="search" style="background: url('<%=request.getContextPath()%>/img/background3.jpeg')  repeat center!important;background-size:100% 100%;">
            <span style="color:red">${msg}</span>
            <form action="<%=request.getContextPath()%>/inc/select.action"
                  method="post" id="myForm"></form>
            <span>起始：</span>
            <input type="date" id="ks"  name="rgdate" form="myForm"/>
            <span>结束</span>
            <input type="date" id="js" name="rgdate2" form="myForm"/>

            <input type="submit" id="sel_button" value="查询" form="myForm"/>
            <span>当日金额统计：${jr_jine}</span>
            <span>当月金额统计：${dy_jine}</span>
            <a id="toExcel" >导出excel</a>
            <a href="<%=request.getContextPath()%>/inc/shezhi.action">添加明细</a>
        </div>
        <table id="data"  class="providerTable" cellpadding="0" cellspacing="0">
            <caption style="font-size: 14px;margin-bottom: 0.5%;">收支明细</caption>
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
<%--                        <a href="<%=request.getContextPath() %>/inc/toUpdate.action?id=${s.id}"><img src="<%=request.getContextPath() %>/img/read.png" alt="查看" title="查看"/></a>--%>
                        <a href="<%=request.getContextPath() %>/inc/toUpdate.action?id=${s.id}"><img src="<%=request.getContextPath() %>/img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="<%=request.getContextPath() %>/inc/delete.action?id=${s.id}" class="removeProvider" onclick="return confirm('您确认要删除本记录么？')"><img src="<%=request.getContextPath() %>/img/schu.png" alt="删除" title="删除"/></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div id="min5" >
            <div id="min6">
                收支汇总
            </div>
            <div id="min7">
                <li class="min8">
                    <div class="min10">累计收入</div>
                    <div class="min9">
                        <span id="shouru">
                            <c:forEach items="${inclist}" begin="0" end="0" var="use" >
                                ${use.mall }
                            </c:forEach>
                        </span>
                    </div>
                </li>
                <li class="min8">
                    <div class="min10">累计支出</div>
                    <div class="min9">
                        <span id="zhichu">
                            <c:forEach items="${inclist}" begin="0" end="0" var="use" >
                                ${use.pall }
                            </c:forEach>
                        </span>
                    </div>
                </li>
                <li class="min8">
                    <div class="min10">学费收入</div>
                    <div class="min9">
                        <span id="xuefei">
                            <c:forEach items="${inclist}" begin="0" end="0" var="use" >
                                ${use.xall }
                            </c:forEach>
                        </span>
                    </div>
                </li>
                <li class="min8">
                    <div class="min10">累计结余</div>
                    <div class="min9">
                        <span id="jieyu">
                            <c:forEach items="${inclist}" begin="0" end="0" var="use" >
                                ${use.yall }
                            </c:forEach>
                        </span>
                    </div>
                </li>
            </div>
        </div>
        <div id="main" style="width: 600px;height:400px;"></div>

<%--margin-top: -36%;margin-left: 50%--%>
<%--        <div style="width: 600px; height: 400px; overflow-x: scroll;margin-right: 1px">--%>
<%--            <div id="main" style="width: 600px;height: 400px;"></div>--%>
<%--        </div>--%>
    </div>
</section>


<footer class="footer">
</footer>

<script src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script src="<%=request.getContextPath() %>/js/jquerysession.js"></script>
<script src="<%=request.getContextPath() %>/js/js.js"></script>
<script src="<%=request.getContextPath() %>/js/time.js"></script>

</body>
<script type="text/javascript">
    $(function () {
        $('#ks').val($.session.get('ks'));
        $('#js').val($.session.get('js'));
        $.session.set('ks', '');
        $.session.set('js', '');

        $('#sel_button').click(function () {
            $.session.set('ks', $('#ks').val());
            $.session.set('js', $('#js').val());
        })
    });


    var element=document.getElementById("toExcel");
    var toExcel=function (event) {
        var html="<html><head><meta charset='UTF-8'></head><body>"+document.getElementById("data").outerHTML+"</body></html>";
        var html2 = document.getElementById("data");
        var zhong_html = "<html><head><meta charset='UTF-8'></head><body><table><tbody>";
        var rows = html2.rows;
        var columns = rows[0].cells.length;

        for (var i = 0;i<rows.length;i++){
            zhong_html += "<tr>";
            var cells=rows[i].cells;
            var lie = "";
            var lie2 = "";
            if(i==0){
                lie = cells.length;
                lie2 = cells.length-1
            }else{
                lie = cells.length-1;
                lie2 = cells.length -2
            }

            for(var j = 0;j<lie;j++){
                var cells2 = cells[j].outerHTML;
                zhong_html += cells2;
                if (j == lie2){
                    zhong_html += "</tr>"
                }
            }
        }
        zhong_html += "</tbody></table></body></html>";
        var blob=new Blob([zhong_html],{type:"application/vnd.ms-excel"});
        var a=event.target;
        a.href=URL.createObjectURL(blob);
        a.download="收支明细";
    };
    element.onclick=toExcel;


    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    var shouru=document.getElementById("shouru").innerText;
    var zhichu=document.getElementById("zhichu").innerText;
    var xuefei=document.getElementById("xuefei").innerText;
    var jieyu=document.getElementById("jieyu").innerText;
    var list=[shouru,zhichu,xuefei,jieyu];
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '收支汇总'
        },
        tooltip: {},
        legend: {
            data: ['金额']
        },
        xAxis: {
            data: ['累计收入', '累计支出', '学费收入', '累计结余']
        },
        yAxis: {},
        series: [
            {
                name: '金额',
                type: 'bar',
                data: list,
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

    function shujv() {
        alert($('#rongliang').val());
        return false;
    }
</script>

</html>

