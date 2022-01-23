<%--文章阅读界面--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.pojo.Blog" %>
<%@ page import="com.pojo.User" %>
<%@ page import="com.pojo.Commit_User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        int id = (int) session.getAttribute("blog_id");
        Blog blog = null;
        try {
            blog = BlogDao.selectBlog(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        User user = null;
        try {
            user = UserDao.selectUser(blog.getAuthor());
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Commit_User> commit_userList = null;
        try {
            commit_userList = Commit_UserDao.selectCommit_User(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("blog",blog);
        request.setAttribute("path",request.getSession().getServletContext().getContextPath()+"/"+user.getHeadphoto());//获取服务器路径
        request.setAttribute("commit_userList",commit_userList);
        request.setAttribute("path_",request.getSession().getServletContext().getContextPath()+"/");
    %>
    <link rel="icon" type="image/x-icon" href="resources/image/icon/favicon.ico">
    <title>${blog.headline}</title>
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
    <div style="width: 100%;height: 52px;position: fixed;top: 0;left: 0;background: white;box-shadow: 0 0 3px 3px #f3f3f3;z-index: 1;">
        <a href="chooseType.jsp" id="a1" style="position: absolute;font-size: 18px;top: 50%;left: 15%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">首页</a>
        <a href="userHome.jsp" id="a2" style="position: absolute;font-size: 18px;top: 50%;left: 22%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">个人中心</a>
        <a href="about.jsp" id="a3" style="position: absolute;font-size: 18px;top: 50%;left: 30%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">关于本站</a>
    </div>
<%--    <%--%>
<%--        int id = (int) session.getAttribute("blog_id");--%>
<%--        Blog blog = null;--%>
<%--        try {--%>
<%--            blog = BlogDao.selectBlog(id);--%>
<%--        } catch (Exception e) {--%>
<%--            e.printStackTrace();--%>
<%--        }--%>
<%--        User user = null;--%>
<%--        try {--%>
<%--            user = UserDao.selectUser(blog.getAuthor());--%>
<%--        } catch (Exception e) {--%>
<%--            e.printStackTrace();--%>
<%--        }--%>
<%--        List<Commit_User> commit_userList = null;--%>
<%--        try {--%>
<%--            commit_userList = Commit_UserDao.selectCommit_User(id);--%>
<%--        } catch (Exception e) {--%>
<%--            e.printStackTrace();--%>
<%--        }--%>
<%--        request.setAttribute("blog",blog);--%>
<%--        request.setAttribute("path",request.getSession().getServletContext().getContextPath()+"/"+user.getHeadphoto());//获取服务器路径--%>
<%--        request.setAttribute("commit_userList",commit_userList);--%>
<%--        request.setAttribute("path_",request.getSession().getServletContext().getContextPath()+"/");--%>
<%--    %>--%>

    <%--返回顶部按钮--%>
    <img id="back_to_top" src="resources/image/icon/top.png" alt="" style="height: 40px;width: 40px;position: fixed;top: 75%;left: 91%;">
    <script>
        $('#back_to_top').click(function () {
            $('html,body').animate({scrollTop:0},500);
        });
    </script>


    <div style="position: absolute;height: auto;width: 60%;background: white;left: 18.8%;margin-top: 55px;padding-right: 1.2%;padding-left: 1.2%;box-shadow: 0 0 3px 3px #f3f3f3;">
        <table style="width: 100%;">
            <tr style="height: 80px;">
                <td colspan="2" style="font-size: 22px">[${blog.type}]&nbsp;${blog.headline}</td>
            </tr>
            <tr style="height: 60px;position: relative;top: -10px;left: 10px;">
                <td style="width: 6%;"><img src="${path}" alt="" style="height: 40px;width: 40px;border-radius: 20px;"></td>
                <td>${blog.author}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${blog.uptime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="focus?username_to=${blog.author}" style="text-decoration: none;color: red;font-size: 15px;">关注TA</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="message?username_to=${blog.author}" style="text-decoration: none;color: red;font-size: 15px;">私信TA</a></td>
            </tr>
            <tr>
                <td colspan="2">${blog.content}</td>
            </tr>
        </table>
        <table style="width: 100%;height: 90px;">
            <tr>
                <td style="padding-top: 30px;text-align: center;width: 50%;"><a href="https://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?summary=[${blog.type}]&nbsp;${blog.headline}&url=https://www.secretspace.cn&pics=resources/img/background/index.jpg"><img
                        src="resources/image/icon/btn_share_QQ.png" alt=""></a></td>
                <td style="text-align: center;padding-top: 30px;"><a id="a"><img alt="" id="img" style="height: 40px;width: 40px;" src=""></a><span id="span" style="position: relative;top: -13px;left: 10px;"></span></td>
            </tr>
        </table>
        <%
            List<String> list = null;
            try {
                list = CollectDao.selectCollect(id);
            } catch (Exception e) {
                e.printStackTrace();
            }
            String username = (String) session.getAttribute("username");
            int collected = 0;
            if (list.contains(username)){
                collected = 1;
            }
            request.setAttribute("flag",collected);
        %>
        <script>
            var flag = ${flag};
            console.log(flag);
            if (flag===0){
                $('#a').attr('href','collect');
                $('#img').attr('src','resources/image/icon/collect.png');
                $('#span').html("点击收藏");
            }else {
                $('#a').attr('href','collected');
                $('#img').attr('src','resources/image/icon/collected.png');
                $('#span').html("已收藏");
            }
        </script>
        <div style="height: 40px;">
            <span></span>
        </div>
        <table style="width: 100%;">
            <c:forEach var="commit_user" items="${commit_userList}">
                <tr style="background: #fafafa;">
                    <td style="width: 15%;text-align: center;"><div style="padding: 20px;"><img src="${path_}${commit_user.headphoto}" alt="" style="height: 50px;width: 50px;padding: 15px;padding-bottom: 20px;"><br><span style="font-size: 15px;">${commit_user.author}</span><br><a href="focus?username_to=${commit_user.author}" style="text-decoration: none;color: red;font-size: 13px;position: relative;top: 5px;">关注TA</a><br><a href="message?username_to=${commit_user.author}" style="text-decoration: none;color: red;font-size: 13px;position: relative;top: 8px;">私信TA</a></div></td>
                    <td style="padding: 10px;">
                        <div>${commit_user.content}</div>
                    </td>
                </tr>
                <tr style="font-size: 12px;text-align: right;">
                    <td colspan="2" style="padding-bottom: 20px;"><span>${commit_user.uptime}</span></td>
                </tr>
            </c:forEach>
        </table>
        <div id="editor" style="width: 100%;height: 373px;"></div>
        <script type="text/javascript">
            const E = window.wangEditor
            const editor = new E("#editor")
            // 设置编辑区域高度
            editor.config.height = 280
            editor.config.placeholder = '' // 不想使用 placeholder ，赋值为空字符串即可
            // editor.config.uploadImgServer = '/upload-img'
            editor.create()
        </script>
<%--        <span id="error" style="color: red;font-size: 12px;position: relative;left: 10px;"></span>--%>
        <form action="upcommit" method="post" id="form" style="text-align: center;height: 100px;">
            <input type="hidden" name="content" id="content">
            <input type="button" id="input_button" value="回   复" style="position: relative;top: 30px;">
        </form>
        <script>
            $('#input_button').click(function () {
                var content = editor.txt.text();
                var contentHtml = editor.txt.html();
                if (isEmpty(content)||isEmpty(contentHtml)){
                    // $('#error').html("评论必须包含文字内容");
                    return;
                }
                $('#content').val(contentHtml);
                $('#form').submit();
            });
            function isEmpty(str) {
                if (str===null||str.trim()===""){
                    return true;
                }
                return false;
            }
        </script>
    </div>
</body>
</html>