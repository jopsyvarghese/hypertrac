package com.hypertrac.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class database {
    /**
     * @return con
     * @throws ClassNotFoundException 
     * @throws SQLException 
     */
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection con = null;
        String username="hypertra_user";

        String password="F!6DS4{0])@F";

        String dbName="hypertra_c";

        //String dbHost="jdbc:mysql://mysql3000.mochahost.com:3306/"+dbName+"?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    	Class.forName("com.mysql.cj.jdbc.Driver");
        //con = DriverManager.getConnection(dbHost,username, password);
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hypertrac","root", "");
        return con;
    }
}
