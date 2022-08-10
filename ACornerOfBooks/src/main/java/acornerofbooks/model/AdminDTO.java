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
public class AdminDTO {
    private String email;
    private String name;

    public AdminDTO() {
    }

    public AdminDTO(String email, String name) {
        this.email = email;
        this.name = name;
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

    @Override
    public String toString() {
        return "AdminDTO{" + "email=" + email + ", name=" + name + '}';
    }
    
    
}
