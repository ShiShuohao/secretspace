<%--欢迎界面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="resources/image/icon/favicon.ico">
    <title>Welcome</title>
    <style>
        @font-face {
            font-family: "PingFang";
            src: url(resources/font/PingFang.ttf);
        }
        body,input{
            font-family: PingFang;
        }
        a:hover{
            border-bottom: 1px solid white;
        }
    </style>
    <script src="js/jquery-3.6.0.js"></script>
</head>
<body style="background: url(resources/image/background/index.jpg) no-repeat center center fixed;-webkit-background-size: cover;-o-background-size: cover;background-size: cover;text-align: center;">
<div style="height: 200px;width: 1000px;position: absolute;transform: translate(-50%,-50%);top: 30%;left: 50%;color: white;font-size: 50px;text-align: center;">Welcome to my Secretspace</div>

<a href="login.jsp" style="text-decoration: none;position: absolute;top: 55%;left: 50%;transform: translate(-50%,-50%);color: white;font-size: 22px;">由此进入>></a>

<a href="http://beian.miit.gov.cn/?spm=a2c4g.11174386.n2.3.daa94c07zJ6g6A" style="text-decoration: none;color: white;position: absolute;transform: translate(-50%,-50%);top: 95%;left: 50%;font-size: 15px;">豫ICP备2021025510号</a>
<span style="color: white;position: absolute;transform: translate(-50%,-50%);top: 98%;left: 50%;font-size: 17px;">&copy;secretspace.cn</span>
</body>
</html>
