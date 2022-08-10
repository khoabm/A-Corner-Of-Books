/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acornerofbooks.admin.controller;

import OrderDTO.OrderDAO;
import acornerofbooks.admin.model.OrderDTO_admin;
import acornerofbooks.dbmanager.AdminManager;
import acornerofbooks.model.CommentDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author KHANG
 */
@WebServlet(name = "CommentManagement", urlPatterns = {"/CommentManagement"})
public class CommentManagement extends HttpServlet {

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
        
        String email = request.getParameter("email");
        String ISBN = request.getParameter("ISBN");
        String time = request.getParameter("time");
        if (email != null && ISBN != null && time != null) {
            AdminManager.deleteComment(email, ISBN, time);
        }
        
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int currentPage = Integer.parseInt(indexPage);
        
        AdminManager manager = new AdminManager();
        List<CommentDTO> list = manager.getComment(currentPage);
        
        int total = manager.totalComments();
        int endPage = total / 20;
        if (total % 20 != 0) {
            endPage++;
        }
        
        for (CommentDTO comment: list) {
            log(comment.getContent() + " " + comment.getTimeStamp());
            
        }
        
        request.setAttribute("list", list);
        request.setAttribute("endPage", endPage);
        request.setAttribute("currentPage", currentPage);
        RequestDispatcher rd = request.getRequestDispatcher("/admin/CommentManage.jsp");
        rd.forward(request, response);
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
