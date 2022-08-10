/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package acornerofbooks.admin.controller;

import OrderDTO.OrderDAO;
import OrderProduct.OrderProductDAO;
import acornerofbooks.cart.CartDTO;
import acornerofbooks.dbmanager.BookManager;
import acornerofbooks.model.BookDTO;
import acornerofbooks.model.CustomerDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.cart.CartObject;

/**
 *
 * @author admin
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     */
    private final String ERROR = "checkOutError.html";
    private final String SUCCESS = "home";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = ERROR;
        try {
            //int totalAmount = 0;
            HttpSession session = request.getSession(false);
            if (session != null) {
                //CartObject cart = (CartObject) session.getAttribute("CART");
                CartDTO cart = (CartDTO) session.getAttribute("CART");
                CustomerDTO cus = (CustomerDTO) session.getAttribute("CUSTOMER_DETAIL");
                if (cart != null && cus != null) {
//                    Map<BookDTO, Integer> items = cart.getItems();
//                    if (items != null) {
//                        BookManager dao = new BookManager();
                    OrderDAO daoOrder = new OrderDAO();
                    java.util.Date utilDate = new java.util.Date();
                    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
                    String address = request.getParameter("addressDelivery");
                    String phone = request.getParameter("phoneDelivery");
                    String email = cus.getEmail();
                    String totalAmount = request.getParameter("totalAmount");

                    for (BookDTO book : cart.getCart().values()) {
                        if (book.getQuantityLeft() < book.getQuantityOrder()) {
                            request.setAttribute("errorQuantity", book.getTitle() + " is out of stock");
                            request.getRequestDispatcher("view/Cart/Cart1.jsp").forward(request, response);
                            return;
                        }
                    }

                    int newOrderID = OrderDAO.getNewID();

                    boolean check = daoOrder.createNewOrder(email, newOrderID, sqlDate, phone, address, "Pending", Float.parseFloat(totalAmount));
                    if (check) {
                        OrderProductDAO daoDetail = new OrderProductDAO();
                        for (BookDTO book : cart.getCart().values()) {
                            String isbn = book.getISBN();
                            int quantity = book.getQuantityOrder();
                            daoOrder.minusQuantityLeft(book.getISBN(), quantity);
                            daoDetail.createNewOrderProduct(Integer.toString(newOrderID), isbn, quantity);
                        }
                        url = SUCCESS;
                        session.removeAttribute("CART");
                    }

                }

            }

//        } catch (ClassNotFoundException e) {
//            log("CheckOutServlet_ClassNotFoundException: " + e.getMessage());
//        } catch (NamingException e) {
//            log("CheckOutServlet_NamingException: " + e.getMessage());
//        } catch (SQLException e) {
//            log("CheckOutServlet_SQLException: " + e.getMessage());
        } catch (Exception e) {
            log("Exception: " + e.getMessage());
        } finally {
            response.sendRedirect(url);
            out.close();
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
