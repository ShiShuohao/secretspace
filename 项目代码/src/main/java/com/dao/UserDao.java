package com.dao;

import com.pojo.User;
import com.utils.DButil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserDao {
    public static List<User> selectUser() throws Exception {
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from user");
        List<User> list = new ArrayList<>();
        while (resultSet.next()) {
            list.add(new User(resultSet.getString("username"),
                    resultSet.getString("password"),
                    resultSet.getString("sex"),
                    resultSet.getDate("birthday"),
                    resultSet.getString("area"),
                    resultSet.getString("headphoto"),
                    resultSet.getString("question"),
                    resultSet.getString("answer"),
                    resultSet.getInt("role")));
        }
        DButil.close(resultSet, statement, connection);
        return list;
    }

    public static int insertUser(User user) throws Exception {
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("insert into user values('" + user.getUsername() + "','" + user.getPassword() + "','" + user.getSex() + "','" + new java.sql.Date(user.getBirthday().getTime()) + "','" + user.getArea() + "','" + user.getHeadphoto() + "','" + user.getQuestion() + "','" + user.getAnswer() + "','" + user.getRole() + "') ");
        DButil.close(null,statement,connection);
        return i;
    }

    public static int updateUser(String username, String sex, Date birthday, String area, String question, String answer) throws Exception {
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("update user set sex='" + sex + "',birthday='" + new java.sql.Date(birthday.getTime())  + "',area='" + area + "',question='" + question + "',answer='" + answer + "' where username='" + username + "'");
        DButil.close(null,statement,connection);
        return i;
    }

    public static int updateUser(String username, String headphoto) throws Exception {
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("update user set headphoto='" + headphoto + "' where username='" + username + "'");
        DButil.close(null,statement,connection);
        return i;
    }

    public static User selectUser(String username) throws Exception {
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from user where username='" + username + "'");
        User user = null;
        while (resultSet.next()) {
            user = new User(resultSet.getString("username"),
                    resultSet.getString("password"),
                    resultSet.getString("sex"),
                    resultSet.getDate("birthday"),
                    resultSet.getString("area"),
                    resultSet.getString("headphoto"),
                    resultSet.getString("question"),
                    resultSet.getString("answer"),
                    resultSet.getInt("role"));
        }
        DButil.close(resultSet, statement, connection);
        return user;
    }

    public static int updateUserPassword(String username, String password) throws Exception {
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("update user set password='" + password + "' where username='" + username + "'");
        DButil.close(null,statement,connection);
        return i;
    }

    public static int selectUserNum() throws Exception {
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select count(*) as num from user");
        int count = 0;
        while (resultSet.next()) {
            count = resultSet.getInt("num");
        }
        DButil.close(resultSet, statement, connection);
        return count;
    }

    public static List<User> selectUser(int role) throws Exception {
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from user where role='" + role + "'");
        List<User> list = new ArrayList<>();
        while (resultSet.next()) {
            list.add(new User(resultSet.getString("username"),
                    resultSet.getString("password"),
                    resultSet.getString("sex"),
                    resultSet.getDate("birthday"),
                    resultSet.getString("area"),
                    resultSet.getString("headphoto"),
                    resultSet.getString("question"),
                    resultSet.getString("answer"),
                    resultSet.getInt("role")));
        }
        DButil.close(resultSet, statement, connection);
        return list;
    }
    public static int deleteUser(String username) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("delete from user where username='" + username + "'");
        DButil.close(null,statement,connection);
        return i;
    }
    public static int updateUser(String username,int role) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("update user set role='" + role + "' where username='" + username + "'");
        DButil.close(null,statement,connection);
        return i;
    }
}
