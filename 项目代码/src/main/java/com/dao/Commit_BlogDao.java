package com.dao;

import com.pojo.Commit_Blog;
import com.utils.DButil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Commit_BlogDao {
    public static List<Commit_Blog> selectCommit_Blog(String commit_author) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from commit,blog where commit.blog_id=blog.id and commit.author='" + commit_author + "' order by commit.uptime desc");
        List<Commit_Blog> list = new ArrayList<>();
        while (resultSet.next()){
            list.add(new Commit_Blog(resultSet.getInt("id"),
                    resultSet.getInt("blog_id"),
                    resultSet.getString("author"),
                    resultSet.getString("content"),
                    resultSet.getDate("uptime"),
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
