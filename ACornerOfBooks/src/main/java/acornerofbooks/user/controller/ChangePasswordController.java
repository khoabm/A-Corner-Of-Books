/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acornerofbooks.user.controller;

import acornerofbooks.dbmanager.UserManager;
import acornerofbooks.model.AccountDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "ChangePasswordController", urlPatterns = {"/changepassword"})
public class ChangePasswordController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
        HttpSession ss = request.getSession();
        AccountDTO user = (AccountDTO) ss.getAttribute("LOGIN_USER");
        String email = user.getEmail();
        String correctPassword = user.getPassword();
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String comfirm_newPassword = request.getParameter("confirm_newPassword");

        if (correctPassword == null || oldPassword == null || newPassword == null || comfirm_newPassword == null) {
            RequestDispatcher rd = request.getRequestDispatcher("/view/Customer/changePassword.jsp");
            rd.forward(request, response);
        } else if (!correctPassword.equals(oldPassword) || !newPassword.equals(comfirm_newPassword)) {
            request.setAttribute("error", "Passwords doesn't match. Please try again.");
            RequestDispatcher rd = request.getRequestDispatcher("/view/Customer/changePassword.jsp");
            rd.forward(request, response);
        } else {
            UserManager.updatePassword(email, newPassword);

            RequestDispatcher rd = request.getRequestDispatcher("/home");
            rd.forward(request, response);
        }
        } catch (Exception e) {
            log("Error change password site " + e.toString());
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
