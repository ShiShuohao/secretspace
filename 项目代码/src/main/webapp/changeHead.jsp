<%--用户头像修改界面--%>
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
            width: 20%;
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
        <a href="changePassword.jsp" id="a9" style="position: absolute;font-size: 16px;top: 75%;left: 55%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">修改密码</a>
        <a href="changeHead.jsp" id="a10" style="position: absolute;font-size: 16px;top: 75%;left: 62%;transform: translate(-50%,-50%);text-decoration: none;color: black;transition: 0.5s;font-weight: bold;">修改头像</a>
    </div>
    <div style="position: absolute;height: 600px;width: 70%;left: 15%;margin-top: 88px;background: white;box-shadow: 0 0 3px 3px #f3f3f3;text-align: center;">
        <span style="position: absolute;top: 18%;left: 50%;font-size: 28px;transform: translate(-50%,-50%);color: #0095ff;">修&nbsp;改&nbsp;头&nbsp;像</span>
        <img id="pic" src="resources/image/icon/head.png" alt="" style="width: 100px;height: 100px;position: absolute;top: 40%;left: 50%;transform: translate(-50%,-50%);border-radius: 50px;">
        <form action="changeHead" method="post" id="form" enctype="multipart/form-data">
            <input type="file" id="upload" name="file" accept="image/*"  style="display: none;">
            <span style="position: absolute;transform: translate(-50%,-50%);left: 50%;top: 62%;font-size: 13px;">单击上方头像选择本地图片</span>
            <span id="error" style="position: absolute;top: 69%;left: 57%;transform: translate(-50%,-50%);font-size: 12px;color: red;"></span>
            <input type="button" value="上传" id="input_submit" onclick="checkChange()">
        </form>
    </div>
    <script>
        function checkChange() {
            var file = $('#upload').val();
            if (file===null||file.trim()===""){
                $('#error').html("请选择头像");
                return;
            }
            $('#form').submit();
        }
    </script>
    <script>
        $(function() {
            $('#pic').click(function () {
                $('#upload').click(); //隐藏了input:file样式后，点击头像就可以本地上传
                $('#upload').on("change",function(){
                    var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
                    if (objUrl) {
                        console.log(objUrl);
                        $("#pic").attr("src", objUrl) ; //将图片路径存入src中，显示出图片
                    }
                });
            });
        });
        //建立一個可存取到該file的url
        function getObjectURL(file) {
            var url = null ;
            if (window.createObjectURL!==undefined) { // basic
                url = window.createObjectURL(file) ;
            } else if (window.URL!==undefined) { // mozilla(firefox)
                url = window.URL.createObjectURL(file) ;
            } else if (window.webkitURL!==undefined) { // webkit or chrome
                url = window.webkitURL.createObjectURL(file) ;
            }
            return url ;
        }
    </script>
</body>
</html>
