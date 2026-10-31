package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("activeTab", "signup");
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Null/empty check for required fields
        if (firstName == null || firstName.trim().isEmpty() ||
            lastName == null || lastName.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            request.setAttribute("authMessage", "Please fill in all required fields!");
            request.setAttribute("activeTab", "signup");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // Password match check
        if (!password.equals(confirmPassword)) {
            request.setAttribute("authMessage", "Passwords do not match! Please try again.");
            request.setAttribute("activeTab", "signup");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // Session එකක් හදලා user details set කරනවා
        HttpSession session = request.getSession();
        session.setAttribute("userLoggedIn", true);
        session.setAttribute("userEmail", email);
        session.setAttribute("userName", firstName + " " + lastName);

        // Sign Up උනාට පස්සේ Booking page එකට redirect කරනවා
        response.sendRedirect(request.getContextPath() + "/booking");
    }
}
