<%--用户登录界面--%>
<%@ page import="com.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="resources/image/icon/favicon.ico">
    <title>login</title>
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
        #logon{
            position: absolute;
            top: 55%;
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
        }
        #logon:hover{
            background: #019ad2 linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
        }
        #input_submit{
            position: absolute;
            top: 72%;
            left: 46%;
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
            width: 232px;
        }
        #input_submit:hover{
            background: #019ad2 linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
        }

    </style>
    <script src="js/jquery-3.6.0.js"></script>
</head>
<body style="background: url(resources/image/background/login.jpeg) no-repeat center center fixed;-webkit-background-size: cover;-o-background-size: cover;background-size: cover;text-align: center;">
    <div style="height: 500px;width: 900px;position: absolute;transform: translate(-50%,-50%);top: 50%;left: 50%;background: white;border-radius: 30px;opacity: 0.6;text-align: center">
        <%
            int count = 0;
            try {
                count = UserDao.selectUserNum();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <div style="height: 500px;width: 440px;position: absolute;top: 0;left: 0;border-bottom-left-radius: 30px;border-top-left-radius: 30px;border: grey;border-width: 1.5px;border-right-style: solid;text-align: center;">
            <span style=" font-size: 15px;color: cornflowerblue;position: absolute;top: 40%;left: 50%;transform: translate(-50%,-50%);">当前已有<%=count%>位用户，欢迎加入</span><br>
            <a href="logon_1.jsp" id="logon">立即注册</a>
        </div>
        <div style="height: 500px;width: 440px;position: absolute;top: 0;right: 0;border-radius: 30px;text-align: center;" id="div_1">
            <span style="position: absolute;font-size: 25px;color: #057fd0;top: 23%;left: 45%;transform: translate(-50%,-50%);" >用&nbsp;&nbsp;户&nbsp;&nbsp;登&nbsp;&nbsp;录</span>
            <form action="login" method="post" id="form">
                <div style="position: absolute;top: 38%;left: 46%;transform: translate(-50%,-50%);">
                    <img src="resources/image/icon/username.png" alt="" style="height: 25px;width: 25px;position: relative;top: 5px;">
                    <input type="text" name="username"  placeholder="用户名" id="username" style="height: 25px;width: 200px;">
                </div>
                <div style="position: absolute;top: 49%;left: 46%;transform: translate(-50%,-50%);">
                    <img src="resources/image/icon/password.png" alt="" style="height: 25px;width: 25px;position: relative;top: 5px;">
                    <input type="password" name="password"  placeholder="密码" id="password" style="height: 25px;width: 200px;">
                </div>
                <%--验证码--%>
                <img src="resources/image/icon/verify.png" alt="" style="height: 25px;width: 25px;position: absolute;top: 60%;left: 23%;transform: translate(-50%,-50%);">
                <input type="text" id="code_input" placeholder="验证码" style="position: absolute;top: 60%;left: 39.5%;width: 112px;height: 25px;transform: translate(-50%,-50%);">
                <%--验证码容器--%>
                <div id="v_container" style="width: 80px;height: 25px;position: absolute;transform: translate(-50%,-50%);top: 60%;left: 63%;"></div>
                <span id="msg" style="color: red;font-size: 12px;position: absolute;transform: translate(-50%,-50%);top: 66%;left: 63%;"></span><br/>
                <input type="button" value="立即登录" id="input_submit" onclick="checkLogin()" >
            </form>
            <a href="guest.jsp" style="text-decoration: none;position: absolute;transform: translate(-50%,-50%);top: 78%;left: 34%;font-size: 13px;color: black;">游客入口</a>
            <a href="findPsd.jsp" style="text-decoration: none;position: absolute;transform: translate(-50%,-50%);top: 78%;left: 49%;font-size: 13px;color: black;">忘记密码</a>
            <a href="admin_login.jsp" style="text-decoration: none;position: absolute;transform: translate(-50%,-50%);top: 78%;left: 65%;font-size: 13px;color: black;">管理员入口</a>
            <script src="js/gVerify.js"></script>
            <script>
                var verifyCode = new GVerify("v_container"); //初始化验证码
            </script>
            <script>
                function checkLogin() {
                    var username = $('#username').val();
                    var password = $('#password').val();
                    var res = verifyCode.validate(document.getElementById("code_input").value);//获取验证码是否正确
                    if (isEmpty(username)) {
                        $('#msg').html("用户名不能为空");
                        return;
                    }
                    if (isEmpty(password)) {
                        $('#msg').html("密码不能为空");
                        return;
                    }
                    if (res===false) {
                        $('#msg').html("验证码错误");
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
        </div>
    </div>
</body>
</html>
