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
    <a href="#" style="color: red">${msg}</a>
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
                <li><a href="<%=request.getContextPath() %>/stu/ksclass.action">收支明细</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/arr.action">欠费学员</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/jisuan.jsp">教师工资</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getTeacherKeshiList.action">教师课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/teacher.action">用户管理</a></li>
                <li><a href="<%=request.getContextPath() %>/pdf/云合教务管理系统_使用说明.rar">帮助</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>教师课表 >> 教师课表增加页面</span>
        </div>
        <div class="providerAdd">
            <form action="<%=request.getContextPath() %>/kaoqin/add.action">
                <div>
                    <label for="s_name">姓名：</label>
                    <input type="text" name="s_name" id="s_name" value="${kaoqin.s_name }"/>
                </div>
                <div>
                    <label  for="nian">年：</label>
                    <input type="number" name="nian" id="nian" value="${kaoqin.nian}"/>
                </div>
                <div>
                    <label for="yue">月：</label>
                    <input hidden="hidden" id="yue_id" value="${kaoqin.yue }"/>
                    <select name="yue" id="yue" style="width: 270px">
                        <option>1月</option>
                        <option>2月</option>
                        <option>3月</option>
                        <option>4月</option>
                        <option>5月</option>
                        <option>6月</option>
                        <option>7月</option>
                        <option>8月</option>
                        <option>9月</option>
                        <option>10月</option>
                        <option>11月</option>
                        <option>12月</option>
                    </select>
                </div>
                <div>
                    <label for="ri1">1：</label>
                    <input hidden="hidden" id="ri1_id" value="${kaoqin.ri1 }"/>
                    <select name="ri1" id="ri1" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri2">2：</label>
                    <input hidden="hidden" id="ri2_id" value="${kaoqin.ri2 }"/>
                    <select name="ri2" id="ri2" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri3">3：</label>
                    <input hidden="hidden" id="ri3_id" value="${kaoqin.ri3 }"/>
                    <select name="ri3" id="ri3" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri4">4：</label>
                    <input hidden="hidden" id="ri4_id" value="${kaoqin.ri4 }"/>
                    <select name="ri4" id="ri4" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri5">5：</label>
                    <input hidden="hidden" id="ri5_id" value="${kaoqin.ri5 }"/>
                    <select name="ri5" id="ri5" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri6">6：</label>
                    <input hidden="hidden" id="ri6_id" value="${kaoqin.ri6 }"/>
                    <select name="ri6" id="ri6" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri7">7：</label>
                    <input hidden="hidden" id="ri7_id" value="${kaoqin.ri7 }"/>
                    <select name="ri7" id="ri7" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri8">8：</label>
                    <input hidden="hidden" id="ri8_id" value="${kaoqin.ri8 }"/>
                    <select name="ri8" id="ri8" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri9">9：</label>
                    <input hidden="hidden" id="ri9_id" value="${kaoqin.ri9 }"/>
                    <select name="ri9" id="ri9" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri10">10：</label>
                    <input hidden="hidden" id="ri_id10" value="${kaoqin.ri10 }"/>
                    <select name="ri10" id="ri10" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri11">11：</label>
                    <input hidden="hidden" id="ri11_id" value="${kaoqin.ri11 }"/>
                    <select name="ri11" id="ri11" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri12">12：</label>
                    <input hidden="hidden" id="ri12_id" value="${kaoqin.ri12 }"/>
                    <select name="ri12" id="ri12" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri13">13：</label>
                    <input hidden="hidden" id="ri13_id" value="${kaoqin.ri13 }"/>
                    <select name="ri13" id="ri13" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri14">14：</label>
                    <input hidden="hidden" id="ri14_id" value="${kaoqin.ri14 }"/>
                    <select name="ri14" id="ri14" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri15">15：</label>
                    <input hidden="hidden" id="ri15_id" value="${kaoqin.ri15 }"/>
                    <select name="ri15" id="ri15" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri16">16：</label>
                    <input hidden="hidden" id="ri_id16" value="${kaoqin.ri16 }"/>
                    <select name="ri16" id="ri16" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri17">17：</label>
                    <input hidden="hidden" id="ri17_id" value="${kaoqin.ri17 }"/>
                    <select name="ri17" id="ri17" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri18">18：</label>
                    <input hidden="hidden" id="ri18_id" value="${kaoqin.ri18 }"/>
                    <select name="ri18" id="ri18" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri19">19：</label>
                    <input hidden="hidden" id="ri19_id" value="${kaoqin.ri19 }"/>
                    <select name="ri19" id="ri19" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri20">20：</label>
                    <input hidden="hidden" id="ri20_id" value="${kaoqin.ri20 }"/>
                    <select name="ri20" id="ri20" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri21">21：</label>
                    <input hidden="hidden" id="ri21_id" value="${kaoqin.ri21 }"/>
                    <select name="ri21" id="ri21" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri22">22：</label>
                    <input hidden="hidden" id="ri22_id" value="${kaoqin.ri22 }"/>
                    <select name="ri22" id="ri22" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri23">23：</label>
                    <input hidden="hidden" id="ri23_id" value="${kaoqin.ri23 }"/>
                    <select name="ri23" id="ri23" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri24">24：</label>
                    <input hidden="hidden" id="ri24_id" value="${kaoqin.ri24 }"/>
                    <select name="ri24" id="ri24" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri25">25：</label>
                    <input hidden="hidden" id="ri25_id" value="${kaoqin.ri25 }"/>
                    <select name="ri25" id="ri25" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri26">26：</label>
                    <input hidden="hidden" id="ri26_id" value="${kaoqin.ri26 }"/>
                    <select name="ri26" id="ri26" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri27">27：</label>
                    <input hidden="hidden" id="ri_id27" value="${kaoqin.ri27 }"/>
                    <select name="ri27" id="ri27" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri28">28：</label>
                    <input hidden="hidden" id="ri28_id" value="${kaoqin.ri28 }"/>
                    <select name="ri28" id="ri28" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri29">29：</label>
                    <input hidden="hidden" id="ri29_id" value="${kaoqin.ri29 }"/>
                    <select name="ri29" id="ri29" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri30">30：</label>
                    <input hidden="hidden" id="ri30_id" value="${kaoqin.ri30 }"/>
                    <select name="ri30" id="ri30" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div>
                    <label for="ri31">31：</label>
                    <input hidden="hidden" id="ri31_id" value="${kaoqin.ri31 }"/>
                    <select name="ri31" id="ri31" style="width: 270px">
                        <option></option>
                        <option>出勤</option>
                        <option>缺勤</option>
                        <option>请假</option>
                    </select>
                </div>
                <div class="providerAddBtn">
                    <input id="pl" value="批量" onclick="pl"/>
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
<script>
    function shujv() {
        alert($('#rongliang').val());
        return false;
    }

    var pl =document.getElementById("pl")
    pl.onclick=function(){
        var ri1 = document.getElementById("ri1");
        ri1.value='出勤';
        var ri2 = document.getElementById("ri2");
        ri2.value='出勤';
        var ri3 = document.getElementById("ri3");
        ri3.value='出勤';
        var ri4 = document.getElementById("ri4");
        ri4.value='出勤';
        var ri5 = document.getElementById("ri5");
        ri5.value='出勤';
        var ri6 = document.getElementById("ri6");
        ri6.value='出勤';
        var ri7 = document.getElementById("ri7");
        ri7.value='出勤';
        var ri8 = document.getElementById("ri8");
        ri8.value='出勤';
        var ri9 = document.getElementById("ri9");
        ri9.value='出勤';
        var ri10 = document.getElementById("ri10");
        ri10.value='出勤';
        var ri11 = document.getElementById("ri11");
        ri11.value='出勤';
        var ri12 = document.getElementById("ri12");
        ri12.value='出勤';
        var ri13 = document.getElementById("ri13");
        ri13.value='出勤';
        var ri14 = document.getElementById("ri14");
        ri14.value='出勤';
        var ri15 = document.getElementById("ri15");
        ri15.value='出勤';
        var ri16 = document.getElementById("ri16");
        ri16.value='出勤';
        var ri17 = document.getElementById("ri17");
        ri17.value='出勤';
        var ri18 = document.getElementById("ri18");
        ri18.value='出勤';
        var ri19 = document.getElementById("ri19");
        ri19.value='出勤';
        var ri20 = document.getElementById("ri20");
        ri20.value='出勤';
        var ri21 = document.getElementById("ri21");
        ri21.value='出勤';
        var ri22 = document.getElementById("ri22");
        ri22.value='出勤';
        var ri23 = document.getElementById("ri23");
        ri23.value='出勤';
        var ri24 = document.getElementById("ri24");
        ri24.value='出勤';
        var ri25 = document.getElementById("ri25");
        ri25.value='出勤';
        var ri26 = document.getElementById("ri26");
        ri26.value='出勤';
        var ri27 = document.getElementById("ri27");
        ri27.value='出勤';
        var ri28 = document.getElementById("ri28");
        ri28.value='出勤';
        var ri29 = document.getElementById("ri29");
        ri29.value='出勤';
        var ri30 = document.getElementById("ri30");
        ri30.value='出勤';
        var ri31 = document.getElementById("ri31");
        ri31.value='出勤';
    }
</script>
</html>