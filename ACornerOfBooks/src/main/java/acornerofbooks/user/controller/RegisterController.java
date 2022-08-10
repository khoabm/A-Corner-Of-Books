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
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String SUCCESS = "Access/login.jsp";
    private static final String ERROR = "Access/register.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try{
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String rePass = request.getParameter("re_pass");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob").replaceAll("/", "-");

        
        
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        String dob2 = sdf2.format(sdf.parse(dob));
        Date date = Date.valueOf(dob2);
        
        String gender = request.getParameter("gender").toLowerCase();
        String role = "";
        String status = "";
        HashMap<String,String> errors = new HashMap<String,String>();
        boolean hasError = false;
        if(name.length()>30||name.length()<5){
            errors.put("name", "Invalid name");
            hasError = true;
        }
        if(email.length()>30){
            errors.put("email", "Invalid email");
            hasError = true;
        }
        if(password.length()>30||password.length()<5){
            errors.put("password", "Invalid password");
            hasError = true;
        }
        if(!password.equals(rePass)){
            errors.put("rePass", "Password not match");
            hasError = true;
        }
        if(hasError){
            request.setAttribute("ERROR_REGISTER", errors);
            
        }else{
            AccountDTO acc = new AccountDTO(email, password, role);
            UserManager manager = new UserManager();
            boolean checkDuplicate = manager.checkDuplicate(email);
            if(checkDuplicate){
                errors.put("duplicate", "Email has existed");
                request.setAttribute("ERROR_REGISTER", errors);
            }else{
                boolean checkInsert = manager.insertAccount(acc);
                if(checkInsert){
                    CustomerDTO cus = new CustomerDTO(email, name, phone, date, gender, status);
                    boolean checkInsertCustomer = manager.insertCustomer(cus);
                    if(checkInsertCustomer){
                    url = SUCCESS;
                    }
                }else{
                    errors.put("ERROR_MSG", "Cannot insert");
                    request.setAttribute("ERROR_REGISTER", errors);
                }
            }
        }
        }catch(Exception e){
            log("Error at Register: "+e.toString());
        }
        finally{
//            response.sendRedirect(url);
            RequestDispatcher rd=request.getRequestDispatcher(url); 
            rd.forward(request, response);
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
