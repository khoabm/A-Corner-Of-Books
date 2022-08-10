/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acornerofbooks.user.controller;

import acornerofbooks.dbmanager.AdminManager;
import acornerofbooks.dbmanager.UserManager;
import acornerofbooks.model.AccountDTO;
import acornerofbooks.model.AdminDTO;
import acornerofbooks.model.CustomerDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String SUCCESS = "home";
    private static final String ERROR = "Access/login.jsp";
    private static final String ADMIN = "admin/admin-home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            UserManager manager = new UserManager();
            AdminManager adManager = new AdminManager();
            AccountDTO acc = manager.checkLogin(email.trim(), password);

            HttpSession ss = request.getSession();
            if (acc != null) {
                String role = acc.getRole();
                if ("user".equals(role)) {
                    CustomerDTO cus = manager.getCustomer(email);
                    if (cus != null) {
                        if (!"disabled".equals(cus.getStatus().trim())) {
                            ss.setAttribute("LOGIN_USER", acc);
                            ss.setAttribute("CUSTOMER_DETAIL", cus);
                            url = SUCCESS;
                        } else {
                            request.setAttribute("ERROR_MSG", "Your account is temporary disabled.");
                            request.getRequestDispatcher("Access/login.jsp").forward(request, response);
                        }
                    }
                }
                if ("admin".equals(role)) {
                    AdminDTO ad = adManager.getAdmin(email);
                    ss.setAttribute("LOGIN_USER", acc);
                    ss.setAttribute("ADMIN_DETAIL", ad);
                    url = ADMIN;
                }
            } else {
                request.setAttribute("ERROR_MSG", "Invalid email or password");
                request.getRequestDispatcher("Access/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            log("Error at login: " + e.toString());
        } finally {
            //request.getRequestDispatcher(url).forward(request, response);        
            response.sendRedirect(url);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
