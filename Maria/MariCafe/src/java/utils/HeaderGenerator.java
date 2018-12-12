/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.util.ArrayList;

/**
 *
 * @author anhlhnse05444
 */
public class HeaderGenerator {

    public static String generateHeader(String currentPage) {
        ArrayList<String> pages = new ArrayList<String>();
        pages.add("Home");
        pages.add("About My Cakes");
        pages.add("Find Maria's Cafe");
        String code ="";
        for(String p : pages){
            if(!p.equals(currentPage)){
                code += "";
            }else{
                
            }
        }
        
        return code;
    }
}
