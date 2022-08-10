/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package OrderDTO;

import acornerofbooks.admin.model.OrderDTO_admin;
import acornerofbooks.admin.model.OrderProductDTO_admin;

//import acornerofbooks.model.BookDTO;
//import acornerofbooks.utils.DBUtils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import acornerofbooks.utils.DBUtils;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class OrderDAO implements Serializable {

    public static int getNewID() {
        
        try {
            String sql = "SELECT MAX([orderID]) as lastID\n"
                    + "FROM [Order]";

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            int newID = 0;
            int lastID = 0;
            while (rs.next()) {
                 lastID = Integer.parseInt(rs.getString("lastID").trim());
            }
            newID = lastID + 1;
            return newID;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return 0;
    }

    public boolean createNewOrder(String email, int orderID, Date time, String phone,
            String address, String status, float totalAmount)
            throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO [Order] (email, orderID, time, phone, "
                        + "address, statusOrder, totalAmount) "
                        + "VALUES (?,?,?,?,?,?,?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, email);
                ps.setInt(2, orderID);
                ps.setDate(3, time);
                ps.setString(4, phone);
                ps.setString(5, address);
                ps.setString(6, status);
                ps.setFloat(7, totalAmount);
                int row = ps.executeUpdate();
                if (row > 0) {
                    result = true;
                }

            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
            return result;
        }
    }

    public static void minusQuantityLeft(String ISBN, int quantityOrder) {
        try {
            String sql = "UPDATE [Book] \n" +
                        "SET [quantityLeft] = [quantityLeft] - " + quantityOrder + "\n" +
                        "WHERE [ISBN] = N'" + ISBN + "'";

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public int createNewOrder(String orderID) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int result = -1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Order (orderID)"
                        + "VALUES (?)";
                ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
                ps.setString(1, orderID);
                int row = ps.executeUpdate();
                if (row > 0) {
                    rs = ps.getGeneratedKeys();
                    if (rs.next()) {
                        result = rs.getInt(1);
                    }
                }
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
            return result;
        }
    }

    // This method returns total number of orders
    public int totalOrders() {
        int total = 0;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT count(*) "
                        + " FROM [Order] ";
                st = conn.prepareStatement(sql);
                rs = st.executeQuery();
                while (rs.next()) {
                    total = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }

    // This method return all order ID
    public List<OrderDTO_admin> getDetailOrder(int index) { // id: book's ISBN
        try {

            String sql = "SELECT [orderID], [time], [phone], [address], [statusOrder], [totalAmount]\n"
                    + "FROM [Order]\n"
                    + "ORDER BY [time] DESC\n"
                    + "OFFSET " + (index - 1) * 9 + " ROWS FETCH NEXT 9 ROWS ONLY";

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            ArrayList<OrderDTO_admin> listResult;
            listResult = new ArrayList<OrderDTO_admin>();

            while (rs.next()) {

                String orderID = rs.getString("orderID").trim();
                Date time = rs.getDate("time");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String statusOrder = rs.getString("statusOrder");
                int totalAmount = rs.getInt("totalAmount");

                String sql_2 = "SELECT O.quantity as quantity, B.ISBN as ISBN, B.title as title, B.author as author, B.price as price\n"
                        + "FROM [OrderProduct] O JOIN [Book] B ON O.ISBN = B.ISBN\n"
                        + "WHERE O.orderID = N'" + orderID + "'";

                Connection con_2 = DBUtils.getConnection();
                PreparedStatement st_2 = con_2.prepareStatement(sql_2);
                ResultSet rs_2 = st_2.executeQuery();

                ArrayList<OrderProductDTO_admin> bookList;
                bookList = new ArrayList<OrderProductDTO_admin>();
                while (rs_2.next()) {

                    int quantity = rs_2.getInt("quantity");
                    String ISBN = rs_2.getString("ISBN");
                    String title = rs_2.getString("title");
                    String author = rs_2.getString("author");
                    float price = rs_2.getFloat("price");

                    OrderProductDTO_admin book = new OrderProductDTO_admin(quantity, ISBN, title, author, price);
                    bookList.add(book);
                }
                OrderDTO_admin order = new OrderDTO_admin(orderID, time, phone, address, statusOrder, totalAmount, bookList);
                listResult.add(order);
            }
            return listResult;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public static void changeStatus(String orderID) {
        try {
            String sql = "SELECT [statusOrder]\n"
                    + "FROM [Order]\n"
                    + "WHERE [orderID] = N'" + orderID + "'";
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            String currentStatus = "";
            while (rs.next()) {
                currentStatus = rs.getString(1);
            }

            currentStatus = currentStatus.trim().equals("Pending") ? "Delivered" : "Pending";
            sql = "UPDATE [Order]\n"
                    + "SET [statusOrder] = N'" + currentStatus + "'\n"
                    + "WHERE [orderID] = N'" + orderID + "'";

            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            rs.next();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public static void main(String[] args) {
//        OrderDAO.minusQuantityLeft("182764885", 8);
    }

}
