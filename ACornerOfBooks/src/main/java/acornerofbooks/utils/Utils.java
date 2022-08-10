/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acornerofbooks.utils;

import acornerofbooks.model.BookDTO;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class Utils {
    public static boolean ifExist(String isbn, List<String> list){
        boolean check = false;
        for (String s : list) {
            if(isbn.equals(s))
                check = true;
        }       
        return check;
    }
}
