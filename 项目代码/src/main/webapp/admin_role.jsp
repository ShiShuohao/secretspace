<%@ page import="java.util.List" %>
<%@ page import="com.pojo.User" %>
<%@ page import="com.dao.UserDao" %><%--权限管理页面，查看已有的管理员，审核新的管理员--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <a href="admin_home.jsp" id="a4" style="position: absolute;font-size: 16px;top: 75%;left: 20%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">主页</a>
    <a href="admin_upblog.jsp" id="a5" style="position: absolute;font-size: 16px;top: 75%;left: 26%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">发布博客</a>
    <a href="admin_uplog.jsp" id="a6" style="position: absolute;font-size: 16px;top: 75%;left: 33%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">发布日志</a>
    <a href="admin_user.jsp" id="a7" style="position: absolute;font-size: 16px;top: 75%;left: 40%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">用户管理</a>
    <a href="admin_blog.jsp" id="a8" style="position: absolute;font-size: 16px;top: 75%;left: 47%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">博客管理</a>
    <a href="admin_findpsd.jsp" id="a9" style="position: absolute;font-size: 16px;top: 75%;left: 54%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">密保管理</a>
    <a href="admin_type.jsp" id="a10" style="position: absolute;font-size: 16px;top: 75%;left: 61%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">板块管理</a>
    <a href="admin_role.jsp" id="a11" style="position: absolute;font-size: 16px;top: 75%;left: 68%;transform: translate(-50%,-50%);text-decoration: none;color: black;transition: 0.5s;font-weight: bold;">权限管理</a>
</div>
<div style="position: absolute;height: auto;width: 50%;left: 25%;background: white;box-shadow: 0 0 3px 3px #f3f3f3;text-align: center;margin-top: 88px;">
    <%
        List<User> waitingAdminList = null;
        List<User> adminList = null;
        try {
            waitingAdminList = UserDao.selectUser(2);
            adminList = UserDao.selectUser(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("waitingAdminList",waitingAdminList);
        request.setAttribute("adminList",adminList);
        request.setAttribute("path",request.getSession().getServletContext().getContextPath());//获取服务器路径
    %>
    <table style="line-height: 110px;width: 100%;">
        <tr style="text-align: center;font-size: 24px;color: #0095ff;">
            <td colspan="3">待&nbsp;&nbsp;&nbsp;&nbsp;审&nbsp;&nbsp;&nbsp;&nbsp;核</td>
        </tr>
        <c:forEach var="user" items="${waitingAdminList}">
            <tr>
                <td style="width: 30%;text-align: center;"><img src="${path}/${user.headphoto}" alt="" style="height: 80px; width: 80px; border-radius: 40px;"></td>
                <td style="text-align: center;"><span style="font-size: 18px;">${user.username}</span></td>
                <td style="width: 30%;text-align: center;"><a href="admin_role?username=${user.username}" style="text-decoration: none;font-size: 13px;background: #0095ff;color: white;padding-right: 5px;padding-left: 5px;padding-top: 3px;padding-bottom: 3px;border-radius: 5px;transition: 0.5s;" id="delete">通过</a></td>
            </tr>
        </c:forEach>
    </table>
    <table style="line-height: 110px;width: 100%;">
        <tr style="text-align: center;font-size: 24px;color: #0095ff;">
            <td colspan="2">管&nbsp;&nbsp;&nbsp;&nbsp;理&nbsp;&nbsp;&nbsp;&nbsp;员</td>
        </tr>
        <c:forEach var="user" items="${adminList}">
            <tr>
                <td style="width: 30%;text-align: center;"><img src="${path}/${user.headphoto}" alt="" style="height: 80px; width: 80px; border-radius: 40px;"></td>
                <td style="text-align: center;"><span style="font-size: 18px;">${user.username}</span></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>