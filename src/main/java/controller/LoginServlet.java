package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
      
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String redirect = request.getParameter("redirect");
        
    
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("authMessage", "Please enter both email and password!");
            request.setAttribute("activeTab", "login");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        
      
        HttpSession session = request.getSession();
        
       
        session.setAttribute("userLoggedIn", true);
        session.setAttribute("userEmail", email);
        session.setAttribute("userName", email.split("@")[0]); 
        
      
        if (redirect != null && !redirect.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/" + redirect);
        } else {
       
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }
}