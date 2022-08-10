

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acornerofbooks.model;


/**
 *
 * @author ASUS
 */
import java.sql.Date;
import java.sql.Timestamp;
public class CommentDTO {
    private String email;
    private String ISBN;
    private Date time;
    private int rating;
    private String content;
    private String name;
    private Timestamp timeStamp;
    
    public CommentDTO() {
    }

    public CommentDTO(String email, String ISBN, int rating, String content) {
        this.email = email;
        this.ISBN = ISBN;
        //this.time = time;
        this.rating = rating;
        this.content = content;
    }

    public CommentDTO(String email, String ISBN, Date time, int rating, String content, String name) {
        this.email = email;
        this.ISBN = ISBN;
        this.time = time;
        this.rating = rating;
        this.content = content;
        this.name = name;
    }

    public CommentDTO(String email, String ISBN, Timestamp timeStamp, int rating, String content) {
        this.email = email;
        this.ISBN = ISBN;
        this.rating = rating;
        this.content = content;
        this.timeStamp = timeStamp;
    }
    
    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }


    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

//    @Override
//    public String toString() {
//        return "CommentDTO{" + "email=" + email + ", ISBN=" + ISBN + ", time=" + time + ", rating=" + rating + '}';
//    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(Timestamp timeStamp) {
        this.timeStamp = timeStamp;
    }
    
    
    
    
}
