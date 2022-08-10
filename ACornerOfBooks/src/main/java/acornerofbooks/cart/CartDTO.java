/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acornerofbooks.cart;

import acornerofbooks.model.BookDTO;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public class CartDTO {
    private Map<String, BookDTO> cart;

    public CartDTO() {
    }

    public CartDTO(Map<String, BookDTO> cart) {
        this.cart = cart;
    }

    public Map<String, BookDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, BookDTO> cart) {
        this.cart = cart;
    }
    
        public void add(BookDTO book) {
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(book.getISBN())) {
            int currentQuantity = this.cart.get(book.getISBN()).getQuantityOrder();
            book.setQuantityOrder(currentQuantity + book.getQuantityOrder());
        }
        cart.put(book.getISBN(), book);
    }
        
      public void delete(String isbn) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(isbn)) {
            this.cart.remove(isbn);
        }
    }
      
      public static void main(String[] args) {
        CartDTO cart = new CartDTO();
        
        cart.add(new BookDTO("123456789", "abc", 1, 10, 10));
        cart.add(new BookDTO("123456789", "abc", 1, 1, 1));
        cart.add(new BookDTO("987654321", "hehe", 1, 1, 1));
        cart.delete("123456789");
        for (BookDTO bookV : cart.getCart().values()) {
            System.out.println(bookV);
        }
    }
}
