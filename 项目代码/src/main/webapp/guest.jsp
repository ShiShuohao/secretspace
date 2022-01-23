<%--游客页面，只能看全部帖子的标题，不能看具体内容--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dao.BlogDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.Blog" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="resources/image/icon/favicon.ico">
    <title>guest</title>
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
        #input_button:hover{
            background: #f3f3f3 !important;
            color: #0095ff !important;
        }
    </style>
    <style>
        #a3:hover{
            color: #0095ff !important;
        }
    </style>
</head>
<body style="background: #f6f6f6;">
<div style="width: 100%;height: 52px;position: fixed;top: 0;left: 0;background: white;box-shadow: 0 0 3px 3px #f3f3f3;z-index: 1;">
    <a href="aboutForGuest.jsp" id="a3" style="position: absolute;font-size: 18px;top: 50%;left: 30%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">关于本站</a>
</div>
<%
    List<Blog> blogList = null;
    try {
        blogList = BlogDao.selectBlog();
    } catch (Exception e) {
        e.printStackTrace();
    }
    request.setAttribute("blogList",blogList);
%>

<%--返回顶部按钮--%>
<img id="back_to_top" src="resources/image/icon/top.png" alt="" style="height: 40px;width: 40px;position: fixed;top: 75%;left: 91%;">
<script>
    $('#back_to_top').click(function () {
        $('html,body').animate({scrollTop:0},500);
    });
</script>



    <div id="left" style="position: absolute;height: auto;width: 43%;background: white;left: 15%;margin-top: 55px;padding-right: 17px;padding-left: 17px;box-shadow: 0 0 3px 3px #f3f3f3;">
        <table style="width: 100%;">
            <c:forEach var="blog" items="${blogList}">
                <tr style="height: 70px;" id="row">
                    <td colspan="6" style="font-size: 18px;color: black;">[${blog.type}]&nbsp;${blog.headline}</td>
                </tr>
                <tr style="height: 40px;">
                    <td style="text-align: right;"><img src="resources/image/icon/uptime.png" alt="" style="height: 30px;width: 30px;"></td>
                    <td style="width: 25%;">${blog.uptime}</td>
                    <td style="width: 6%;"><img src="resources/image/icon/click.png" alt="" style="height: 30px;width: 30px;"></td>
                    <td style="width: 8%;">${blog.clicknum}</td>
                    <td style="width: 6%;"><img src="resources/image/icon/commit.png" alt="" style="height: 30px;width: 30px;;"></td>
                    <td style="width: 8%;">${blog.commitnum}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div id="right_first" style="position: absolute;width: 18%;height: 310px;right: 15%;background: white;margin-top: 55px;box-shadow: 0 0 3px 3px #f3f3f3;padding-right: 17px;padding-left: 17px;">
        <span style="position: absolute;top: 40%;left: 50%;transform: translate(-50%,-50%);font-size: 13px;color: red;width: 100%;text-align: center;">浏览帖子内容请登录</span>
        <input type="button" id="input_button" value="登&nbsp;录" style="position: absolute;top: 60%;left: 50%;transform: translate(-50%,-50%);height: 36px;width: 70px;border-radius: 18px;border: 0;background: #0095ff;color: white;transition: 0.5s;">
    </div>
    <div id="right_second" style="background: url(resources/image/background/music.png) no-repeat center bottom;background-size: cover;position: absolute;right: 15%;width: 18%;height: 80px;margin-top: 380px;padding-left: 17px;padding-right: 17px;text-align: center;box-shadow: 0 0 3px 3px #f3f3f3;">
        <audio id="mp3Btn">
            <source src="resources/audio/background.mp3" type="audio/mpeg">
            <source src="resources/audio/background.ogg" type="audio/ogg">
        </audio>
        <div onclick="playVid()" class="btn-audio" style="background:url(resources/image/icon/play.png) no-repeat center bottom;background-size:cover;position: absolute;height: 30px;width: 30px;top: 50%;left: 10%; opacity:0.4;transform: translate(-50%,-50%);">
        </div>
        <div class="audiobg" style="width: 0;height: 80px;position: absolute;background: white none repeat scroll 0 0;left: 0;opacity: 0.4;"></div>
    </div>
    <script type="text/javascript">
        $('#input_button').click(function () {
            window.location.href="login.jsp";
        });
    </script>
    <script type="text/javascript">
        var myaudio = document.getElementById("mp3Btn");
        var settimer;        //设置定时器
        var duration = 0;    //音乐总时长
        var audiowidth = 0;    //进度条宽度
        myaudio.oncanplay = function () {      //audio加载完毕获取audio总时长
            duration = myaudio.duration;
        }
        function playVid(){
            event.stopPropagation();//防止冒泡
            if (myaudio.paused){    //如果是暂停状态，开始播放并每一秒中获新已播放时长
                $('.btn-audio').css({'background':'url(resources/image/icon/stop.png) no-repeat center bottom','background-size':'cover'});
                myaudio.play();
                settimer = setInterval(function(){
                    var currentTime = myaudio.currentTime;
                    if( currentTime >= duration){    //已播放时长大于总时长
                        pauseVid();
                    }else{                           //换算百分比赋值给进度条宽度
                        audiowidth = currentTime/duration * 100;
                        $(".audiobg").css("width", audiowidth +'%')
                    }
                }, 1000);
            }else {
                //pauseVid();
                $(".audiobg").css("width", audiowidth);
                $('.btn-audio').css({'background':'url(resources/image/icon/play.png) no-repeat center bottom','background-size':'cover'});
                myaudio.pause();
            }
        }
        function pauseVid(){       //进度条清零、音频暂停、音频时长清零、清除定时器
            $(".audiobg").css("width", 0 +'%')
            myaudio.pause();
            $('.btn-audio').css({'background':'url(resources/image/icon/play.png) no-repeat center bottom','background-size':'cover'});
            myaudio.currentTime = 0;
            clearInterval(settimer);
        }
    </script>
</body>
</html>
