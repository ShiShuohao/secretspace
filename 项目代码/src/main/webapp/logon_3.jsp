<%--用户注册界面3 头像--%>
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
<div style="height: 500px;width: 450px;position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);text-align: center;background-color: white;border-radius: 30px;opacity: 85%;">
    <span style="position: absolute;font-size: 25px;color: #057fd0;top: 25%;left: 50%;transform: translate(-50%,-50%);">上&nbsp;&nbsp;传&nbsp;&nbsp;头&nbsp;&nbsp;像</span>
    <img id="pic" src="resources/image/icon/head.png" alt="" style="width: 100px;height: 100px;position: absolute;top: 45%;left: 50%;transform: translate(-50%,-50%);border-radius: 50px;">
    <form action="logon_3" method="post" id="form" enctype="multipart/form-data">
        <input type="file" id="upload" name="file" accept="image/*"  style="display: none;">
        <span style="position: absolute;transform: translate(-50%,-50%);left: 50%;top: 62%;font-size: 13px;">单击上方头像选择本地图片</span>
        <span id="error" style="position: absolute;top: 69%;left: 68%;transform: translate(-50%,-50%);font-size: 12px;color: red;"></span>
        <input type="button" value="上传" id="input_submit" onclick="checkLogon()">
    </form>
    <script>
        function checkLogon() {
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
    <span style="position: absolute;top: 95%;left: 26%;transform: translate(-50%,-50%);">&copy;&nbsp;www.secretspace.cn&nbsp;&nbsp;2021-</span>
</div>
</body>
</html>
