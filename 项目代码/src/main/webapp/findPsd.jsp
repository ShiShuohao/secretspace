<%--找回密码界面，根据用户名和密保问题找回密码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.pojo.Findpsd" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.FindpsdDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="resources/image/icon/favicon.ico">
    <title>findPsd</title>
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
<body style="background: url(resources/image/background/findPsd.jpg) no-repeat center center fixed;-webkit-background-size: cover;-o-background-size: cover;background-size: cover;text-align: center;">
<div style="height: 500px;width: 450px;position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);text-align: center;background-color: white;border-radius: 30px;opacity: 0.7;">
    <span style="position: absolute;font-size: 25px;color: #057fd0;top: 30%;left: 50%;transform: translate(-50%,-50%);">找&nbsp;&nbsp;回&nbsp;&nbsp;密&nbsp;&nbsp;码</span>
    <form action="findPsd" method="post" id="form">
        <%
            List<Findpsd> findpsds = null;
            try {
                findpsds = FindpsdDao.selectFindpsd();
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.setAttribute("questionList",findpsds);
        %>
        <div style="height: 25px;width: 250px;position: absolute;left: 50%;top: 45%; transform: translate(-50%,-50%);text-align: center;">
            <span style="position: absolute;left: 5%;">用&nbsp;&nbsp;户&nbsp;&nbsp;名</span>
            <input type="text" name="username" id="username" placeholder="请输入用户名" style="position: absolute;width: 140px;height: 22px;left: 40%;">
        </div>
        <div style="height: 150px;width: 250px;position: absolute;top: 65%;left: 50%;transform: translate(-50%,-50%);text-align: center;">
            <span style="position: absolute;left: 5%;">密保问题</span>
            <select name="question" id="question" style="position: absolute;width: 140px;height: 22px;left: 40%;">
                <option>请选择</option>
                <c:forEach var="question" items="${questionList}">
                    <option value="${question.question}">${question.question}</option>
                </c:forEach>
            </select><br>
            <span style="position: absolute;left: 5%;top: 25%;">答&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;案</span>
            <input type="text" name="answer" id="answer" placeholder="请输入答案" style="position:absolute;height: 22px;width: 140px;top: 25%;left: 40%;">
        </div>
        <span id="msg" style="color: red;font-size: 12px;position: absolute;transform: translate(-50%,-50%);top: 69%;left: 66%;"></span><br/>
        <input type="button" value="提交信息" id="input_submit" onclick="checkFind()">
    </form>
    <script>
        function checkFind() {
            var username = $('#username').val();
            var question = $('#question').val();
            var answer = $('#answer').val();
            if (isEmpty(username)){
                $('#msg').html("用户名不能为空");
                return;
            }
            if (question==='请选择'){
                $('#msg').html("请选择密保问题");
                return;
            }
            if (isEmpty(answer)){
                $('#msg').html("答案不能为空");
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
