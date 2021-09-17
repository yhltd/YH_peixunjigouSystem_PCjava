<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>培训管理系统</title>
  <link rel="stylesheet"
        href="<%=request.getContextPath()%>/css/public.css" />
  <link rel="stylesheet"
        href="<%=request.getContextPath()%>/css/style.css" />
</head>
<body>
<!--头部-->
<header class="publicHeader">
  <h1>培训管理系统</h1>

  <div class="publicHeaderR">
    <p>
      <span>下午好！</span><span style="color: #fff21b">${teacher.userName}</span>
      , 欢迎你！
    </p>
    <a href="<%=request.getContextPath()%>/login.jsp">退出</a>
  </div>
</header>
<!--时间-->
<section class="publicTime">
  <span id="time"></span>
</section>
<!--主体内容-->
<section class="publicMian ">
  <div class="left">
    <h2 class="leftH2">
      <span class="span1"></span>功能列表 <span></span>
    </h2>
    <nav>
      <ul class="list">
        <li><a href="<%=request.getContextPath()%>/main.jsp">主页</a></li>
        <%--原有代码         <li><a href="<%=request.getContextPath() %>/tea/teacher.action">设置</a></li>--%>
        <li><a href="<%=request.getContextPath() %>/te/shezhi.action">设置</a></li>
        <li><a href="<%=request.getContextPath()%>/stu/student.action">学生信息</a></li>
        <li><a href="<%=request.getContextPath()%>/pay/payment.action">缴费记录</a></li>
        <li><a href="<%=request.getContextPath() %>/keshi/getList.action">课时统计</a></li>
        <li><a href="<%=request.getContextPath() %>/inc/income.action">收支明细</a></li>
        <li><a href="<%=request.getContextPath() %>/stu/arr.action">欠费学生</a></li>
        <li><a href="<%=request.getContextPath() %>/stu/inq1.jsp">学生查询</a></li>
        <li><a href="<%=request.getContextPath() %>/keshi/getTeacherKeshiList.action">教师课时统计</a></li>
        <li><a href="<%=request.getContextPath() %>/tea/teacher.action">用户管理</a></li>
        <li><a href="<%=request.getContextPath() %>/help.jsp">帮助</a></li>
      </ul>
    </nav>
  </div>
  <div class="right">
    <div class="location">
      <strong>你现在所在的位置是:</strong> <span>收支明细表 >> 收支明细修改页面</span>
    </div>
    <div class="search">
      <span style="color:red">${msg}</span>
    </div>
    <div class="providerAdd">
      <form action="<%=request.getContextPath()%>/inc/update.action">
        <div>
          <label for="id">序号：</label>
          <input type="text" readonly="readonly" name="id" id="id" value="${income.id}"/>
          <span >*</span>
        </div>

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
          <input type="number" name="msort" id="msort" value="${income.msort }"/>

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
          <input type="text" name="psort" id="psort" value="${income.premark }"/>

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
          <input type="submit" value="保存" onclick="history.back(-1)" />
          <input	type="button" value="返回" onclick="history.back(-1)" />
        </div>
      </form>
    </div>

  </div>
</section>
<footer class="footer"> </footer>
<script src="<%=request.getContextPath()%>/js/time.js"></script>

</body>
</html>