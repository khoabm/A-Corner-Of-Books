/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package acornerofbooks.admin.model;

import OrderDTO.*;
import acornerofbooks.model.BookDTO;
import java.io.Serializable;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author admin
 */
public class OrderProductDTO_admin implements Serializable  {
    private int quantity;
    private String ISBN;
    private String title;
    private String author;
    private float price;

    public OrderProductDTO_admin(int quantity, String ISBN, String title, String author, float price) {
        this.quantity = quantity;
        this.ISBN = ISBN;
        this.title = title;
        this.author = author;
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    
    
}
