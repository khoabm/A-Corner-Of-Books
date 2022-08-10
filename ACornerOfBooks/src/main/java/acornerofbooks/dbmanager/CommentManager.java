/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acornerofbooks.dbmanager;

import acornerofbooks.model.CommentDTO;
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
public class CommentManager {
        public boolean getComment(CommentDTO com) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
//        long millis = System.currentTimeMillis();
//        java.sql.Date date = new java.sql.Date(millis);
            long now = System.currentTimeMillis();
            Timestamp date = new Timestamp(now);

            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO Comment "
                        + " VALUES(?,?,?,?,?) ";
                st = conn.prepareStatement(sql);
                st.setString(1, com.getEmail());
                st.setString(2, com.getISBN());
                st.setTimestamp(3, date);
                st.setInt(4, com.getRating());
                st.setString(5, com.getContent());
                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return check;
    }

    public List<CommentDTO> getList(String isbn, int index) {
        List<CommentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT co.email, content, rating, [time], c.[name] as name "
                        + " FROM Comment co join Customer c on co.email = c.email WHERE ISBN=? "
                        + " ORDER BY time "
                        + " OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY ";
                st = conn.prepareStatement(sql);
                st.setString(1, isbn);
                st.setInt(2, (index - 1) * 3);

                rs = st.executeQuery();
                while (rs.next()) {

                    String email = rs.getString("email");
                    String content = rs.getString("content");
                    int rating = rs.getInt("rating");
                    Date date = rs.getDate("time");
                    String name = rs.getString("name");
                    list.add(new CommentDTO(email, isbn, date, rating, content, name));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int totalComments(String isbn) {
        int total = 0;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT count(*) "
                        + " FROM Comment "
                        + " WHERE ISBN=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, isbn);
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
    
        public boolean updateRating(String isbn, int rating) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
//        long millis = System.currentTimeMillis();
//        java.sql.Date date = new java.sql.Date(millis);
            long now = System.currentTimeMillis();
            Timestamp date = new Timestamp(now);

            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "   UPDATE Book\n"
                        + "  SET numberRating = numberRating +1\n"
                        + "  WHERE ISBN=?\n"
                        
                        + "  UPDATE Book\n"
                        + "  SET avgRate = (avgRate * (numberRating-1) + ?) / numberRating\n"
                        + "  WHERE ISBN=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, isbn);
                st.setInt(2, rating);
                st.setString(3, isbn);
                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return check;
    }
}
