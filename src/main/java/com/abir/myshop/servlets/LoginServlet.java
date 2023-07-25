package com.abir.myshop.servlets;

import com.abir.myshop.dao.UserDao;
import com.abir.myshop.entities.User;
import com.abir.myshop.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String username = request.getParameter("email");
            String password = request.getParameter("password");

            // Authenticate user
            UserDao userDao = new UserDao(FactoryProvider.getfFactory());
            User user = userDao.getUserByEmailAndPassword(username, password);

            // Login
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("currentuser", user);

            if (user != null) {
                if (user.getUserType().equals("admin")) {
                    // Redirect admin to admin.jsp
                    response.sendRedirect("admin.jsp");
                } else if (user.getUserType().equals("normal")) {
                    // Redirect normal user to normal.jsp
                    response.sendRedirect("normal.jsp");
                } else {
                    out.println("We have not identified you... get lost");
                }
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
        return "Login Servlet";
    }
}
