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
    <script src="<%=request.getContextPath() %>/js/jquery.js"></script>
    <script src="<%=request.getContextPath() %>/js/qrcode.min.js"></script>
    <style>
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
        <a style="box-sizing: border-box;" onclick="shujv()" >数据空间</a>
        <a style="box-sizing: border-box;" href="<%=request.getContextPath() %>/login.jsp">退出</a>
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
    <div class="right">
        <div class="all">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理</span>
            <span id="time"></span>
            <div title="此页面为用户管理，此页面可配置各账号信息" style="color: red">*</div>
        </div>
        <div class="search" style="background-size:100% 100%;">
<%--            <span style="color:red">${msg}</span>--%>
            <form action="<%=request.getContextPath()%>/tea/teacher1.action"
                  method="post" id="myForm"></form>
            <input type="text" placeholder="请输入登录名" name="realName" form="myForm" style="height: 40px;width: 120px;border: 1px solid #0f0f0f;border-radius: 4px"/>
            <input type="text" placeholder="请输入真实姓名" name="teacher" form="myForm" style="height: 40px;width: 120px;border: 1px solid #0f0f0f;border-radius: 4px"/>
            <input type="text" placeholder="请输入电话号" name="peixun" form="myForm"/>
            <input type="submit" value="查询" form="myForm"/>
            <a class="btn-3d" id="toExcel" >导出excel</a>
            <a class="btn-3d" href="<%=request.getContextPath()%>/tea/add.jsp">添加员工</a>
            <a class="btn-3d" href="<%=request.getContextPath()%>/power/getList1.action">权限管理</a>
        </div>
        <div id="qrcode" style="display: none"></div>
        <table id="data" class="gradient-table">
<%--            <caption style="font-size: 14px;margin-bottom: 0.5%;">用户管理</caption>--%>
            <tr class="firstTr">
                <th width="5%">序号</th>
                <th width="10%">登录名</th>
                <th width="10%">密码</th>
                <th width="10%">真实姓名</th>
                <th width="5%">用户类别</th>
                <th width="5%">年龄</th>
                <th width="10%">电话</th>
                <th width="10%">家庭住址</th>
                <th width="10%">身份证号</th>
                <th width="5%">学历</th>
                <th width="5%">状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${telist }" var="s">
                <tr class="end">
                    <td>${s.id}</td>
                    <td>${s.userName}</td>
                    <td>${s.password}</td>
                    <td>${s.realName}</td>
                    <td>${s.useType}</td>
                    <td>${s.age}</td>
                    <td>${s.phone}</td>
                    <td>${s.home}</td>
                    <td>${s.photo}</td>
                    <td>${s.education}</td>
                    <td>${s.state}</td>
                    <td>
                        <a href="<%=request.getContextPath() %>/tea/toalter.action?id=${s.id}"><img src="<%=request.getContextPath() %>/img/read.png" alt="查看" title="查看"/></a>
                        <a href="<%=request.getContextPath() %>/tea/toalter.action?id=${s.id}"><img src="<%=request.getContextPath() %>/img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="<%=request.getContextPath() %>/tea/delete.action?id=${s.id}" class="removeProvider" onclick="return confirm('您确认要删除本记录么？')"><img src="<%=request.getContextPath() %>/img/schu.png" alt="删除" title="删除"/></a>
                        <a href="#" onclick="qr_make('${s.userName}','${s.password}','${s.company}')"><img style="height: 22px; width: 22px"  src="<%=request.getContextPath() %>/img/22.png" alt="二维码" title="二维码"/></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        </div>
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
<script src="<%=request.getContextPath() %>/js/qrcode.min.js"></script>
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
        a.download="用户管理";
    };
    element.onclick=toExcel;

    function shujv() {
        alert($('#rongliang').val());
        return false;
    }

    function qr_make(username,password,company){
        console.log(username)
        console.log(password)
        console.log(company)
        var str = username + "`" + password + "`" + company
        $.ajax({
            type: 'post',
            url: '../tea/jiamiGet.action',
            data: {
                text: str,
            },
            success: function (result) {
                console.log(result);
                var url = window.top.location.href.replace("maven_web_demo_war/tea/teacher.action#","maven_web_demo_war/login.jsp")
                console.log(url)
                url = url + "?user=" + result
                console.log(url)
                var qrcode_container = document.getElementById('qrcode');
                // 生成二维码
                var qrcode = new QRCode(qrcode_container, {
                    text: url, // 二维码中的内容
                    width: 200, // 二维码的宽度
                    height: 200, // 二维码的高度
                    colorDark: "#000000", // 二维码的颜色
                    colorLight: "#ffffff", // 二维码的背景色
                });
                var base64_qrcode = qrcode_container.firstChild.toDataURL("image/png");
                console.log(base64_qrcode)
                downloadFileByBase64(username+".png",base64_qrcode.split(",")[1])
            }, error: function () {
                alert("error!");
            }
        })
    }

    function dataURLtoBlob(dataurl, name) {//name:文件名
        var mime = name.substring(name.lastIndexOf('.') + 1)//后缀名
        var bstr = atob(dataurl), n = bstr.length, u8arr = new Uint8Array(n);
        while (n--) {
            u8arr[n] = bstr.charCodeAt(n);
        }
        return new Blob([u8arr], {type: mime});
    }

    function downloadFile(url, name = '默认文件名') {
        var a = document.createElement("a")//创建a标签触发点击下载
        a.setAttribute("href", url)//附上
        a.setAttribute("download", name);
        a.setAttribute("target", "_blank");
        let clickEvent = document.createEvent("MouseEvents");
        clickEvent.initEvent("click", true, true);
        a.dispatchEvent(clickEvent);
    }

    //主函数
    function downloadFileByBase64(name, base64) {
        var myBlob = dataURLtoBlob(base64, name);
        var myUrl = URL.createObjectURL(myBlob);
        downloadFile(myUrl, name)
    }

    //获取后缀
    function getType(file) {
        var filename = file;
        var index1 = filename.lastIndexOf(".");
        var index2 = filename.length;
        var type = filename.substring(index1 + 1, index2);
        return type;
    }

    //根据文件后缀 获取base64前缀不同
    function getBase64Type(type) {
        switch (type) {
            case 'data:text/plain;base64':
                return 'txt';
            case 'data:application/msword;base64':
                return 'doc';
            case 'data:application/vnd.openxmlformats-officedocument.wordprocessingml.document;base64':
                return 'docx';
            case 'data:application/vnd.ms-excel;base64':
                return 'xls';
            case 'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64':
                return 'xlsx';
            case 'data:application/pdf;base64':
                return 'pdf';
            case 'data:application/vnd.openxmlformats-officedocument.presentationml.presentation;base64':
                return 'pptx';
            case 'data:application/vnd.ms-powerpoint;base64':
                return 'ppt';
            case 'data:image/png;base64':
                return 'png';
            case 'data:image/jpeg;base64':
                return 'jpg';
            case 'data:image/gif;base64':
                return 'gif';
            case 'data:image/svg+xml;base64':
                return 'svg';
            case 'data:image/x-icon;base64':
                return 'ico';
            case 'data:image/bmp;base64':
                return 'bmp';
        }
    }

    function base64ToBlob(code) {
        code = code.replace(/[\n\r]/g, '');
        const raw = window.atob(code);
        const rawLength = raw.length;
        const uInt8Array = new Uint8Array(rawLength);
        for (let i = 0; i < rawLength; ++i) {
            uInt8Array[i] = raw.charCodeAt(i)
        }
        return new Blob([uInt8Array], {type: 'application/pdf'})
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