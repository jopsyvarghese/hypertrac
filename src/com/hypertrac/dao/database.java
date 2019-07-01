package com.hypertrac.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class database {
    /**
     * @return con
     */
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hypertrac", "root", "");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return con;
    }
}
