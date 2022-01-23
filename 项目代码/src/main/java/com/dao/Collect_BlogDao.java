package com.dao;

import com.pojo.Collect_Blog;
import com.utils.DButil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Collect_BlogDao {
    public static List<Collect_Blog> selectCollect_Blog(String user) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from collect,blog where collect.blog_id=blog.id and collect.user='" + user + "' order by collect.date desc");
        List<Collect_Blog> list = new ArrayList<>();
        while (resultSet.next()){
            list.add(new Collect_Blog(resultSet.getInt("id"),
                    resultSet.getString("user"),
                    resultSet.getInt("blog_id"),
                    resultSet.getDate("date"),
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
