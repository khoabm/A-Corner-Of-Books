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
public class OrderDTO {
    private String titles;
    private String images;
    private String date;
    private int totalAmount;

    public OrderDTO(String titles, String images, String date, int totalAmount) {
        this.titles = titles;
        this.images = images;
        this.date = date;
        this.totalAmount = totalAmount;
    }

    public String getTitles() {
        return titles;
    }

    public void setTitles(String titles) {
        this.titles = titles;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }
}
