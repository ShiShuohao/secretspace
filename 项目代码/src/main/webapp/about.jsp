<%--关于本站界面，更新信息--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dao.LogDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.Log" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="resources/image/icon/favicon.ico">
    <title>about</title>
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
    <script src="js/jquery-3.6.0.js"></script>
</head>
<body style="background: #f6f6f6;">
    <div style="width: 100%;height: 52px;position: fixed;top: 0;left: 0;background: white;box-shadow: 0 0 3px 3px #f3f3f3;z-index: 1">
        <a href="chooseType.jsp" id="a1" style="position: absolute;font-size: 18px;top: 50%;left: 15%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">首页</a>
        <a href="userHome.jsp" id="a2" style="position: absolute;font-size: 18px;top: 50%;left: 22%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">个人中心</a>
        <a href="about.jsp" id="a3" style="position: absolute;font-size: 18px;top: 50%;left: 30%;transform: translate(-50%,-50%);text-decoration: none;color: black;transition: 0.5s;font-weight: bold">关于本站</a>
    </div>
    <%--bargain-top属性可以通过固定外边框的宽度来固定位置--%>
    <div style="position: absolute;height: 80px;width: 50%;left: 23.8%;right: 23.8%;margin-top: 50px;box-shadow: 0 0 3px 3px #f3f3f3;background: white;padding-right: 1.2%;padding-left: 1.2%;">
        <span style="font-size: 25px;position: absolute;color: #0095ff;top: 50%;left: 50%;transform: translate(-50%,-50%);">更&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;志</span><br>
    </div>
    <%
        List<Log> list = null;
        try {
            list = LogDao.selectLog();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("logList",list);
    %>
    <div style="height: auto;width: 50%;position: absolute;left: 23.8%;background: white;margin-top: 135px;box-shadow: 0 0 3px 3px #f3f3f3;padding-left: 1.2%;padding-right: 1.2%;">
        <table style="width: 100%;">
            <c:forEach var="log" items="${logList}">
                <tr style="height: 50px;">
                    <td  style="width: 50%;text-align: center;"><span style="position: relative;left: 50px;font-size: 16px;color:red;">${log.version}</span></td>
                    <td style="width: 50%;text-align: center;"><span style="position: relative;left: -20%;font-size: 16px;color: red;">${log.date}</span></td>
                </tr>
                <tr>
                    <td colspan="2">${log.content}</td>
                </tr>
                <tr style="height: 30px;"></tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
