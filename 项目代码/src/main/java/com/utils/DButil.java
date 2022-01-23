package com.utils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

public class DButil {
    private static Properties properties = new Properties();
    static {
        try {
            // 加载配置文件（输入流）
            InputStream in = DButil.class.getClassLoader().getResourceAsStream("db.properties");
            // 通过load()方法将输入流加载到配置文件对象中
            properties.load(in);
            // 通过配置对象的getProperty()方法得到驱动名，加载驱动
            Class.forName(properties.getProperty("jdbcName"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static Connection getConnection() {
        Connection connection = null;
        try {
            // 得到数据库连接信息
            String dbUrl = properties.getProperty("dbUrl");
            String dbName = properties.getProperty("dbName");
            String dbPwd = properties.getProperty("dbPwd");
            // 得到数据库连接
            connection = DriverManager.getConnection(dbUrl, dbName, dbPwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
    public static void close(ResultSet resultSet, Statement statement, Connection connection) {
        try {
            if (resultSet != null) {
                resultSet.close(); // 关闭资源
            }
            if (statement != null) {
                statement.close(); // 关闭资源
            }
            if (connection != null) {
                connection.close(); // 关闭资源
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}