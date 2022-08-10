/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acornerofbooks.user.controller;

import acornerofbooks.dbmanager.UserManager;
import acornerofbooks.model.AccountDTO;
import acornerofbooks.model.CustomerDTO;
import acornerofbooks.model.UserGoogleDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "GoogleUserDetail", urlPatterns = {"/logindetail"})
public class GoogleUserDetail extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try{
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob").replaceAll("/", "-");
        String gender = request.getParameter("gender");

        HttpSession ss = request.getSession();
        UserGoogleDTO user = (UserGoogleDTO) ss.getAttribute("user");
        String email = user.getEmail();
        
        Date date = Date.valueOf(dob);
        String status = "active";
        UserManager dao = new UserManager();
        CustomerDTO cus = new CustomerDTO(email, name, phone, date, gender, status);
        boolean check = dao.insertCustomer(cus);
        if(check == true) {
            ss.removeAttribute("user");
            ss.setAttribute("CUSTOMER_DETAIL",cus);
            response.sendRedirect("home");

        }else{
            request.getRequestDispatcher("Access/detail.jsp").forward(request,response);
        }
        }catch(Exception e){
            log("Error at GoogleDetail "+e.toString());
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
