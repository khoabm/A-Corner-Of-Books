/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acornerofbooks.user.controller;

import acornerofbooks.dbmanager.BookManager;
import acornerofbooks.dbmanager.CommentManager;
import acornerofbooks.model.BookDTO;
import acornerofbooks.model.BookWithMatchCredit;
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
 * @author ASUS
 */
@WebServlet(name = "DisplaySingleBookController", urlPatterns = {"/singleBook"})
public class DisplaySingleBookController extends HttpServlet {

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
            String bookid = request.getParameter("bookid");
            int indexP;
            String index = request.getParameter("index");
            if (index == null) {
                indexP = 1;
            } else {
                indexP = Integer.parseInt(index);
            }

            String indexPage = request.getParameter("index");
            if (indexPage == null) {
                indexPage = "1";
            }
            int currentPage = Integer.parseInt(indexPage);

            BookManager manager = new BookManager();
            BookDTO book = manager.searchSingleBook(bookid);
            CommentManager cManager = new CommentManager();

            int count = cManager.totalComments(bookid);
            int endPage = count / 3;
            if (count % 3 != 0) {
                endPage++;
            }
            List<String> listTag = manager.findTags(bookid);
            List<BookWithMatchCredit> listRecommend = manager.recommend(bookid);
            List<CommentDTO> commentList = cManager.getList(bookid, currentPage);
            
            request.setAttribute("commentList", commentList);
            request.setAttribute("endPage", endPage);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("listRecommend", listRecommend);
            request.setAttribute("bookMatched", book);
            request.setAttribute("listTag", listTag);
            RequestDispatcher rd = request.getRequestDispatcher("/view/Book/singleBook.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            log("Error display single book " + e.toString());
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
