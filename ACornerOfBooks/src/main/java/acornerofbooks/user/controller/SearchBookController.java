/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acornerofbooks.user.controller;

import acornerofbooks.dbmanager.BookManager;
import acornerofbooks.model.BookDTO;
import java.io.IOException;
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
@WebServlet(name = "SearchBookController", urlPatterns = {"/searchBook"})
public class SearchBookController extends HttpServlet {

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

//        String path = request.getPathInfo();
//        System.out.println(path);
        try {
            String indexPage = request.getParameter("index");
            if (indexPage == null) {
                indexPage = "1";
            }
            int currentPage = Integer.parseInt(indexPage);

            String searchText = (String) request.getParameter("search");
            String genres = (String) request.getParameter("genres");
            String rating = (String) request.getParameter("rating");
            String sortBy = (String) request.getParameter("sortBy");

            BookManager manager = new BookManager();
            List<BookDTO> listResult = manager.search(searchText, currentPage, genres, rating, sortBy);

            int totalMatched = manager.countMatched(searchText, genres, rating);
            int endPage = totalMatched / 9;
            if (totalMatched % 9 != 0) {
                endPage++;
            }

            List<String> allTag = manager.findAllTags();

            request.setAttribute("searchText", searchText);
            request.setAttribute("genres", genres);
            request.setAttribute("rating", rating);
            request.setAttribute("sortBy", sortBy);
            request.setAttribute("endPage", endPage);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("allTag", allTag);
            request.setAttribute("list", listResult);
            RequestDispatcher rd = request.getRequestDispatcher("/view/Book/search.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            log("Error search book " + e.toString());
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
