/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package acornerofbooks.admin.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author admin
 */
public class OrderDTO_admin implements Serializable  {
    private String orderID;
    private Date time;
    private String phone;
    private String address;
    private String statusOrder;
    private int totalAmount;
    private List<OrderProductDTO_admin> listBook;

    public OrderDTO_admin(String orderID, Date time, String phone, String address, String statusOrder, int totalAmount, List<OrderProductDTO_admin> listBook) {
        this.orderID = orderID;
        this.time = time;
        this.phone = phone;
        this.address = address;
        this.statusOrder = statusOrder;
        this.totalAmount = totalAmount;
        this.listBook = listBook;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatusOrder() {
        return statusOrder.trim();
    }

    public void setStatusOrder(String statusOrder) {
        this.statusOrder = statusOrder;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public List<OrderProductDTO_admin> getListBook() {
        return listBook;
    }

    public void setListBook(List<OrderProductDTO_admin> listBook) {
        this.listBook = listBook;
    }

    
}
