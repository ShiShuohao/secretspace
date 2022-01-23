<%--写私信界面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="resources/image/icon/favicon.ico">
    <title>message</title>
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
        #a1:hover,#a2:hover,#a3:hover{
            color: #0095ff !important;
        }
    </style>
    <style>
        #input_button{
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
        #input_button:hover{
            background: #019ad2 linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
        }
    </style>
    <script src="js/jquery-3.6.0.js"></script>
    <%--引入WangEditor--%>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/wangeditor@latest/dist/wangEditor.min.js"></script>
</head>
<body style="background: #f6f6f6;">
<div style="width: 100%;height: 52px;position: fixed;top: 0;left: 0;background: white;box-shadow: 0 0 3px 3px #f3f3f3;z-index: 1">
    <a href="chooseType.jsp" id="a1" style="position: absolute;font-size: 18px;top: 50%;left: 15%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">首页</a>
    <a href="userHome.jsp" id="a2" style="position: absolute;font-size: 18px;top: 50%;left: 22%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">个人中心</a>
    <a href="about.jsp" id="a3" style="position: absolute;font-size: 18px;top: 50%;left: 30%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">关于本站</a>
</div>
<%--bargain-top属性可以通过固定外边框的宽度来固定位置--%>
<div style="position: absolute;height: 600px;width: 70%;left: 15%;margin-top: 55px;background: white;box-shadow: 0 0 3px 3px #f3f3f3;text-align: center;">
    <span style="position: absolute;font-size: 25px;top: 8%;left: 50%;transform: translate(-50%,-50%);color: #0095ff;">编&nbsp;&nbsp;&nbsp;&nbsp;辑&nbsp;&nbsp;&nbsp;&nbsp;私&nbsp;&nbsp;&nbsp;&nbsp;信</span>
    <form action="writeMessage" method="post" id="form" style="position: absolute;height: 540px;width: 100%;transform: translate(-50%,-50%);top: 54%;left: 50%;">
        <span style="position: absolute;top: 8%;left: 30%;font-size: 17px;">主题</span>
        <input type="text" name="headline" id="headline" placeholder="请输入主题" style="position: absolute;top: 8%;left: 35%;width: 35%;height: 25px;"><br>
        <%--富文本编辑器的区域--%>
        <div id="editor" style="position: absolute;width: 80%;height: 373px;top: 54%;left: 50%;transform: translate(-50%,-50%);"></div>
        <script type="text/javascript">
            const E = window.wangEditor
            const editor = new E("#editor")
            // 设置编辑区域高度
            editor.config.height = 280
            editor.config.placeholder = '' // 不想使用 placeholder ，赋值为空字符串即可
            // editor.config.uploadImgServer = '/upload-img'
            editor.create()
        </script>
        <span id="error" style="position: absolute;font-size: 12px;top: 90%;left: 85%;transform: translate(-50%,-50%);color: red;"></span>
        <input type="button" id="input_button" value="发送私信" style="position: absolute;top: 95%;left: 50%;transform: translate(-50%,-50%);">
        <script>
            $('#input_button').click(function () {
                var headline = $('#headline').val();
                // 获取WangEditor的内容
                var contentHtml = editor.txt.html();
                // 获取WangEditor的文字内容
                var content = editor.txt.text();
                if (isEmpty(headline)){
                    $('#error').html("主题不能为空");
                    return;
                }
                if (isEmpty(content)||isEmpty(contentHtml)){
                    $('#error').html("私信必须包含文字内容");
                    return;
                }
                // 给input赋值
                $('#content').val(contentHtml);
                $('#form').submit();
            });
            function isEmpty(str) {
                if (str===null || str.trim()===""){
                    return true;
                }
                return false;
            }
        </script>
        <input type="hidden" name="content" id="content">
    </form>
</div>
</body>
</html>