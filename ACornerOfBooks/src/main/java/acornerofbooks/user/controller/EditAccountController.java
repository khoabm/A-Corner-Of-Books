/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acornerofbooks.user.controller;

import acornerofbooks.dbmanager.UserManager;
import acornerofbooks.model.AccountDTO;
import acornerofbooks.model.CustomerDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "EditAccountController", urlPatterns = {"/editaccount"})
public class EditAccountController extends HttpServlet {

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
            String submitted = request.getParameter("submitted");
            if (submitted == null) { // The user has just came to the form
                RequestDispatcher rd = request.getRequestDispatcher("/view/Customer/editAccount.jsp");
                rd.forward(request, response);
            } else { // The user submitted the form, and now this is the handling part
                String newName = request.getParameter("newName");
                String newPhone = request.getParameter("newPhone");
                String newDate = request.getParameter("newDate");
                String newGender = request.getParameter("newGender");

                HttpSession ss = request.getSession();
                AccountDTO user = (AccountDTO) ss.getAttribute("LOGIN_USER");
                String email = user.getEmail();

                UserManager.updateAccount(email, newName, newPhone, newDate, newGender);

                CustomerDTO customer = (CustomerDTO) ss.getAttribute("CUSTOMER_DETAIL");
                customer.setName(newName);
                customer.setPhone(newPhone);
                
                java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(newDate);
                java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
                customer.setDob(sqlDate);
                
                customer.setGender(newGender);

                RequestDispatcher rd = request.getRequestDispatcher("/home");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            log("Error edit account page " + e.toString());
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
