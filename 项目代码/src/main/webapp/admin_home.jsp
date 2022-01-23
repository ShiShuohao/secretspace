<%--管理员系统主页--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="resources/image/icon/favicon.ico">
    <title>admin</title>
    <style>
        @font-face {
            font-family: "PingFang";
            src: url(resources/font/PingFang.ttf);
        }
        body,input{
            font-family: PingFang;
        }
    </style>
    <style>
        #a1:hover,#a2:hover,#a3:hover,#a4:hover,#a5:hover,#a6:hover,#a7:hover,#a8:hover,#a9:hover,#a10:hover,#a11:hover{
            color: #0095ff !important;
        }
    </style>
    <script src="js/jquery-3.6.0.js"></script>
</head>
<body style="background: #f6f6f6;">
    <div style="width: 100%;height: 90px;position: fixed;top: 0;left: 0;background: white;box-shadow: 0 0 3px 3px #f3f3f3;z-index: 1;">
        <a href="chooseType.jsp" id="a1" style="position: absolute;font-size: 18px;top: 30%;left: 15%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">首页</a>
        <a href="userHome.jsp" id="a2" style="position: absolute;font-size: 18px;top: 30%;left: 22%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">个人中心</a>
        <a href="about.jsp" id="a3" style="position: absolute;font-size: 18px;top: 30%;left: 30%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">关于本站</a>
        <a href="admin_home.jsp" id="a4" style="position: absolute;font-size: 16px;top: 75%;left: 20%;transform: translate(-50%,-50%);text-decoration: none;color: black;transition: 0.5s;font-weight: bold;">主页</a>
        <a href="admin_upblog.jsp" id="a5" style="position: absolute;font-size: 16px;top: 75%;left: 26%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">发布博客</a>
        <a href="admin_uplog.jsp" id="a6" style="position: absolute;font-size: 16px;top: 75%;left: 33%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">发布日志</a>
        <a href="admin_user.jsp" id="a7" style="position: absolute;font-size: 16px;top: 75%;left: 40%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">用户管理</a>
        <a href="admin_blog.jsp" id="a8" style="position: absolute;font-size: 16px;top: 75%;left: 47%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">博客管理</a>
        <a href="admin_findpsd.jsp" id="a9" style="position: absolute;font-size: 16px;top: 75%;left: 54%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">密保管理</a>
        <a href="admin_type.jsp" id="a10" style="position: absolute;font-size: 16px;top: 75%;left: 61%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">板块管理</a>
        <a href="admin_role.jsp" id="a11" style="position: absolute;font-size: 16px;top: 75%;left: 68%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">权限管理</a>
    </div>
    <%
        String username = (String) session.getAttribute("username");
    %>
    <div style="position: absolute;height: 600px;width: 70%;left: 15%;right: 15%;margin-top: 88px;background: white;box-shadow: 0 0 3px 3px #f3f3f3;text-align: center;">
        <span style="position: absolute;top: 40%;left: 50%;transform: translate(-50%,-50%);font-size: 26px;">欢迎你，管理员：<span style="color: red;"><%=username%></span></span>
    </div>
</body>
</html>
