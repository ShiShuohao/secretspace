<%@ page import="com.pojo.Message_User" %>
<%@ page import="com.dao.Message_UserDao" %><%--阅读私信界面--%>
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
    <a href="userHome.jsp" id="a4" style="position: absolute;font-size: 16px;top: 75%;left: 20%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">我的资料</a>
    <a href="userCollect.jsp" id="a5" style="position: absolute;font-size: 16px;top: 75%;left: 27%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">我的收藏</a>
    <a href="userCommit.jsp" id="a6" style="position: absolute;font-size: 16px;top: 75%;left: 34%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">我的回复</a>
    <a href="userFocus.jsp" id="a7" style="position: absolute;font-size: 16px;top: 75%;left: 41%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">我的关注</a>
    <a href="userMessage.jsp" id="a8" style="position: absolute;font-size: 16px;top: 75%;left: 48%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">我的信箱</a>
    <a href="changePassword.jsp" id="a9" style="position: absolute;font-size: 16px;top: 75%;left: 55%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">修改密码</a>
    <a href="changeHead.jsp" id="a10" style="position: absolute;font-size: 16px;top: 75%;left: 62%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">修改头像</a>
</div>
<div style="position: absolute;height: auto;width: 60%;left: 18.8%;background: white;box-shadow: 0 0 3px 3px #f3f3f3;text-align: center;margin-top: 88px;padding-left: 1.2%;padding-right: 1.2%;">
    <%
        int id = (int) session.getAttribute("message_id");
        Message_User message_user = null;
        try {
            message_user = Message_UserDao.selectMessage_User(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("path",request.getSession().getServletContext().getContextPath());
        request.setAttribute("message_user",message_user);
    %>
    <table style="width: 100%;">
        <tr style="line-height: 90px;">
            <td style="width: 13%;font-size: 17px;padding-left: 20px;">来自于</td>
            <td style="width: 9%;"><img src="${path}/${message_user.headphoto}" alt="" style="width: 45px;height: 45px;border-radius: 22.5px;"></td>
            <td style="font-size: 17px;">${message_user.username_from}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${message_user.sendtime}</td>
        </tr>
        <tr>
            <td colspan="3">${message_user.content}</td>
        </tr>
    </table>
</div>
</body>
</html>