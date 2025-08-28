package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        model user = new model(0, username, password);
        UserDAO dao = new UserDAO();

        if (dao.register(user)) {
            // Đăng ký thành công, tự động thêm thông tin vào DB
            response.sendRedirect("login.jsp");
        } else {
            // Username đã tồn tại hoặc lỗi DB
            response.sendRedirect("register.jsp?error=true");
        }
    }
}
