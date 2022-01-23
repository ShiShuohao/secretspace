<%@ page import="java.util.Map" %>
<%@ page import="com.dao.BlogDao" %><%--博客分类引导界面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="resources/image/icon/favicon.ico">
    <title>choose</title>
    <style>
        @font-face {
            font-family: "PingFang";
            src: url(resources/font/PingFang.ttf);
        }
        body,input{
            font-family: PingFang;
        }
    </style>
</head>
<body style="background: url(resources/image/background/chooseType.jpg) no-repeat center center fixed;-webkit-background-size: cover;-o-background-size: cover;background-size: cover;text-align: center;">
<%
    Map<String,Integer> map = null;
    int count = 0;
    try {
        map = BlogDao.selectBlogCountByType();
    } catch (Exception e) {
        e.printStackTrace();
    }
    try {
        count= BlogDao.selectBlogCountAll();
    } catch (Exception e) {
        e.printStackTrace();
    }
    request.setAttribute("map",map);
    request.setAttribute("count",count);
%>
    <div style="height: 500px;width: 800px;position:absolute;transform: translate(-50%,-50%);top: 50%;left: 50%;background: white;border-radius:30px;opacity: 90%;text-align: center;">
        <span style="position: absolute;transform: translate(-50%,-50%);top: 10%;left: 15%;color: black;font-size: 30px;z-index: 1;">板块分类</span>
        <a href="chooseType?type=生活" id="1"><img src="resources/image/icon/life.png" alt="" style="height: 150px;width: 150px;position: absolute;top: 15%;left: 15%;"></a>
        <span style="position: absolute;top: 42%;left: 21%;">生活(${map.get("生活")})</span>
        <a href="chooseType?type=旅行" id="2"><img src="resources/image/icon/trip.png" alt="" style="height: 150px;width: 150px;position: absolute;top: 15%;left: 40%;"></a>
        <span style="position: absolute;top: 42%;left: 46%;">旅行(${map.get("旅行")})</span>
        <a href="chooseType?type=摄影" id="3"><img src="resources/image/icon/photo.png" alt="" style="height: 150px;width: 150px;position: absolute;top: 15%;left: 65%;"></a>
        <span style="position: absolute;top: 42%;left: 71%;">摄影(${map.get("摄影")})</span>
        <a href="chooseType?type=音乐" id="4"><img src="resources/image/icon/music.png" alt="" style="height: 150px;width: 150px;position: absolute;bottom: 15%;left: 15%;"></a>
        <span style="position: absolute;bottom: 15%;left: 21%;">音乐(${map.get("音乐")})</span>
        <a href="chooseType?type=阅读" id="5"><img src="resources/image/icon/read.png" alt="" style="height: 150px;width: 150px;position: absolute;bottom: 15%;left: 40%;"></a>
        <span style="position: absolute;bottom: 15%;left: 46%;">阅读(${map.get("阅读")})</span>
        <a href="chooseType?type=all" id="all"><img src="resources/image/icon/all.png" alt="" style="height: 150px;width: 150px;position: absolute;bottom: 15%;left: 67.5%;"></a>
        <span style="position: absolute;left: 71%;bottom: 15%;">全部(${count})</span>
    </div>
</body>
</html>