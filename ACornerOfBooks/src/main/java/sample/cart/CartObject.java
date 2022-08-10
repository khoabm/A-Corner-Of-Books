/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.cart;

import acornerofbooks.model.BookDTO;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author admin
 */
public class CartObject implements Serializable{
    private Map<BookDTO, Integer> items;

    public Map<BookDTO, Integer> getItems() {
        return items;
    }

    public CartObject() {
    }

    public void addItemToCart(BookDTO dto) {
        if (this.items == null) {
            this.items = new HashMap<>();
        }
        int quantity = 1;
        if (this.items.containsKey(dto)) {
            quantity = this.items.get(dto) + 1;
        }
        this.items.put(dto, quantity);
    }

    public void removeItem(String ISBN) {
        if (this.items == null) {
            return;
        }
        BookDTO dto = new BookDTO();
        dto.setISBN(ISBN);
        if (this.items.containsKey(dto)) {
            this.items.remove(dto);
            if (this.items.isEmpty()) {
                this.items = null;
            }
        }
    }
}
