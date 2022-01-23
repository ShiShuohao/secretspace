package com.dao;

import com.pojo.Findpsd;
import com.utils.DButil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FindpsdDao {
    public static List<Findpsd> selectFindpsd() throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from findpsd");
        List<Findpsd> list = new ArrayList<>();
        while(resultSet.next()){
            list.add(new Findpsd(resultSet.getString("question")));
        }
        DButil.close(resultSet,statement,connection);
        return list;
    }
    public static int insertFindpsd(Findpsd findpsd) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("insert into findpsd values('" + findpsd.getQuestion() + "')");
        DButil.close(null,statement,connection);
        return i;
    }
}
