<%--具体博客板块界面--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.pojo.Blog" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.UserDao" %>
<%@ page import="com.pojo.User" %>
<%@ page import="com.dao.BlogDao" %>
<%@ page import="com.pojo.Hobby" %>
<%@ page import="com.dao.HobbyDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="resources/image/icon/favicon.ico">
    <title>secretspace</title>
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
        #input_button:hover{
            background: #f3f3f3 !important;
            color: #0095ff !important;
        }
    </style>
    <style>
        #content:hover,#content_right:hover{
            border-bottom: 1px solid black;
        }
    </style>
    <script src="js/jquery-3.6.0.js"></script>
</head>
<body style="background: #f6f6f6;">
    <div style="width: 100%;height: 52px;position: fixed;top: 0;left: 0;background: white;box-shadow: 0 0 3px 3px #f3f3f3;z-index: 1;">
        <a href="chooseType.jsp" id="a1" style="position: absolute;font-size: 18px;top: 50%;left: 15%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">首页</a>
        <a href="userHome.jsp" id="a2" style="position: absolute;font-size: 18px;top: 50%;left: 22%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">个人中心</a>
        <a href="about.jsp" id="a3" style="position: absolute;font-size: 18px;top: 50%;left: 30%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">关于本站</a>
        <form action="type" id="form">
            <input type="text" name="want" id="want" placeholder="请输入想要搜索的内容" style="position: absolute;top: 50%;left: 55%;transform: translate(-50%,-50%);height: 36px;width: 20%;border-radius: 18px;background: #f3f3f3;border: 0;padding: 20px;">
            <input type="button" id="input_button" onclick="checkType()" value="搜&nbsp;索" style="position: absolute;top: 50%;left: 69%;transform: translate(-50%,-50%);height: 36px;width: 70px;border-radius: 18px;border: 0;background: #0095ff;color: white;transition: 0.5s;">
        </form>
        <span id="error" style="color: red;font-size: 12px;position: absolute;transform: translate(-50%,-50%);top: 50%;left: 70%;"></span>
        <script>
            function checkType(){
                var want = $('#want').val();
                if(want===null||want.trim()===""){
                    //$('#error').html("搜索框不能为空");
                    alert("搜索框不能为空！")
                    return;
                }
                $('#form').submit();
            }
        </script>
    </div>
    <%
        List<Blog> blogList = (ArrayList<Blog>) session.getAttribute("blogList");
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
                    <td colspan="6"><a href="blog_content?id=${blog.id}" id="content" style="text-decoration: none;font-size: 18px;color: black;">[${blog.type}]&nbsp;${blog.headline}</a></td>
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
    <%
        String username = (String) session.getAttribute("username");
        User user = null;
        try {
            user = UserDao.selectUser(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("user",user);
        request.setAttribute("path",request.getSession().getServletContext().getContextPath()+"/"+user.getHeadphoto());//获取服务器路径
    %>
    <div id="right_first" style="position: absolute;width: 18%;height: 310px;right: 15%;background: white;margin-top: 55px;box-shadow: 0 0 3px 3px #f3f3f3;padding-right: 17px;padding-left: 17px;">
        <img src="${path}" alt="" style="height: 130px;width: 130px;border-radius: 65px;position: absolute;top: 35%;left: 50%;transform: translate(-50%,-50%);">
        <span style="position: absolute;font-size: 18px;top: 70%;left: 50%;transform: translate(-50%,-50%);">${user.username}</span>
        <a href="be_admin?username=${user.username}" style="position: absolute;top: 85%;left: 50%;transform: translate(-50%,-50%);text-decoration: none;color: red;font-size: 15px;">申请成为管理员</a>
    </div>
    <div id="right_second" style="background: url(resources/image/background/music.png) no-repeat center bottom;background-size: cover;position: absolute;right: 15%;width: 18%;height: 80px;margin-top: 380px;padding-left: 17px;padding-right: 17px;text-align: center;box-shadow: 0 0 3px 3px #f3f3f3;">
        <audio id="mp3Btn">
            <source src="resources/audio/background.mp3" type="audio/mpeg">
            <source src="resources/audio/background.ogg" type="audio/ogg">
        </audio>
        <div onclick="playVid()" class="btn-audio" style=" background:url(resources/image/icon/play.png) no-repeat center bottom;background-size:cover;position: absolute;height: 30px;width: 30px;top: 50%;left: 10%; opacity:0.4;transform: translate(-50%,-50%);">
        </div>
        <div class="audiobg" style="width: 0;height: 80px;position: absolute;background: white none repeat scroll 0 0;left: 0;opacity: 0.4;"></div>
    </div>
    <script type="text/javascript">
        var myaudio = document.getElementById("mp3Btn");
        var settimer;        //设置定时器
        var duration = 0;    //音乐总时长
        var audiowidth = 0;    //进度条宽度
        myaudio.oncanplay = function () {      //audio加载完毕获取audio总时长
            duration = myaudio.duration;
        };
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
    <%
        List<Blog> blogList_Hobby = null;
        List<Blog> newBlogList_Hobby = new ArrayList<>();
        List<Hobby> hobbyList = null;
        try {
            blogList_Hobby = BlogDao.selectBlogOrderByClicknum();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            hobbyList = HobbyDao.selectHobby(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        int count = 0;
        for (int i=0;i<blogList_Hobby.size();i++){
            if (count==5){
                break;
            }
            for (int j=0;j<hobbyList.size();j++){
                if (blogList_Hobby.get(i).getHeadline().contains(hobbyList.get(j).getContent())){
                    newBlogList_Hobby.add(blogList_Hobby.get(i));
                    count++;
                    break;
                }
            }
        }
        request.setAttribute("newBlogList_Hobby",newBlogList_Hobby);
    %>
    <div id="right_third" style="position: absolute;width: 18%;height: auto;right: 15%;background: white;margin-top: 474px;box-shadow: 0 0 3px 3px #f3f3f3;padding-right: 17px;padding-left: 17px;padding-bottom: 17px;">
        <table style="width: 100%;">
            <tr style="line-height: 50px;font-size: 18px;text-align: left;">
                <td style="width: 45%;">兴趣推荐</td>
                <td style="width: 7%;"><img src="resources/image/icon/change.png" alt="" style="height: 16px;width: 16px;position: relative;top: 3px;"></td>
                <td><a href="refresh_hobby" style="text-align: left;text-decoration: none;color: red;font-size: 14px;position: relative;top: 3px;">重置</a></td>
            </tr>
            <c:forEach var="newBlogList_Hobby" items="${newBlogList_Hobby}">
                <tr>
                    <td colspan="3" style="padding-top: 10px;padding-bottom: 10px;"><a href="blog_content?id=${newBlogList_Hobby.id}" id="content_right" style="font-size: 15px;color: black;text-decoration: none;">●&nbsp;${newBlogList_Hobby.headline}</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>