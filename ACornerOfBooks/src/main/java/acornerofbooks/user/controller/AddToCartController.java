/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acornerofbooks.user.controller;

import acornerofbooks.cart.CartDTO;
import acornerofbooks.dbmanager.BookManager;
import acornerofbooks.model.BookDTO;
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
@WebServlet(name = "AddToCartControllerr", urlPatterns = {"/addtocart"})
public class AddToCartController extends HttpServlet {

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
            String location = request.getParameter("location");

            String isbn = request.getParameter("bookid");
            //String title = request.getParameter("title");
            String quantity = request.getParameter("quantity");
            //String price = request.getParameter("price");
            HttpSession ss = request.getSession();
            CartDTO cart = (CartDTO) ss.getAttribute("CART");
            BookManager manager = new BookManager();

            BookDTO book = manager.getBookByISBN(isbn, Integer.parseInt(quantity));

            //book.setQuantityOrder(book.getQuantityOrder() + Integer.parseInt(quantity));
            if (cart == null) {
                cart = new CartDTO();
                System.out.println("null");
            }
            
                cart.add(book);
  
            //System.out.println(cart);
            ss.setAttribute("CART", cart);
            for (BookDTO bookV : cart.getCart().values()) {
                System.out.println(bookV);
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
                return;
            }else if("favorite".equals(location)){
                response.sendRedirect("favourite");
            }else{
                response.sendRedirect("home");
            }
        } catch (Exception e) {
            log("Error at AddToCart " + e.toString());
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
