<%--博客修改界面--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dao.TypeDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.Type" %>
<%@ page import="com.dao.BlogDao" %>
<%@ page import="com.pojo.Blog" %>
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
    <%--引入WangEditor--%>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/wangeditor@latest/dist/wangEditor.min.js"></script>
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
    <a href="admin_home.jsp" id="a4" style="position: absolute;font-size: 16px;top: 75%;left: 20%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">主页</a>
    <a href="admin_upblog.jsp" id="a5" style="position: absolute;font-size: 16px;top: 75%;left: 26%;transform: translate(-50%,-50%);text-decoration: none;color: black;transition: 0.5s;font-weight: bold;">发布博客</a>
    <a href="admin_uplog.jsp" id="a6" style="position: absolute;font-size: 16px;top: 75%;left: 33%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">发布日志</a>
    <a href="admin_user.jsp" id="a7" style="position: absolute;font-size: 16px;top: 75%;left: 40%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">用户管理</a>
    <a href="admin_blog.jsp" id="a8" style="position: absolute;font-size: 16px;top: 75%;left: 47%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">博客管理</a>
    <a href="admin_findpsd.jsp" id="a9" style="position: absolute;font-size: 16px;top: 75%;left: 54%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">密保管理</a>
    <a href="admin_type.jsp" id="a10" style="position: absolute;font-size: 16px;top: 75%;left: 61%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">板块管理</a>
    <a href="admin_role.jsp" id="a11" style="position: absolute;font-size: 16px;top: 75%;left: 68%;transform: translate(-50%,-50%);text-decoration: none;color: #8c96ab;transition: 0.5s;">权限管理</a>
</div>
<%
    int id = (int) session.getAttribute("blog_id");
    Blog blog = null;
    try {
        blog = BlogDao.selectBlog(id);
    } catch (Exception e) {
        e.printStackTrace();
    }
    request.setAttribute("blog",blog);
%>
<%
    List<Type> list = null;
    try {
        list = TypeDao.selectType();
    } catch (Exception e) {
        e.printStackTrace();
    }
    for (int i=0;i<list.size();i++){
        if (list.get(i).getName().equals(blog.getType())){
            list.remove(i);
            break;
        }
    }
    request.setAttribute("typeList",list);
%>
<div style="position: absolute;height: 600px;width: 70%;left: 15%;margin-top: 88px;background: white;box-shadow: 0 0 3px 3px #f3f3f3;text-align: center;">
    <span style="position: absolute;font-size: 20px;top: 5%;left: 50%;transform: translate(-50%,-50%);color: #0095ff;">修&nbsp;&nbsp;&nbsp;&nbsp;改&nbsp;&nbsp;&nbsp;&nbsp;博&nbsp;&nbsp;&nbsp;&nbsp;客</span>
    <form action="updateblog" method="post" id="form" style="position: absolute;height: 540px;width: 100%;transform: translate(-50%,-50%);top: 54%;left: 50%;">
        <span style="position: absolute;top: 5%;left: 30%;font-size: 17px;">标题</span>
        <input type="text" name="headline" id="headline" value="${blog.headline}" style="position: absolute;top: 5%;left: 35%;width: 35%;height: 25px;"><br>
        <span style="position: absolute;top: 12%;left: 30%;font-size: 17px;">板块</span>
        <select name="type" id="type" style="position: absolute;top: 12%;left: 35%;width: 13.5%;height: 25px;">
            <option>${blog.type}</option>
            <c:forEach var="type" items="${typeList}">
                <option value="${type.name}">${type.name}</option>
            </c:forEach>
        </select>
        <span style="position: absolute;top: 12%;left: 50%;font-size: 17px;">时间</span>
        <input type="date" name="uptime" id="uptime" value="${blog.uptime}" style="position: absolute;top: 12%;left: 55%;width: 15%;height: 25px;">
        <%--富文本编辑器的区域--%>
        <div id="editor" style="position: absolute;width: 80%;height: 373px;top: 54%;left: 50%;transform: translate(-50%,-50%);">${blog.content}</div>
        <script type="text/javascript">
            const E = window.wangEditor
            const editor = new E("#editor")
            // 设置编辑区域高度为 500px
            editor.config.height = 280
            editor.config.placeholder = '' // 不想使用 placeholder ，赋值为空字符串即可
            // editor.config.uploadImgServer = '/upload-img'
            editor.create()
        </script>
        <span id="error" style="position: absolute;font-size: 12px;top: 90%;left: 85%;transform: translate(-50%,-50%);color: red;"></span>
        <input type="button" id="input_submit" value="发布" style="position: absolute;top: 95%;">
        <script>
            $('#input_submit').click(function () {
                var headline = $('#headline').val();
                var type = $('#type').val();
                // 获取WangEditor的内容
                var contentHtml = editor.txt.html();
                // 获取WangEditor的文字内容
                var content = editor.txt.text();
                if (isEmpty(headline)){
                    $('#error').html("标题不能为空");
                    return;
                }
                if (type==="请选择"){
                    $('#error').html("请选择板块");
                    return;
                }
                if (isEmpty(content)||isEmpty(contentHtml)){
                    $('#error').html("博客必须包含文字内容");
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