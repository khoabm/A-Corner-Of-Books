/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acornerofbooks.dbmanager;

import acornerofbooks.model.AdminDTO;
import acornerofbooks.model.BookDTO;
import acornerofbooks.model.CommentDTO;
import acornerofbooks.model.CustomerDTO;
import acornerofbooks.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class AdminManager {
    
    
    public AdminDTO getAdmin(String email){
        AdminDTO ad = null;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT * "
                        + " FROM Admin "
                        + " WHERE email=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
                rs = st.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    ad = new AdminDTO(email, name);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ad;
    }
    
    public boolean addBook(BookDTO book) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Book(ISBN,title,author,description,image,publisher,price,avgRate,quantityLeft,numberRating) "
                        + " VALUES(?,?,?,?,?,?,?,?,?,?) ";
                st = conn.prepareStatement(sql);
                st.setString(1, book.getISBN());
                st.setString(2, book.getTitle());
                st.setString(3, book.getAuthor());
                st.setString(4, book.getDescription());
                st.setString(5, book.getImage_link());
                st.setString(6, book.getPublisher());
                st.setFloat(7, book.getPrice());
                st.setFloat(8, 0);
                st.setInt(9, book.getQuantityLeft());
                st.setInt(10, 0);
            }

            check = st.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean addTag(String isbn, String tag) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO ProductTag(ISBN, tagName) "
                        + " VALUES(?,?) ";
                st = conn.prepareStatement(sql);
                st.setString(1, isbn);
                st.setString(2, tag);
            }

            check = st.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateBook(BookDTO book) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Book \n"
                        + "SET title=?,author=? ,[description]=? ,[image]=?, publisher=?, price=?, quantityLeft=?\n"
                        + "WHERE ISBN=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, book.getTitle());
                st.setString(2, book.getAuthor());
                st.setString(3, book.getDescription());
                st.setString(4, book.getImage_link());
                st.setString(5, book.getPublisher());
                st.setFloat(6, book.getPrice());
                st.setInt(7, book.getQuantityLeft());
                st.setString(8, book.getISBN());
            }

            check = st.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteProductTag(String isbn) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "DELETE FROM ProductTag "
                        + " WHERE ISBN=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, isbn);
            }

            check = st.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
        public boolean deleteBook(String isbn) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "DELETE FROM Book "
                        + " WHERE ISBN=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, isbn);
            }

            check = st.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public int totalCustomer() {
        int total = 0;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT count(*) "
                        + " FROM Customer ";
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

    public List<CustomerDTO> getAllAccounts(int index) {
        List<CustomerDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * "
                        + " FROM Customer "
                        + " ORDER BY email "
                        + " OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY ";
                st = conn.prepareStatement(sql);
                st.setInt(1, (index - 1) * 20);
                rs = st.executeQuery();
                while (rs.next()) {
                    String email = rs.getString("email");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    Date dob = rs.getDate("birthday");
                    String gender = rs.getString("gender");
                    String statusCustomer = rs.getString("statusCustomer");
                    list.add(new CustomerDTO(email, name, phone, dob, gender, statusCustomer));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void disableUser(String email) {

        Connection conn = null;
        PreparedStatement st = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE Customer \n " +
                             " SET statusCustomer = 'disabled' "
                        +    " WHERE email=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
            }
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void activeUser(String email) {

        Connection conn = null;
        PreparedStatement st = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE Customer \n " +
                             " SET statusCustomer = 'active' "
                        +    " WHERE email=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
            }
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
        public void deleteUser(String email) {

        Connection conn = null;
        PreparedStatement st = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " DELETE FROM Account \n " 
                        +    " WHERE email=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
            }
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // This method returns total number of comments
    public int totalComments() {
        int total = 0;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(*)\n" +
                            "FROM [Comment]";
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

    // This method return all comment with pagination
    public List<CommentDTO> getComment(int index) { // id: book's ISBN
        try {

            String sql = "SELECT [email], [ISBN], [time], [rating], [content]\n"
                    + "FROM [Comment]\n"
                    + "ORDER BY [time] DESC\n"
                    + "OFFSET " + (index - 1) * 20 + " ROWS FETCH NEXT 20 ROWS ONLY";

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            ArrayList<CommentDTO> listResult;
            listResult = new ArrayList<CommentDTO>();

            while (rs.next()) {
                String email = rs.getString("email").trim();
                String ISBN = rs.getString("ISBN").trim();
                Timestamp time = Timestamp.valueOf(rs.getString("time"));
                int rating = rs.getInt("rating");
                String content = rs.getString("content");

                CommentDTO comment = new CommentDTO(email, ISBN, time, rating, content);
                listResult.add(comment);
            }
            return listResult;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public static void deleteComment(String email, String ISBN, String time) {
        try {
            String sql = "DELETE FROM [Comment]\n" +
                        "WHERE [email] = N'" + email + "' AND [ISBN] = N'" + ISBN + "' AND [time] = N'" + time + "'";
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            rs.next();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
    
    public static void main(String[] args) {
        AdminManager manager = new AdminManager();
//        List<Customer> list = new ArrayList<>();
//        list = manager.getAllAccounts(1);
//        for (Customer customer : list) {
//            System.out.println(customer);
//        }
        
        manager.disableUser("hoanghuyentrang@gmail.com");
    }
}
