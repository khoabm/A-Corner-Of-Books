/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author KHANG
 */
package acornerofbooks.model;

public class BookDTO {

    private String ISBN;
    private String title;
    private String author;
    private String description;
    private String image_link;
    private String publisher;
    private float price;
    private int avgRate;
    private int quantityLeft;
    private int quantityOrder;
    
        public BookDTO() {
    }
    
    public BookDTO(String ISBN, String title, String image_link, float price) {
        this.ISBN = ISBN;
        this.title = title;
        this.image_link = image_link;
        this.price = price;
    }

    public BookDTO(String ISBN, String title, String author, String description, String image_link, String publisher, float price, int avgRate, int quantityLeft) {
        this.ISBN = ISBN;
        this.title = title;
        this.author = author;
        this.description = description;
        this.image_link = image_link;
        this.publisher = publisher;
        this.price = price;
        this.avgRate = avgRate;
        this.quantityLeft = quantityLeft;
    }

    public BookDTO(String ISBN, String title, String author, String description, String image_link, String publisher, float price, int quantityLeft) {
        this.ISBN = ISBN;
        this.title = title;
        this.author = author;
        this.description = description;
        this.image_link = image_link;
        this.publisher = publisher;
        this.price = price;
        this.quantityLeft = quantityLeft;
    }

    public BookDTO(String ISBN, String title, float price, int quantityLeft) {
        this.ISBN = ISBN;
        this.title = title;
        this.price = price;
        this.quantityLeft = quantityLeft;
    }

    public BookDTO(String ISBN, String title, float price,int quantityOrder, int quantityLeft) {
        this.ISBN = ISBN;
        this.title = title;
        
        this.price = price;
        this.quantityOrder = quantityOrder;
        this.quantityLeft = quantityLeft;
    }

    public BookDTO(String ISBN, String title, String image_link, float price, int quantityLeft) {
        this.ISBN = ISBN;
        this.title = title;
        this.image_link = image_link;
        this.price = price;
        this.quantityLeft = quantityLeft;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage_link() {
        return image_link;
    }

    public void setImage_link(String image_link) {
        this.image_link = image_link;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getAvgRate() {
        return avgRate;
    }

    public void setAvgRate(int avgRate) {
        this.avgRate = avgRate;
    }

    public int getQuantityLeft() {
        return quantityLeft;
    }

    public void setQuantityLeft(int quantityLeft) {
        this.quantityLeft = quantityLeft;
    }

    public int getQuantityOrder() {
        return quantityOrder;
    }

    public void setQuantityOrder(int quantityOrder) {
        this.quantityOrder = quantityOrder;
    }
    
    

 

//    @Override
//    public int hashCode() {
//        int hash = 7;
//        hash = 59 * hash + Integer.parseInt((this.ISBN).trim());
//        return hash;
//    }
//
//    @Override
//    public boolean equals(Object obj) {
//        if (this == obj) {
//            return true;
//        }
//        if (obj == null) {
//            return false;
//        }
//        if (getClass() != obj.getClass()) {
//            return false;
//        }
//        final BookDTO other = (BookDTO) obj;
//        if (!this.ISBN.equals(other.ISBN)) {
//            return false;
//        }
//        return true;
//    }

    @Override
    public String toString() {
        return "BookDTO{" + "ISBN=" + ISBN + ", title=" + title + ", author=" + author + ", description=" + description + ", image_link=" + image_link + ", publisher=" + publisher + ", price=" + price + ", avgRate=" + avgRate + ", quantityLeft=" + quantityLeft + ", quantityOrder=" + quantityOrder + '}';
    }

}
