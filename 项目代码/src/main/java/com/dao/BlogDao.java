package com.dao;

import com.pojo.Blog;
import com.utils.DButil;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BlogDao {
    public static List<Blog> selectBlog() throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from blog order by uptime desc");
        List<Blog> list = new ArrayList<>();
        while(resultSet.next()){
            list.add(new Blog(resultSet.getInt("id"),
                    resultSet.getString("headline"),
                    resultSet.getString("author"),
                    resultSet.getString("content"),
                    resultSet.getString("type"),
                    resultSet.getInt("clicknum"),
                    resultSet.getInt("commitnum"),
                    resultSet.getDate("uptime")));
        }
        DButil.close(resultSet,statement,connection);
        return list;
    }
    public static List<Blog> selectBlog(String type) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from blog where type='" + type + "' order by uptime desc");
        List<Blog> list = new ArrayList<>();
        while (resultSet.next()){
            list.add(new Blog(resultSet.getInt("id"),
                    resultSet.getString("headline"),
                    resultSet.getString("author"),
                    resultSet.getString("content"),
                    resultSet.getString("type"),
                    resultSet.getInt("clicknum"),
                    resultSet.getInt("commitnum"),
                    resultSet.getDate("uptime")));
        }
        DButil.close(resultSet,statement,connection);
        return list;
    }
    public static int insertBlog(Blog blog) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("insert into blog(headline, author, content, type, clicknum, commitnum, uptime) values('" + blog.getHeadline() + "','" + blog.getAuthor() + "','" + blog.getContent() + "','" + blog.getType() + "','" + blog.getClicknum() + "','" + blog.getCommitnum() + "','" + new Date(blog.getUptime().getTime()) + "')");
        DButil.close(null,statement,connection);
        return i;
    }
    public static Blog selectBlog(int id) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from blog where id='" + id + "'");
        Blog blog = null;
        while (resultSet.next()){
            blog = new Blog(resultSet.getInt("id"),
                    resultSet.getString("headline"),
                    resultSet.getString("author"),
                    resultSet.getString("content"),
                    resultSet.getString("type"),
                    resultSet.getInt("clicknum"),
                    resultSet.getInt("commitnum"),
                    resultSet.getDate("uptime"));
        }
        DButil.close(resultSet,statement,connection);
        return blog;
    }
    public static int deleteBlog(int id) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("delete from blog where id='" + id + "'");
        DButil.close(null,statement,connection);
        return i;
    }
    public static int updateBlog(int id, String headline, String content, String type, java.util.Date uptime) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("update blog set headline='" + headline + "',content='" + content + "',type='" + type + "',uptime='" + new Date(uptime.getTime()) + "' where id='" + id + "'");
        DButil.close(null,statement,connection);
        return i;
    }
    public static int updateBlog(int id) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("update blog set clicknum=clicknum+1 where id='" + id + "'");
        DButil.close(null,statement,connection);
        return i;
    }
    public static int updateBlogForCommitnumInc(int id) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("update blog set commitnum=commitnum+1 where id='" + id + "'");
        DButil.close(null,statement,connection);
        return i;
    }
    public static int updateBlogForCommitnumDec(int id) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("update blog set commitnum=commitnum-1 where id='" + id + "'");
        DButil.close(null,statement,connection);
        return i;
    }
    public static Map<String,Integer> selectBlogCountByType() throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select type,count(id) from blog group by type");
        Map<String,Integer> map = new HashMap<>();
        while (resultSet.next()){
            map.put(resultSet.getString("type"),resultSet.getInt("count(id)"));
        }
        DButil.close(resultSet,statement,connection);
        return map;
    }
    public static int selectBlogCountAll() throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select count(id) from blog");
        int count = 0;
        while (resultSet.next()){
            count = resultSet.getInt("count(id)");
        }
        DButil.close(resultSet,statement,connection);
        return count;
    }
    public static List<Blog> selectBlogOrderByClicknum() throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from blog order by clicknum desc");
        List<Blog> list = new ArrayList<>();
        while(resultSet.next()){
            list.add(new Blog(resultSet.getInt("id"),
                    resultSet.getString("headline"),
                    resultSet.getString("author"),
                    resultSet.getString("content"),
                    resultSet.getString("type"),
                    resultSet.getInt("clicknum"),
                    resultSet.getInt("commitnum"),
                    resultSet.getDate("uptime")));
        }
        DButil.close(resultSet,statement,connection);
        return list;
    }
}
