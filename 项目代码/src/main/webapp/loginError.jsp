<%--登陆失败，返回登陆界面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="resources/image/icon/favicon.ico">
    <title>error</title>
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
        a{
            position: absolute;
            top: 65%;
            left: 50%;
            transform: translate(-50%,-50%);
            box-shadow: 0 1px 0 0 #f0f7fa;
            background: #33bdef linear-gradient(to bottom, #33bdef 5%, #019ad2 100%);
            border-radius:6px;
            border:1px solid #057fd0;
            display:inline-block;
            cursor:pointer;
            color:#ffffff;
            font-family: Arial, serif;
            font-size:15px;
            font-weight:bold;
            padding:6px 24px;
            text-decoration:none;
            text-shadow:0 -1px 0 #5b6178;
        }
        a:hover{
            background: #019ad2 linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
        }
    </style>
</head>
<body>
<div style="height: 200px;width: 300px;position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);border: 3px solid cornflowerblue;border-radius: 30px;text-align: center;">
    <div style="position: relative;top: 30px;">
        <img src="resources/image/icon/error.png" alt="" style="height: 30px;width: 30px;position: relative;top: 9px;">
        <span style="font-size: 13px;">不存在该用户或密码错误，请注册或重新登录</span>
    </div>
    <a href="login.jsp">点击返回</a>
</div>
</body>
</html>
