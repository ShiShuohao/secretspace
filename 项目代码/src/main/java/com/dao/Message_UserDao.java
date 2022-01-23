package com.dao;

import com.pojo.Message_User;
import com.utils.DButil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Message_UserDao {
    public static Message_User selectMessage_User(int id) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from message,user where message.username_from=user.username and message.id='" + id + "'");
        Message_User message_user = null;
        while (resultSet.next()){
            message_user = new Message_User(resultSet.getInt("id"),
                    resultSet.getString("username_from"),
                    resultSet.getString("username_to"),
                    resultSet.getString("headline"),
                    resultSet.getString("content"),
                    resultSet.getDate("sendtime"),
                    resultSet.getInt("state"),
                    resultSet.getString("password"),
                    resultSet.getString("sex"),
                    resultSet.getDate("birthday"),
                    resultSet.getString("area"),
                    resultSet.getString("headphoto"),
                    resultSet.getString("question"),
                    resultSet.getString("answer"),
                    resultSet.getInt("role"));
        }
        DButil.close(resultSet,statement,connection);
        return message_user;
    }
}
