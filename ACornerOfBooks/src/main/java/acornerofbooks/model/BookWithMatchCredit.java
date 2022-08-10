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
public class BookWithMatchCredit implements Comparable<BookWithMatchCredit> {
    private String ISBN;
    private String title;
    private String image;
    private float price;
    private int matchCredit;
    private int quantityLeft;

    public BookWithMatchCredit(String ISBN, String title, String image, float price, int matchCredit, int quantityLeft) {
        this.ISBN = ISBN;
        this.title = title;
        this.image = image;
        this.price = price;
        this.matchCredit = matchCredit;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getMatchCredit() {
        return matchCredit;
    }

    public void setMatchCredit(int matchCredit) {
        this.matchCredit = matchCredit;
    }

    public int getQuantityLeft() {
        return quantityLeft;
    }

    public void setQuantityLeft(int quantityLeft) {
        this.quantityLeft = quantityLeft;
    }

    @Override
    public String toString() {
        return "BookWithMatchCredit{" + "ISBN=" + ISBN + ", title=" + title + ", image=" + image + ", price=" + price + ", matchCredit=" + matchCredit + ", quantityLeft=" + quantityLeft + '}';
    }
    
    
    
    @Override
    public int compareTo(BookWithMatchCredit other) {
        // sort student's name by ASC
        return (other.getMatchCredit()) - (this.getMatchCredit());
    }
    
    
}
