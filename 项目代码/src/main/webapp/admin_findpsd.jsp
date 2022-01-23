<%--管理密保问题，可以增加和删除密保问题--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.pojo.Findpsd" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.FindpsdDao" %>
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
    <style>
        #a1:hover,#a2:hover,#a3:hover,#a4:hover,#a5:hover,#a6:hover,#a7:hover,#a8:hover,#a9:hover,#a10:hover,#a11:hover{
            color: #0095ff !important;
        }
    </style>
    <script src="js/jquery-3.6.0.js"></script>
    <style>
        #input_submit:hover{
            background: #f3f3f3 !important;
            color: #0095ff !important;
        }
    </style>
    <style>
        .div_psd:hover{
            background: #f5f6f7;
        }
    </style>
</head>
<body style="background: #f6f6f6;">
<div style="width: 100%;height: 90px;position: fixed;top: 0;left: 0;background: white;box-shadow: 0 0 3px 3px #f3f3f3;z-index: 1;">
    <a href="chooseType.jsp" id="a1" style="position: absolute;font-size: 18px;top: 30%;left: 15%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">首页</a>
    <a href="userHome.jsp" id="a2" style="position: absolute;font-size: 18px;top: 30%;left: 22%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">个人中心</a>
    <a href="about.jsp" id="a3" style="position: absolute;font-size: 18px;top: 30%;left: 30%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">关于本站</a>
    <a href="admin_home.jsp" id="a4" style="position: absolute;font-size: 16px;top: 75%;left: 20%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">主页</a>
    <a href="admin_upblog.jsp" id="a5" style="position: absolute;font-size: 16px;top: 75%;left: 26%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">发布博客</a>
    <a href="admin_uplog.jsp" id="a6" style="position: absolute;font-size: 16px;top: 75%;left: 33%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">发布日志</a>
    <a href="admin_user.jsp" id="a7" style="position: absolute;font-size: 16px;top: 75%;left: 40%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">用户管理</a>
    <a href="admin_blog.jsp" id="a8" style="position: absolute;font-size: 16px;top: 75%;left: 47%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">博客管理</a>
    <a href="admin_findpsd.jsp" id="a9" style="position: absolute;font-size: 16px;top: 75%;left: 54%;transform: translate(-50%,-50%);text-decoration: none;color: black;transition: 0.5s;font-weight: bold;">密保管理</a>
    <a href="admin_type.jsp" id="a10" style="position: absolute;font-size: 16px;top: 75%;left: 61%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">板块管理</a>
    <a href="admin_role.jsp" id="a11" style="position: absolute;font-size: 16px;top: 75%;left: 68%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">权限管理</a>
</div>
<form action="admin_findpsd" method="post" id="form" style="position: absolute;height: 100px;width: 50%;left: 25%;right: 25%;margin-top: 88px;box-shadow: 0 0 3px 3px #f3f3f3;background: white;">
    <span style="position: absolute;top: 50%;left: 26%;transform: translate(-50%,-50%);font-size: 17px;">新增密保问题</span>
    <input type="text" name="psd" id="psd" placeholder="请输入问题名" style="position: absolute;top: 50%;left: 52%;transform: translate(-50%,-50%);height: 25px;width: 30%;">
    <span id="error" style="position: absolute;color: red;transform: translate(-50%,-50%);font-size: 12px;top: 75%;left: 75.5%;"></span>
    <input type="button" id="input_submit" value="提&nbsp;&nbsp;&nbsp;交" style="position: absolute;top: 50%;left: 75%;transform: translate(-50%,-50%);height: 28px;width: 58px;border-radius: 3px;border: 0;background: #0095ff;color: white;transition: 0.5s;">
</form>
<%
    List<Findpsd> list = null;
    try {
        list = FindpsdDao.selectFindpsd();
    } catch (Exception e) {
        e.printStackTrace();
    }
    request.setAttribute("list",list);
%>
<div style="position: absolute;height: auto;width: 50%;left: 25%;background: white;box-shadow: 0 0 3px 3px #f3f3f3;text-align: center;margin-top: 193px;">
    <c:forEach var="list" items="${list}">
        <div style="height: 30px;border-bottom: 1px solid #f6f6f6;transition: 0.5s;" class="div_psd">
            <span style="position: relative;top: 5px;">${list.question}</span>
        </div>
    </c:forEach>
</div>
<script>
    $('#input_submit').click(function () {
        var psd = $('#psd').val();
        if (isEmpty(psd)){
            $('#error').html("密保问题不能为空");
            return;
        }
        $('#form').submit();
    });
    function isEmpty(str) {
        if (str === null || str.trim() === "") {
            return true;
        }
        return false;
    }
</script>
</body>
</html>
