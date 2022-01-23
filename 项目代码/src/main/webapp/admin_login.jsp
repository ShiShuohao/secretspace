 <%--管理员登录界面--%>
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
    <script src="js/jquery-3.6.0.js"></script>
    <style>
        #input_submit{
            position: absolute;
            top: 69%;
            left: 50%;
            transform: translate(-50%,-50%);
            box-shadow: 0 1px 0 0 #f0f7fa;
            background: #33bdef linear-gradient(to bottom, #33bdef 5%, #019ad2 100%);
            border-radius:6px;
            border:1px solid #057fd0;
            display:inline-block;
            cursor:pointer;
            color:#ffffff;
            font-family:Arial;
            font-size:15px;
            font-weight:bold;
            padding:6px 24px;
            text-decoration:none;
            text-shadow:0 -1px 0 #5b6178;
            width: 51%;
        }
        #input_submit:hover{
            background: #019ad2 linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
        }
    </style>
</head>
<body style="background: url(resources/image/background/admin_login.jpg) no-repeat center center fixed;-webkit-background-size: cover;-o-background-size: cover;background-size: cover;text-align: center;">
<div style="height: 500px;width: 450px;position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);text-align: center;background-color: white;border-radius: 30px;opacity: 0.8;">
    <span style="position: absolute;font-size: 25px;color: #057fd0;top: 30%;left: 50%;transform: translate(-50%,-50%);">管&nbsp;&nbsp;理&nbsp;&nbsp;员&nbsp;&nbsp;登&nbsp;&nbsp;录</span>
    <form action="admin_login" method="post"  id="form">
        <div style="height: 25px;width: 250px;position: absolute;top: 45%;left: 50%;transform: translate(-50%,-50%);">
            <img src="resources/image/icon/username.png" alt="" style="height: 25px;width: 25px;position: relative;top: 5px;">
            <input type="text" id="username" name="username"  placeholder="用户名" style="height: 25px;width: 200px;">
        </div>
        <div style="height: 25px;width: 250px;position: absolute;top: 56%;left: 50%;transform: translate(-50%,-50%);">
            <img src="resources/image/icon/password.png" alt="" style="height: 25px;width: 25px;position: relative;top: 5px;">
            <input type="password" id="password" name="password"  placeholder="密码" style="height: 25px;width: 200px;">
        </div>
        <span id="msg" style="color: red;font-size: 12px;position: absolute;transform: translate(-50%,-50%);top: 63%;left: 66%;"></span><br/>
        <input type="button" value="立即登录" id="input_submit" onclick="checkLogin()">
    </form>
    <script>
        function checkLogin() {
            var username = $('#username').val();
            var password = $('#password').val();
            if (isEmpty(username)) {
                $('#msg').html("用户名不能为空");
                return;
            }
            if (isEmpty(password)) {
                $('#msg').html("密码不能为空");
                return;
            }
            $('#form').submit();
        }
        function isEmpty(str) {
            if (str === null || str.trim() === "") {
                return true;
            }
            return false;
        }
    </script>
    <span style="position: absolute;top: 95%;left: 26%;transform: translate(-50%,-50%);">&copy;&nbsp;www.secretspace.cn&nbsp;&nbsp;2021-</span>
</div>
</body>
</html>
