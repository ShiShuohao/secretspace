<%--用户个人中心首页，展示用户信息--%>
<%@ page import="com.dao.UserDao" %>
<%@ page import="com.pojo.User" %>
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
    </style>
    <script src="js/jquery-3.6.0.js"></script>
</head>
<body style="background: #f6f6f6;">
<div style="width: 100%;height: 90px;position: fixed;top: 0;left: 0;background: white;box-shadow: 0 0 3px 3px #f3f3f3;z-index: 1;">
    <a href="chooseType.jsp" id="a1" style="position: absolute;font-size: 18px;top: 30%;left: 15%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">首页</a>
    <a href="userHome.jsp" id="a2" style="position: absolute;font-size: 18px;top: 30%;left: 22%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">个人中心</a>
    <a href="about.jsp" id="a3" style="position: absolute;font-size: 18px;top: 30%;left: 30%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">关于本站</a>
    <a href="userHome.jsp" id="a4" style="position: absolute;font-size: 16px;top: 75%;left: 20%;transform: translate(-50%,-50%);text-decoration: none;color: black;transition: 0.5s;font-weight: bold;">我的资料</a>
    <a href="userCollect.jsp" id="a5" style="position: absolute;font-size: 16px;top: 75%;left: 27%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">我的收藏</a>
    <a href="userCommit.jsp" id="a6" style="position: absolute;font-size: 16px;top: 75%;left: 34%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">我的回复</a>
    <a href="userFocus.jsp" id="a7" style="position: absolute;font-size: 16px;top: 75%;left: 41%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">我的关注</a>
    <a href="userMessage.jsp" id="a8" style="position: absolute;font-size: 16px;top: 75%;left: 48%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">我的信箱</a>
    <a href="changePassword.jsp" id="a9" style="position: absolute;font-size: 16px;top: 75%;left: 55%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">修改密码</a>
    <a href="changeHead.jsp" id="a10" style="position: absolute;font-size: 16px;top: 75%;left: 62%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">修改头像</a>
</div>
<%
    String username = (String) session.getAttribute("username");
    User user = null;
    try {
        user = UserDao.selectUser(username);
    } catch (Exception e) {
        e.printStackTrace();
    }
    request.setAttribute("user",user);
    request.setAttribute("path",request.getSession().getServletContext().getContextPath()+"/"+user.getHeadphoto());//获取服务器路径
%>
<div style="position: absolute;height: 600px;width: 70%;left: 15%;margin-top: 88px;background: white;box-shadow: 0 0 3px 3px #f3f3f3;text-align: center;">
    <span style="position: absolute;top: 18%;left: 50%;font-size: 28px;transform: translate(-50%,-50%);color: #0095ff;">我&nbsp;的&nbsp;资&nbsp;料</span>

    <table style="position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);line-height: 50px;width: 60%;text-align: left;font-size: 18px;">
        <tr>
            <td style="width: 50%;text-align: center;">头&nbsp;&nbsp;&nbsp;像</td>
            <td style="text-align: center;"><img src="${path}" alt="" style="height: 50px;width: 50px;border-radius: 25px;"></td>
        </tr>
        <tr>
            <td style="width: 50%;text-align: center;">用户名</td>
            <td style="text-align: center;">${user.username}</td>
        </tr>
        <tr>
            <td style="width: 50%;text-align: center;">性&nbsp;&nbsp;&nbsp;别</td>
            <td style="text-align: center;">${user.sex}</td>
        </tr>
        <tr>
            <td style="width: 50%;text-align: center;">生&nbsp;&nbsp;&nbsp;日</td>
            <td style="text-align: center;">${user.birthday}</td>
        </tr>
        <tr>
            <td style="width: 50%;text-align: center;">地&nbsp;&nbsp;&nbsp;区</td>
            <td style="text-align: center;">${user.area}</td>
        </tr>
    </table>
</div>
</body>
</html>
