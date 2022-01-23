<%--用户注册界面1 用户名、密码、确认密码--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="resources/image/icon/favicon.ico">
    <title>logon</title>
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
            top: 75%;
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
<body style="background: url(resources/image/background/logon.jpeg) no-repeat center center fixed;-webkit-background-size: cover;-o-background-size: cover;background-size: cover;text-align: center;">
<div style="height: 500px;width: 450px;position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);text-align: center;background-color: white;border-radius: 30px;opacity: 0.7;">
    <span style="position: absolute;font-size: 25px;color: #057fd0;top: 25%;left: 50%;transform: translate(-50%,-50%);">用&nbsp;&nbsp;户&nbsp;&nbsp;注&nbsp;&nbsp;册</span>
    <form action="logon_1" method="post" id="form">
        <div style="height: 25px;width: 250px;position: absolute;top: 40%;left: 50%;transform: translate(-50%,-50%);">
            <img src="resources/image/icon/username.png" alt="" style="height: 25px;width: 25px;position: relative;top: 5px;">
            <input type="text" id="username" name="username"  placeholder="用户名" style="height: 25px;width: 200px;">
        </div>
        <div style="height: 25px;width: 250px;position: absolute;top: 51%;left: 50%;transform: translate(-50%,-50%);">
            <img src="resources/image/icon/password.png" alt="" style="height: 25px;width: 25px;position: relative;top: 5px;">
            <input type="password" id="password" name="password"  placeholder="密码" style="height: 25px;width: 200px;">
        </div>
        <div style="height: 25px;width: 250px;position: absolute;top: 62%;left: 50%;transform: translate(-50%,-50%);">
            <img src="resources/image/icon/password.png" alt="" style="height: 25px;width: 25px;position: relative;top: 5px;">
            <input type="password" id="againpassword" name="againpassword"  placeholder="确认密码" style="height: 25px;width: 200px;">
        </div>
        <span id="msg" style="color: red;font-size: 12px;position: absolute;transform: translate(-50%,-50%);top: 69%;left: 66%;"></span><br/>
        <input type="button" value="立即注册" id="input_submit" onclick="checkLogon()">
    </form>
    <script>
        function checkLogon() {
            var username = $('#username').val();
            var password = $('#password').val();
            var againpassword = $('#againpassword').val();
            if (isEmpty(username)) {
                $('#msg').html("用户名不能为空");
                return;
            }
            if (isEmpty(password)) {
                $('#msg').html("密码不能为空");
                return;
            }
            if (isEmpty(againpassword)) {
                $('#msg').html("请再次输入密码");
                return;
            }
            if (password!==againpassword){
                $('#msg').html("密码不一致");
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
