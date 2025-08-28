package servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionMySQL {
    private static final String URL = "jdbc:mysql://localhost:3306/helloworld";
    private static final String USER = "root"; // đổi nếu bạn dùng user khác
    private static final String PASS = "Datchiyeunhung123@"; // đổi mật khẩu MySQL của bạn

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}