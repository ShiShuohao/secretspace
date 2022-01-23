package com.dao;

import com.pojo.Hobby;
import com.utils.DButil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class HobbyDao {
    public static List<Hobby> selectHobby(String username) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from hobby where username='" + username + "'");
        List<Hobby> list = new ArrayList<>();
        while (resultSet.next()){
            list.add(new Hobby(resultSet.getInt("id"),resultSet.getString("username"),resultSet.getString("content")));
        }
        DButil.close(resultSet,statement,connection);
        return list;
    }
    public static int insertHobby(Hobby hobby) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("insert into hobby(username, content) values('" + hobby.getUsername() + "','" + hobby.getContent() + "')");
        DButil.close(null,statement,connection);
        return i;
    }
    public static int deleteHobby(String username) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("delete from hobby where username='" + username + "'");
        DButil.close(null,statement,connection);
        return i;
    }
}
