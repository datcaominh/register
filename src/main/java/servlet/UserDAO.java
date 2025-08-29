package servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    // Hàm kiểm tra username đã tồn tại chưa
    public boolean existsUsername(String username) {
        String sql = "SELECT * FROM helloworld WHERE username=?";
        try (Connection conn = DBConnectionMySQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            return rs.next(); // nếu có bản ghi => username tồn tại
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Hàm đăng ký user
    public boolean register(model user) {
        // Nếu username đã tồn tại thì không insert
        if (existsUsername(user.getUsername())) {
            return false;
        }

        String sql = "INSERT INTO helloworld(username, password) VALUES (?, ?)";
        try (Connection conn = DBConnectionMySQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());

            int rows = stmt.executeUpdate();
            
            if (rows > 0) {
                // Lấy id mới gán vào object model
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    user.setId(rs.getInt(1));
                }
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Hàm login giữ nguyên
    public model login(String username, String password) {
        String sql = "SELECT * FROM helloworld WHERE username=? AND password=?";
        try (Connection conn = DBConnectionMySQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new model(rs.getInt("id"), rs.getString("username"), rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public model findByUsername(String username) {
        String sql = "SELECT * FROM helloworld WHERE username=?";
        try (Connection conn = DBConnectionMySQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                model user = new model();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
