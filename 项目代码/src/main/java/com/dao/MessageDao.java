package com.dao;

import com.pojo.Message;
import com.utils.DButil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MessageDao {
    public static int insertMessage(Message message) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("insert into message(username_from, username_to, headline, content, sendtime, state) values('" + message.getUsername_from() + "','" + message.getUsername_to() + "','" + message.getHeadline() + "','" + message.getContent() + "','" + new java.sql.Date(message.getSendtime().getTime())  + "','" + message.getState() + "')");
        DButil.close(null,statement,connection);
        return i;
    }
    public static List<Message> selectMessage(int state,String username_to) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from message where state='" + state + "' and username_to='"+username_to+"' order by sendtime desc");
        List<Message> list = new ArrayList<>();
        while (resultSet.next()){
            list.add(new Message(resultSet.getInt("id"),
                    resultSet.getString("username_from"),
                    resultSet.getString("username_to"),
                    resultSet.getString("headline"),
                    resultSet.getString("content"),
                    resultSet.getDate("sendtime"),
                    resultSet.getInt("state")));
        }
        DButil.close(resultSet,statement,connection);
        return list;
    }
    public static int updateMessage(int id) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("update message set state=1 where id='" + id + "'");
        DButil.close(null,statement,connection);
        return i;
    }
    public static int deleteMessage(int id) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("delete from message where id='" + id + "'");
        DButil.close(null,statement,connection);
        return i;
    }
    public static int deleteMessage(String username) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("delete from message where username_from='" + username + "' or username_to='" + username + "'");
        DButil.close(null,statement,connection);
        return i;
    }
}
