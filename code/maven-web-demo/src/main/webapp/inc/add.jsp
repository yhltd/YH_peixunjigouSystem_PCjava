<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="../img/mm.png" />
    <title>教务训管理系统</title>
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
                <%--原有代码     <li><a href="<%=request.getContextPath() %>/tea/teacher.action">设置</a></li>--%>
                <li><a href="<%=request.getContextPath() %>/te/shezhi.action">设置</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/student1.action">学生信息</a></li>
                <li><a href="<%=request.getContextPath() %>/teacherInfo/getList1.action">教师信息</a></li>
                <li><a href="<%=request.getContextPath() %>/pay/payment1.action">缴费记录</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getList1.action">课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/ksclass.action">收支明细</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/arr.action">欠费学员</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/jisuan.jsp">教师工资</a></li>
                <li><a href="<%=request.getContextPath() %>/teacher/kstj.action">教师课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/teacher.action">用户管理</a></li>
                <li><a href="<%=request.getContextPath() %>/pdf/云合培训管理系统_PC.pdf">帮助</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>收支明细 >> 收入支出明细增加页面</span>
        </div>
        <div class="providerAdd">
            <form action="<%=request.getContextPath() %>/inc/add.action">
                <div>
                    <label for="rgdate">日期：</label>
                    <%--    原先代码     <input type="text" name="rgdate" id="rgdate" value="${income.rgdate }"/>--%>
                    <input type="date" name="rgdate" id="rgdate"/>
                </div>
                <div>
                    <label  for="money">收入金额：</label>
                    <input type="number" name="money" id="money" value="${income.money }"/>
                </div>
                <%--  <div>
                     <label for="msort">收入分类：</label>
                     <%--    原有代码     <input type="text" name="msort" id="msort" value="${income.msort }"/>--%>
                <%-- <select name="msort" id="msort" style="width: 270px">
                    <option> </option>
                    <option>周边</option>
                    <option>学费</option>
                    <option>书本</option>
                </select>
            </div>--%>



            <div>
                <label for="msort">收入分类：</label>
                <%--    原有代码     <input type="text" name="type" id="type" value="${student.type }"/>--%>
                    <select name="msort" id="msort" style="width: 270px">
                        <%--                        <option >意向预定</option>--%>
                        <%--                        <option selected>在训</option>--%>
                        <%--                        <option >暂停</option>--%>
                        <%--                        <option >结束</option>--%>
                        <%--                        <option >退学</option>--%>
                            <option selected="selected"></option>
                        <c:forEach items="${shezhiList }" var="s">
                            <option >${s.msort}</option>
                        </c:forEach>
                    </select>

                </div>



                <div>
                    <label for="mremark">收入备注：</label>
                    <input type="text" name="mremark" id="mremark" value="${income.mremark }"/>
                </div>
            <div>
                    <label for="paid">支出金额：</label>
                    <input type="number" name="paid" id="paid" value="${income.paid }"/>
                </div>
                <%--   <div>
                     <label for="psort">支出分类：</label>
                     <%--    原有代码     <input type="text" name="psort" id="psort" value="${income.psort }"/>--%>
                <%--    <select name="psort" id="psort" style="width: 270px">
                      <option> </option>
                      <option>宣传支出</option>
                      <option>场地租金</option>
                      <option>水电费</option>
                  </select>
              </div>--%>



              <div>
              <label for="psort">支出分类：</label>
              <%--    原有代码     <input type="text" name="type" id="type" value="${student.type }"/>--%>
                <select name="psort" id="psort" style="width: 270px">
                    <%--                        <option >意向预定</option>--%>
                    <%--                        <option selected>在训</option>--%>
                    <%--                        <option >暂停</option>--%>
                    <%--                        <option >结束</option>--%>
                    <%--                        <option >退学</option>--%>
                        <option selected="selected"></option>
                    <c:forEach items="${List }" var="s">
                        <option >${s.psort}</option>
                    </c:forEach>
                </select>

        </div>


                    <div>
                       <label for="premark">支出备注：</label>
                       <input type="text" name="premark" id="premark" value="${income.premark }"/>
                   </div>


                <div>
                       <label for="handle">经手人：</label>
                       <%--    原有代码     <input type="text" name="handle" id="handle" value="${income.handle }"/>--%>
                    <select name="handle" id="handle" style="width: 270px">
                        <option> </option>
                        <option >琪一</option>
                        <option >陈二</option>
                        <option >张三</option>
                        <option >李四</option>
                        <option >王五</option>
                    </select>
                    <span >*</span>
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
<script>
    function shujv() {
        alert($('#rongliang').val());
        return false;
    }
</script>
</html>