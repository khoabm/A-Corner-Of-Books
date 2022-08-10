/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acornerofbooks.dbmanager;

import acornerofbooks.model.BookDTO;
import acornerofbooks.model.BookWithMatchCredit;
import acornerofbooks.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author ASUS
 */
public class BookManager {

    // This method is calculating the total number of books that match the searchText
    public int countMatched(String searchText, String genres, String rating) { // searchText: the key words user typed; index: page number
        try {
            for (int i = 0; i < searchText.length(); i++) {
                if (searchText.charAt(i) == '\'') { // ki tu '
                    searchText = searchText.substring(0, i) + "'" + searchText.substring(i);
                    i++;
                }
            }
            //String sql = "SELECT [ISBN], [title], [image], [price] FROM [Book] WHERE [title] LIKE '%" + searchText + "%'"; // Kiem tra truong hop text co dau '
//            String sql = "SELECT COUNT (*)\n" +
//                        "FROM [Book]\n" +
//                        "WHERE [title] LIKE '%" + searchText + "%'";

            String sql = "SELECT COUNT(*)\n" +
                        "FROM [Book]\n" +
                        "WHERE ([title] LIKE '%" + searchText + "%' OR [author] = N'" + searchText + "')\n";
            if (rating != null && !rating.equals("all")) {
                sql += " AND avgRate >= " + rating + " ";
            }
            if (genres != null && !genres.equals("all")) {
                sql += " AND [ISBN] IN\n"
                        + "		(SELECT [ISBN]\n"
                        + "		FROM [ProductTag]\n"
                        + "		WHERE [tagName] = N'" + genres + "')\n";
            }

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

    // This method returns the list of books that match the searchText, on page index
    public List<BookDTO> search(String searchText, int index, String genres, String rating, String sortBy) { // searchText: the key words user typed; index: page number
        try {
            for (int i = 0; i < searchText.length(); i++) {
                if (searchText.charAt(i) == '\'') { // ki tu '
                    searchText = searchText.substring(0, i) + "'" + searchText.substring(i);
                    i++;
                }
            }
            //String sql = "SELECT [ISBN], [title], [image], [price] FROM [Book] WHERE [title] LIKE '%" + searchText + "%'"; // Kiem tra truong hop text co dau '
//            String sql = "SELECT [ISBN], [title], [image], [price]\n" +
//                        "FROM [Book]\n" +
//                        "WHERE [title] LIKE '%" + searchText + "%'\n" +
//                        "ORDER BY [ISBN]\n" +
//                        "OFFSET " + (index - 1) * 9 + " ROWS FETCH NEXT 9 ROWS ONLY";

            String sql = "SELECT [ISBN], [title], [image], [price], [quantityLeft]\n" +
                        "FROM [Book]\n" +
                        "WHERE ([title] LIKE '%" + searchText + "%' OR [author] = N'" + searchText + "')\n";
            
            if (rating != null && !rating.equals("all")) {
                sql += " AND avgRate >= " + rating + " ";
            }
            if (genres != null && !genres.equals("all")) {
                sql += " AND [ISBN] IN\n"
                        + "		(SELECT [ISBN]\n"
                        + "		FROM [ProductTag]\n"
                        + "		WHERE [tagName] = N'" + genres + "')\n";
            }

            if (sortBy != null && !sortBy.equals("")) {
                if (sortBy.equals("Low - high price")) {
                    sortBy = "ASC";
                } else {
                    sortBy = "DESC";
                }
                sql += "ORDER BY price " + sortBy + "\n";
            } else {
                sql += "ORDER BY [ISBN]\n";
            }
            sql += "OFFSET " + (index - 1) * 9 + " ROWS FETCH NEXT 9 ROWS ONLY";
System.out.println(sql);
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            ArrayList<BookDTO> list;
            list = new ArrayList<BookDTO>();

            while (rs.next()) {
                String ISBN = rs.getString("ISBN");
                String title = rs.getString("title");
                String image_link = rs.getString("image");
                float price = rs.getFloat("price");
                int quantityLeft = rs.getInt("quantityLeft");
                BookDTO matchedBook = new BookDTO(ISBN, title, image_link, price, quantityLeft);
                list.add(matchedBook);
            }
            return list;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    // This method returns all availble tags
    public List<String> findAllTags() { // id: book's ISBN
        try {
            String sql = "SELECT [tagName]\n"
                    + "FROM [Tag]";

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            ArrayList<String> list;
            list = new ArrayList<String>();

            while (rs.next()) {
                String tagName = rs.getString("tagName").trim();

                list.add(tagName);
            }
            return list;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    //Method returns tag except the tag of a specify book
    public List<String> findTagsExcept(String isbn) { // id: book's ISBN
        try {
            String sql = " SELECT [tagName]\n "
                    + " FROM [Tag]\n "
                    + " WHERE tagName!= ALL\n "
                    + " (SELECT tagName FROM ProductTag WHERE ISBN=?) ";

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, isbn);
            ResultSet rs = st.executeQuery();

            ArrayList<String> list;
            list = new ArrayList<String>();

            while (rs.next()) {
                String tagName = rs.getString("tagName").trim();

                list.add(tagName);
            }
            return list;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    // This method return all data of a book using its ISBN
    public BookDTO searchSingleBook(String bookid) { // id: book's ISBN
        try {
            String sql = "SELECT [ISBN], [title], [author], [description], [image], [publisher], [price], [avgRate], [quantityLeft]\n"
                    + "FROM [Book]\n"
                    + "WHERE [ISBN] = N'" + bookid + "'";

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String ISBN = rs.getString("ISBN").trim();
                String title = rs.getString("title").trim();
                String author = rs.getString("author").trim();
                String description = rs.getString("description").trim();
                String image_link = rs.getString("image").trim();
                String publisher = rs.getString("publisher").trim();
                float price = rs.getFloat("price");
                int avgRate = rs.getInt("avgRate");
                int quantityLeft = rs.getInt("quantityLeft");

                BookDTO matchedBook = new BookDTO(ISBN, title, author, description, image_link, publisher, price, avgRate, quantityLeft);
                return matchedBook;
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    // This method return all tags of a book using its ISBN
    public List<String> findTags(String bookid) { // id: book's ISBN
        try {
            String sql = "SELECT tagName\n"
                    + "FROM [ProductTag]\n"
                    + "WHERE [ISBN] = N'" + bookid + "'";

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            ArrayList<String> list;
            list = new ArrayList<String>();

            while (rs.next()) {
                String tagName = rs.getString("tagName").trim();

                list.add(tagName);
            }
            return list;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    // This method returns number of common tags of 2 books with ISBN
    public static int commonTag(String bookid1, String bookid2) { // id: book's ISBN
        try {
            String sql = "SELECT COUNT(*)\n"
                    + "FROM ProductTag\n"
                    + "WHERE ISBN = N'" + bookid1 + "' AND tagName IN\n"
                    + "	(SELECT tagName\n"
                    + "	FROM ProductTag\n"
                    + "	WHERE ISBN = N'" + bookid2 + "')  ";

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

    // This method returns a full list of recommended books descendantly sorted by number of matched tags
    public List<BookWithMatchCredit> recommend(String bookid) { // id: book's ISBN
        try {
            String sql = "SELECT [ISBN], [title], [image], [price], [quantityLeft] \n"
                    + "FROM [Book]";

            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            ArrayList<BookWithMatchCredit> allBookList;
            allBookList = new ArrayList<BookWithMatchCredit>();

            while (rs.next()) {
                String ISBN = rs.getString("ISBN");
                String title = rs.getString("title");
                String image = rs.getString("image");
                float price = rs.getFloat("price");
                int quantityLeft = rs.getInt("quantityLeft");
                allBookList.add(new BookWithMatchCredit(ISBN, title, image, price, 0, quantityLeft));
            }

            for (BookWithMatchCredit book : allBookList) {
                book.setMatchCredit(commonTag(bookid, book.getISBN()));
            }

            Collections.sort(allBookList);

            ArrayList<BookWithMatchCredit> cutList;
            cutList = new ArrayList<BookWithMatchCredit>();
            int cnt = 0;
            for (BookWithMatchCredit book : allBookList) {
                if (!book.getISBN().trim().equals(bookid.trim())) {
                    cnt++;
                    cutList.add(book);
                    if (cnt == 15) {
                        break;
                    }
                }
            }

            return cutList;

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<String> getAllFavourite(String email) {
        List<String> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ISBN FROM Favourite "
                        + " where email=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
                rs = st.executeQuery();
                while (rs.next()) {
                    String isbn = rs.getString("ISBN").trim();
                    list.add(isbn);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean addToFavorite(String isbn, String email) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Favourite(email,ISBN) "
                        + " VALUES(?,?) ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
                st.setString(2, isbn);
            }

            check = st.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public int totalFavorite(String email) {
        int total = 0;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT count(*) "
                        + " FROM Favourite WHERE email=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
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

    public List<BookDTO> getFavoriteList(String email, int index) {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * "
                        + " FROM Book b join Favourite f on b.ISBN = f.ISBN"
                        + " WHERE email=? "
                        + " ORDER BY email "
                        + " OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
                st.setInt(2, (index - 1) * 9);
                rs = st.executeQuery();
                while (rs.next()) {
                    String isbn = rs.getString("ISBN").trim();
                    String title = rs.getString("title").trim();
                    String image = rs.getString("image").trim();
                    float price = rs.getFloat("price");
                    int quantityLeft = rs.getInt("quantityLeft");
                    BookDTO matchedBook = new BookDTO(isbn, title, image, price, quantityLeft);
                    list.add(matchedBook);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int totalBooks() {
        int total = 0;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT count(*) "
                        + " FROM Book ";
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

    public List<BookDTO> getListAdmin(int index) {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * "
                        + " FROM Book "
                        + " ORDER BY ISBN "
                        + " OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY ";
                st = conn.prepareStatement(sql);
                st.setInt(1, (index - 1) * 10);
                rs = st.executeQuery();
                while (rs.next()) {
                    String isbn = rs.getString("ISBN");
                    String title = rs.getString("title");
                    String author = rs.getString("author");
                    String description = rs.getString("description");
                    String image = rs.getString("image");
                    String publisher = rs.getString("publisher");
                    float price = rs.getFloat("price");
                    int rating = rs.getInt("avgRate");
                    int quantityLeft = rs.getInt("quantityLeft");
                    list.add(new BookDTO(isbn, title, author, description, image, publisher, price, rating, quantityLeft));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//        public List<BookDTO> top6(String tag){
//        List<BookDTO> list = new ArrayList<>();
//     public BookDTO getBookByISBN(String ISBN) throws SQLException, NamingException {
//        BookDTO result = null;
//        Connection conn = null;
//        PreparedStatement st = null;
//        ResultSet rs = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                String sql = "  SELECT top 6 b.ISBN,title,image,price \n" +
//                             "  FROM Book b join ProductTag t on b.ISBN = t.ISBN \n" +
//                             "  WHERE tagName=?\n" +
//                             "  ORDER BY avgRate desc ";
//                st = conn.prepareStatement(sql);
//                st.setString(1, tag);
//                String sql = " SELECT * "
//                        + " FROM Book "
//                        + " where ISBN=? ";
//                st = conn.prepareStatement(sql);
//                st.setString(1, ISBN);
//                rs = st.executeQuery();
//                while (rs.next()) {
//                    String isbn = rs.getString("ISBN").trim();
//                    String title = rs.getString("title").trim();
//                    String image = rs.getString("image").trim();
//                    float price = rs.getFloat("price");
//                    list.add(new BookDTO(isbn, title, image, price));
//                    String author = rs.getString("author").trim();
//                    float price = rs.getFloat("price");
//                    int quantity = rs.getInt("quantityLeft");
//                    result = new BookDTO(isbn, title, author, price, quantity);
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return result;
//    }
//
//        return list;
//    }
    public BookDTO getBookByISBN(String ISBN, int quantityOrder){
        BookDTO result = null;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT * "
                        + " FROM Book "
                        + " where ISBN=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, ISBN);
                rs = st.executeQuery();
                while (rs.next()) {
                    String isbn = rs.getString("ISBN").trim();
                    String title = rs.getString("title").trim();
                    //String author = rs.getString("author").trim();
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantityLeft");
                    result = new BookDTO(isbn, title, price, quantityOrder, quantity);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<BookDTO> top6(String tag) {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "  SELECT top 6 b.ISBN,title,image,price,quantityLeft \n"
                        + "  FROM Book b join ProductTag t on b.ISBN = t.ISBN \n"
                        + "  WHERE tagName=?\n"
                        + "  ORDER BY avgRate desc ";
                st = conn.prepareStatement(sql);
                st.setString(1, tag);
                rs = st.executeQuery();
                while (rs.next()) {
                    String isbn = rs.getString("ISBN").trim();
                    String title = rs.getString("title").trim();
                    String image = rs.getString("image").trim();
                    float price = rs.getFloat("price");
                    int quantityLeft = rs.getInt("quantityLeft");
                    list.add(new BookDTO(isbn, title, image, price, quantityLeft));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
        public boolean deleteFavorite(String email, String isbn) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement st = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " DELETE FROM Favourite"
                            + " WHERE email=? AND ISBN=? ";
                st = conn.prepareStatement(sql);
                st.setString(1, email);
                st.setString(2, isbn);
                check = st.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return check;
    }
   
    public static void main(String[] args) {
        BookManager manager = new BookManager();
        List<BookDTO> list = manager.top6("fiction");
        for (BookDTO bookDTO : list) {
            System.out.println(bookDTO);
        }
    }
}
