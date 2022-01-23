package com.dao;

import com.pojo.Log;
import com.utils.DButil;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LogDao {
    public static int insertLog(Log log) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("insert into log(version, date, content) values('" + log.getVersion() + "','" + new Date(log.getDate().getTime()) + "','" + log.getContent() + "')");
        DButil.close(null,statement,connection);
        return i;
    }
    public static List<Log> selectLog() throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from log order by date desc");
        List<Log> list = new ArrayList<>();
        while (resultSet.next()){
            list.add(new Log(resultSet.getInt("id"),resultSet.getString("version"), resultSet.getDate("date") ,resultSet.getString("content")));
        }
        DButil.close(resultSet,statement,connection);
        return list;
    }
}
