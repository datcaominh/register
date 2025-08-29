package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class ForgetPassServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        UserDAO dao = new UserDAO();
        model user = dao.findByUsername(username); // cần hàm findByUsername trong UserDAO

        if (user != null) {
            String password = user.getPassword(); 
            response.sendRedirect("login.jsp?pass=" + password);
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
