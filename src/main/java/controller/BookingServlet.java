package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
      
        HttpSession session = request.getSession(false);
        
      
        if (session == null || session.getAttribute("userLoggedIn") == null) {
          
            request.setAttribute("authMessage", "Please Sign In or Sign Up to access Bookings!");
            request.setAttribute("redirectTo", "booking");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            
            String userName = (String) session.getAttribute("userName");
            request.setAttribute("profileName", userName); 
            
            request.getRequestDispatcher("/booking.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        String name = request.getParameter("name");
        String destination = request.getParameter("destination");
        
        request.setAttribute("name", name);
        request.setAttribute("msg", "Your booking for " + destination + " is successful!");
        
        request.getRequestDispatcher("/thankyou.jsp").forward(request, response);
    }
}