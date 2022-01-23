package com.dao;

import com.pojo.Collect;
import com.utils.DButil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CollectDao {
    public static int deleteCollect(String user) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("delete from collect where user='" + user + "'");
        DButil.close(null,statement,connection);
        return i;
    }
    public static int deleteCollect(int blog_id) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("delete from collect where blog_id='" + blog_id + "'");
        DButil.close(null,statement,connection);
        return i;
    }
//    查询所有收藏某个帖子的用户名
    public static List<String> selectCollect(int blog_id) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select user from collect where blog_id='" + blog_id + "'");
        List<String> list = new ArrayList<>();
        while (resultSet.next()){
            list.add(resultSet.getString("user"));
        }
        DButil.close(resultSet,statement,connection);
        return list;
    }
    public static int insertCollect(Collect collect) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("insert into collect(user, blog_id,date) values('" + collect.getUser() + "','" + collect.getBlog_id() + "','"+new java.sql.Date(collect.getDate().getTime())+"')");
        DButil.close(null,statement,connection);
        return i;
    }
    public static int deleteCollect(String user,int blog_id) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("delete from collect where user='" + user + "'and blog_id='" + blog_id + "'");
        DButil.close(null,statement,connection);
        return i;
    }
    public static int deleteCollectById(int id) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("delete from collect where id='" + id + "'");
        DButil.close(null,statement,connection);
        return i;
    }
}
