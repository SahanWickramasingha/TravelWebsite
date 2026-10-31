package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

      
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userLoggedIn") == null) {
            request.setAttribute("authMessage", "Please Sign In to view your Profile!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
           
            request.getRequestDispatcher("/profile.jsp").forward(request, response);
        }
    }
}
