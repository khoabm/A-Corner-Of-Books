/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acornerofbooks.model;

import java.sql.Date;

/**
 *
 * @author ASUS
 */
public class CustomerDTO {
    private String email;
    private String name;
    private String phone;
    private Date dob;
    private String gender;
    private String status;

    public CustomerDTO() {
    }

    public CustomerDTO(String email, String name, String phone, Date dob, String gender, String status) {
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.dob = dob;
        this.gender = gender;
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Customer{" + "email=" + email + ", name=" + name + ", phone=" + phone + ", dob=" + dob + ", gender=" + gender + ", status=" + status + '}';
    }
    
    
}
