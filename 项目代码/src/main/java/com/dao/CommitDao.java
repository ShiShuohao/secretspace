package com.dao;

import com.pojo.Commit;
import com.utils.DButil;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CommitDao {
    public static int deleteCommit(String author) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("delete from commit where author='" + author + "'");
        DButil.close(null,statement,connection);
        return i;
    }
    public static int deleteCommit(int blog_id) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("delete from commit where blog_id='" + blog_id + "'");
        DButil.close(null,statement,connection);
        return i;
    }
    public static int insertCommit(Commit commit) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("insert into commit(blog_id, author, content, uptime) values('" + commit.getBlog_id() + "','" + commit.getAuthor() + "','" + commit.getContent() + "','" + new Date(commit.getUptime().getTime()) + "')");
        DButil.close(null,statement,connection);
        return i;
    }
    public static int deleteCommitById(int id) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("delete from commit where id='" + id + "'");
        DButil.close(null,statement,connection);
        return i;
    }
    public static Commit selectCommit(int id) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from commit where id='" + id + "'");
        Commit commit = null;
        while (resultSet.next()){
            commit = new Commit(resultSet.getInt("id"),
                    resultSet.getInt("blog_id"),
                    resultSet.getString("author"),
                    resultSet.getString("content"),
                    resultSet.getDate("uptime"));
        }
        DButil.close(resultSet,statement,connection);
        return commit;
    }
    public static List<Commit> selectCommit(String author) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from commit where author='" + author + "'");
        List<Commit> list = new ArrayList<>();
        while (resultSet.next()){
            list.add(new Commit(resultSet.getInt("id"),
                    resultSet.getInt("blog_id"),
                    resultSet.getString("author"),
                    resultSet.getString("content"),
                    resultSet.getDate("uptime")));
        }
        DButil.close(resultSet,statement,connection);
        return list;
    }
}
