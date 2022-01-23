<%@ page import="java.util.List" %>
<%@ page import="com.pojo.Focus_User" %>
<%@ page import="com.dao.Focus_UserDao" %><%--我的关注界面--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="resources/image/icon/favicon.ico">
    <title>user</title>
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
        #a1:hover,#a2:hover,#a3:hover,#a4:hover,#a5:hover,#a6:hover,#a7:hover,#a8:hover,#a9:hover,#a10:hover{
            color: #0095ff !important;
        }
        #delete:hover{
            background: #f3f3f3 !important;
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
    <a href="userHome.jsp" id="a4" style="position: absolute;font-size: 16px;top: 75%;left: 20%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">我的资料</a>
    <a href="userCollect.jsp" id="a5" style="position: absolute;font-size: 16px;top: 75%;left: 27%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">我的收藏</a>
    <a href="userCommit.jsp" id="a6" style="position: absolute;font-size: 16px;top: 75%;left: 34%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">我的回复</a>
    <a href="userFocus.jsp" id="a7" style="position: absolute;font-size: 16px;top: 75%;left: 41%;transform: translate(-50%,-50%);text-decoration: none;color: black;transition: 0.5s;font-weight: bold;">我的关注</a>
    <a href="userMessage.jsp" id="a8" style="position: absolute;font-size: 16px;top: 75%;left: 48%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">我的信箱</a>
    <a href="changePassword.jsp" id="a9" style="position: absolute;font-size: 16px;top: 75%;left: 55%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">修改密码</a>
    <a href="changeHead.jsp" id="a10" style="position: absolute;font-size: 16px;top: 75%;left: 62%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">修改头像</a>
</div>
<div style="position: absolute;height: auto;width: 50%;left: 25%;background: white;box-shadow: 0 0 3px 3px #f3f3f3;text-align: center;margin-top: 88px;">
    <%
        String username = (String) session.getAttribute("username");
        List<Focus_User> list = null;
        try {
            list = Focus_UserDao.selectFocus_User(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("focus_userList",list);
        request.setAttribute("path",request.getSession().getServletContext().getContextPath());
    %>
    <table style="line-height: 120px;width: 100%;">
        <c:forEach var="user" items="${focus_userList}">
            <tr>
                <td style="width: 30%;text-align: center;"><img src="${path}/${user.headphoto}" alt="" style="height: 80px; width: 80px; border-radius: 40px;"></td>
                <td style="text-align: center;"><span style="font-size: 18px;">${user.username_to}</span></td>
                <td style="width: 30%;text-align: center;"><a href="userFocus_cancel?id=${user.id}" style="text-decoration: none;font-size: 13px;background: #0095ff;color: white;padding-right: 5px;padding-left: 5px;padding-top: 3px;padding-bottom: 3px;border-radius: 5px;transition: 0.5s;" id="delete">取消关注</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
