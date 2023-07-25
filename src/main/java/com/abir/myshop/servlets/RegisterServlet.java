package com.abir.myshop.servlets;

import com.abir.myshop.entities.User;
import com.abir.myshop.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            try {

                String userName = request.getParameter("user_name");
                String userEmail = request.getParameter("user_email");
                String userPassword = request.getParameter("user_password");
                String userPhone = request.getParameter("user_phone");
                String userAddress = request.getParameter("user_address");

                // Create a new User instance
                User user = new User(userName, userEmail, userPassword, userPhone, "defaultphoto", userAddress, "normal");

                int userId;
                try (Session hibernateSession = FactoryProvider.getfFactory().openSession()) {
                    Transaction tx = hibernateSession.beginTransaction();
                    userId = (int) hibernateSession.save(user);
                    tx.commit();
                }

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Registration Successful! User ID: " + userId);

                response.sendRedirect("login.jsp");

            } catch (IOException | HibernateException e) {
                e.printStackTrace(); // Print the exception for debugging purposes
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
