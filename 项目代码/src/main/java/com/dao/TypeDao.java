package com.dao;

import com.pojo.Type;
import com.utils.DButil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TypeDao {
    public static List<Type> selectType() throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from type");
        List<Type> list = new ArrayList<>();
        while(resultSet.next()){
            list.add(new Type(resultSet.getString("name"),resultSet.getInt("state")));
        }
        DButil.close(resultSet,statement,connection);
        return list;
    }
    public static List<Type> selectTypeByState(int state) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from type where state='"+state+"'");
        List<Type> list = new ArrayList<>();
        while(resultSet.next()){
            list.add(new Type(resultSet.getString("name"),resultSet.getInt("state")));
        }
        DButil.close(resultSet,statement,connection);
        return list;
    }
    public static int insertType(Type type) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("insert into type values('" + type.getName() + "','" + type.getState() + "')");
        DButil.close(null,statement,connection);
        return i;
    }
    public static int deleteType(String name) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("delete from type where name='" + name + "'");
        DButil.close(null,statement,connection);
        return i;
    }
}
