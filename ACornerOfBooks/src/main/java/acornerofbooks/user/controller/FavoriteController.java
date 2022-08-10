/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acornerofbooks.user.controller;

import acornerofbooks.dbmanager.BookManager;
import acornerofbooks.model.AccountDTO;
import acornerofbooks.model.BookDTO;
import acornerofbooks.utils.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "FavoriteController", urlPatterns = {"/favourite"})
public class FavoriteController extends HttpServlet {

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
        try {
            HttpSession ss = request.getSession();
            AccountDTO user = (AccountDTO) ss.getAttribute("LOGIN_USER");

            String isbn = request.getParameter("bookid");
            String location = request.getParameter("location");
            String email = user.getEmail();

            BookManager manager = new BookManager();
            if (isbn != null) {
                List<String> favourites = manager.getAllFavourite(email);
                if (!Utils.ifExist(isbn, favourites)) {
                    boolean check = manager.addToFavorite(isbn, email);
                }
            } 
            if (location == null) {
                String indexPage = request.getParameter("index");
                if (indexPage == null) {
                    indexPage = "1";
                }

                int currentPage = Integer.parseInt(indexPage);

                int total = manager.totalFavorite(email);

                List<BookDTO> list = manager.getFavoriteList(email, currentPage);
                int endPage = total / 9;
                if (total % 9 != 0) {
                    endPage++;
                }
                //ss.removeAttribute("email");

                request.setAttribute("list", list);
                request.setAttribute("endPage", endPage);
                request.setAttribute("currentPage", currentPage);

                request.getRequestDispatcher("/User/favorite.jsp").forward(request, response);
            }
            
            
            if ("home".equals(location)) {
                response.sendRedirect("home");
                return;
            } else if ("singleBook".equals(location)) {
                response.sendRedirect("singleBook?bookid=" + isbn);
                return;
            } else if ("searchBook".equals(location)) {
                String search = request.getParameter("search");
                String index = request.getParameter("index");
                response.sendRedirect("searchBook?search=" + search + "&genres=all&rating=all&sortBy=High+-+low+price&index=" + index);
    
            }

        } catch (Exception e) {
            log("Error at Favorite:" + e.toString());
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
