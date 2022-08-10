/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acornerofbooks.dbmanager;

import acornerofbooks.model.AccountDTO;
import acornerofbooks.model.CustomerDTO;
import acornerofbooks.model.OrderDTO;
import acornerofbooks.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class UserManager {

    //Check for user login
    public AccountDTO checkLogin(String email, String password) {
        AccountDTO acc = null;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT role "
                        + " FROM Account "
                        + " WHERE email=? AND [password] =? ";
                
                if(password == null){
                    sql =  " SELECT role "
                        + " FROM Account "
                        + " WHERE email=? AND [password] is null ";
                }
                st = conn.prepareStatement(sql);
                st.setString(1, email.trim());
                if(password != null)
                    st.setString(2, password);
                rs = st.executeQuery();
                if (rs.next()) {
                    String role = rs.getString("role").trim();
                    acc = new AccountDTO(email, password, role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return acc;
    }
    //check duplicate for create user

    public boolean checkDuplicate(String email) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT email "
                        + " FROM Account "
                        + " WHERE email=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
                rs = st.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
        //create new account
    public boolean insertAccount(AccountDTO acc) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO Account(email,password,role) "
                        + " VALUES(?,?,?) ";
                st = conn.prepareStatement(sql);
                st.setString(1, acc.getEmail());
                st.setString(2, acc.getPassword());
                st.setString(3, "user");
                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
        //create new customer
    public boolean insertCustomer(CustomerDTO cus) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO Customer(email,name,phone,birthday,gender,statusCustomer) "
                        + " VALUES(?,?,?,?,?,?) ";
                st = conn.prepareStatement(sql);
                st.setString(1, cus.getEmail());
                st.setString(2, cus.getName());
                st.setString(3, cus.getPhone());
                st.setString(4, cus.getDob().toString());
                st.setString(5, cus.getGender());
                st.setString(6, "active");
                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
        //Get data of login customer
    public CustomerDTO getCustomer(String email) {
        CustomerDTO cus = null;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT * "
                        + " FROM Customer "
                        + " WHERE email=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
                rs = st.executeQuery();
                if (rs.next()) {
                    cus = new CustomerDTO();
                    cus.setEmail(email);
                    cus.setName(rs.getString("name"));
                    cus.setPhone(rs.getString("phone"));
                    cus.setDob(rs.getDate("birthday"));
                    cus.setGender(rs.getString("gender"));
                    cus.setStatus(rs.getString("statusCustomer"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cus;
    }

        //insert google user
    public boolean insertGoogleAccount(String email) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO Account(email,role) "
                        + " VALUES(?,?) ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
                st.setString(2, "user");
                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    // This method updates password
    public static void updatePassword(String email, String newPassword) { // id: book's ISBN
        try {
            String sql = "UPDATE [Account]\n" +
                        "SET [password] = N'" + newPassword + "'\n" +
                        "WHERE [email] = N'" + email + "'";
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            rs.next();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
    
    // This method updates an account's information
    public static void updateAccount(String email, String newName, String newPhone, String newDate, String newGender) { // id: book's ISBN
        try {
            String sql = "UPDATE [Customer]\n" +
                        "SET [name] = N'" + newName + "', [phone] = N'" + newPhone + "', [birthday] = N'" + newDate + "', [gender] = N'" + newGender + "'\n" +
                        "WHERE [email] = N'" + email + "'";
//            System.out.println(sql);
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            rs.next();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
    
    // This method returns a list of order of a user based on the email
    public List<OrderDTO> getOrder(String email, int index) { // id: book's ISBN
        try {
            String sql = "SELECT [orderID], [time], [totalAmount]\n" +
                        "FROM [Order]\n" +
                        "WHERE [email] = N'" + email + "'\n" +
                        "ORDER BY [time] DESC\n" +
                        "OFFSET " + (index - 1) * 9 + " ROWS FETCH NEXT 9 ROWS ONLY";
//            System.out.println(sql);
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            
            ArrayList<OrderDTO> result;
            result = new ArrayList<OrderDTO>();
            
            while (rs.next()) {
                String orderID = rs.getString("orderID").trim();
                String time = rs.getString("time").trim();
                int totalAmount = rs.getInt("totalAmount");
                
                String sql_2 = "SELECT [title], [image]\n" +
                            "FROM [Book]\n" +
                            "WHERE [ISBN] IN\n" +
                            "	(SELECT [ISBN]\n" +
                            "	FROM [OrderProduct]\n" +
                            "	WHERE [orderID] = N'" + orderID + "')";
                Connection con_2 = DBUtils.getConnection();
                PreparedStatement st_2 = con.prepareStatement(sql_2);
                ResultSet rs_2 = st_2.executeQuery();
                int cnt = 0;
                String titles = "";
                String images = "";
                while (rs_2.next()) {
                    cnt++;
                    if (cnt == 1) titles += rs_2.getString("title").trim();
                    else if (cnt <= 3) titles += ", " + rs_2.getString("title").trim();
                    images += rs_2.getString("image").trim() + ",";
                }
                if (cnt > 3) titles += ",... and many more.";
                result.add(new OrderDTO(titles, images, time, totalAmount));
            }
            return result;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }
    
    // This method returns the total number of orders of a customer using his/her email
    public int countMatched(String email) { // searchText: the key words user typed; index: page number
        try {
            String sql = "SELECT COUNT(*)\n" +
                        "FROM [Order]\n" +
                        "WHERE [email] = N'" + email + "'";
            
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return 0;

    }
}
