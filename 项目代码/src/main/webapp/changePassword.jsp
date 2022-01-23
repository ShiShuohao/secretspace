<%--用户密码修改界面--%>
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
        body,input,select{
            font-family: PingFang;
        }
    </style>
    <style>
        #a1:hover,#a2:hover,#a3:hover,#a4:hover,#a5:hover,#a6:hover,#a7:hover,#a8:hover,#a9:hover,#a10:hover{
            color: #0095ff !important;
        }
    </style>
    <script src="js/jquery-3.6.0.js"></script>
    <style>
        #input_submit{
            position: absolute;
            top: 55%;
            left: 51%;
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
            width: 50%;
        }
        #input_submit:hover{
            background: #019ad2 linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
        }
    </style>
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
    <a href="changePassword.jsp" id="a9" style="position: absolute;font-size: 16px;top: 75%;left: 55%;transform: translate(-50%,-50%);text-decoration: none;color: black;transition: 0.5s;font-weight: bold;">修改密码</a>
    <a href="changeHead.jsp" id="a10" style="position: absolute;font-size: 16px;top: 75%;left: 62%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">修改头像</a>
</div>
<div style="position: absolute;height: 600px;width: 70%;left: 15%;margin-top: 88px;background: white;box-shadow: 0 0 3px 3px #f3f3f3;text-align: center;">
    <span style="position: absolute;top: 18%;left: 50%;font-size: 28px;transform: translate(-50%,-50%);color: #0095ff;">修&nbsp;改&nbsp;密&nbsp;码</span>
    <form action="changePassword" method="post" id="form" style="position: absolute;height: 400px;width: 400px;transform: translate(-50%,-50%);top: 60%;left: 50%;">
        <img src="resources/image/icon/password.png" alt="" style="height: 25px;width: 25px;position: absolute;top: 17%;left: 26.5%;">
        <input type="password" id="password" name="password"  placeholder="新密码" style="height: 28px;width: 160px;position: absolute;top: 20%;left: 54.5%;transform: translate(-50%,-50%);">
        <img src="resources/image/icon/password.png" alt="" style="height: 25px;width: 25px;position: absolute;top: 33%;left: 26.5%;">
        <input type="password" id="againpassword" name="againpassword"  placeholder="确认密码" style="height: 28px;width: 160px;position: absolute;top: 36%;left: 54.5%;transform: translate(-50%,-50%);">
        <span id="msg" style="color: red;font-size: 12px;position: absolute;transform: translate(-50%,-50%);top: 43%;left: 66%;"></span><br/>
        <input type="button" value="确认修改" id="input_submit" onclick="checkChange()">
    </form>
</div>
<script>
    function checkChange() {
        var password = $('#password').val();
        var againpassword = $('#againpassword').val();
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
</body>
</html>
