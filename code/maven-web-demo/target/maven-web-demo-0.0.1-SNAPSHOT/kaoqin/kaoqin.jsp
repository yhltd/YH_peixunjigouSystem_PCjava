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
</head>
<body>
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
                <li><a href="<%=request.getContextPath() %>/pdf/云合培训管理系统_PC.pdf">帮助</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>考勤表</span>
            <div title="考勤表页面可以对考勤信息进行增删改查操作" style="color: red">*</div>
        </div>
        <div class="search" style="background: url('<%=request.getContextPath()%>/img/background3.jpeg')  repeat center!important;background-size:100% 100%;">
            <span style="color:red">${msg}</span>
            <form action="<%=request.getContextPath()%>/kaoqin/getList1.action"
                  method="post" id="myForm"></form>
            <input type="text" placeholder="请输入姓名" name="s_name" form="myForm"/>
            <input type="submit" value="查询" form="myForm" style="width:90px"/>
            <a href="<%=request.getContextPath() %>/kaoqin/add.jsp" style="width:70px">添加信息</a>

        </div>
        <table id="data" class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th>序号</th>
                <th>姓名</th>
                <th>年</th>
                <th>月</th>
                <th>1</th>
                <th>2</th>
                <th>3</th>
                <th>4</th>
                <th>5</th>
                <th>6</th>
                <th>7</th>
                <th>8</th>
                <th>9</th>
                <th>10</th>
                <th>11</th>
                <th>12</th>
                <th>13</th>
                <th>14</th>
                <th>15</th>
                <th>16</th>
                <th>17</th>
                <th>18</th>
                <th>19</th>
                <th>20</th>
                <th>21</th>
                <th>22</th>
                <th>23</th>
                <th>24</th>
                <th>25</th>
                <th>26</th>
                <th>27</th>
                <th>28</th>
                <th>29</th>
                <th>30</th>
                <th>31</th>
            </tr>
            <c:forEach items="${list }" var="kq">
                <tr>
                    <td>${kq.id}</td>
                    <td>${kq.s_name}</td>
                    <td>${kq.nian}</td>
                    <td>${kq.yue}</td>
                    <td>${kq.ri1}</td>
                    <td>${kq.ri2}</td>
                    <td>${kq.ri3}</td>
                    <td>${kq.ri4}</td>
                    <td>${kq.ri5}</td>
                    <td>${kq.ri6}</td>
                    <td>${kq.ri7}</td>
                    <td>${kq.ri8}</td>
                    <td>${kq.ri9}</td>
                    <td>${kq.ri10}</td>
                    <td>${kq.ri11}</td>
                    <td>${kq.ri12}</td>
                    <td>${kq.ri13}</td>
                    <td>${kq.ri14}</td>
                    <td>${kq.ri15}</td>
                    <td>${kq.ri16}</td>
                    <td>${kq.ri17}</td>
                    <td>${kq.ri18}</td>
                    <td>${kq.ri19}</td>
                    <td>${kq.ri20}</td>
                    <td>${kq.ri21}</td>
                    <td>${kq.ri22}</td>
                    <td>${kq.ri23}</td>
                    <td>${kq.ri24}</td>
                    <td>${kq.ri25}</td>
                    <td>${kq.ri26}</td>
                    <td>${kq.ri27}</td>
                    <td>${kq.ri28}</td>
                    <td>${kq.ri29}</td>
                    <td>${kq.ri30}</td>
                    <td>${kq.ri31}</td>
                    <td>
                        <a href="<%=request.getContextPath() %>/kaoqin/toUpdate.action?id=${kq.id}"><img src="<%=request.getContextPath() %>/img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="<%=request.getContextPath() %>/kaoqin/delete.action?id=${kq.id}" class="removeProvider" onclick="return confirm('您确认要删除本记录么？')"><img src="<%=request.getContextPath() %>/img/schu.png" alt="删除" title="删除"/></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="page">
            <div class="page_cell"><a href="<%=request.getContextPath() %>/kaoqin/getList1.action">首页</a></div>
            <div class="page_cell" onclick="last_page(<%=session.getAttribute("page")%>)"><a href="<%=request.getContextPath() %>/kaoqin/getList2.action">上一页</a></div>
            <div style="float: left;margin: 2px"><%=session.getAttribute("page")%>页</div>
            <div class="page_cell" onclick="next_page(<%=session.getAttribute("page")%>)"><a href="<%=request.getContextPath() %>/kaoqin/getList3.action">下一页</a></div>
            <div class="page_cell"><a href="<%=request.getContextPath() %>/kaoqin/getList4.action">末页</a></div>
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
</script>
</html>