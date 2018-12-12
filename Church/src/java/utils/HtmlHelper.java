package utils;

import java.lang.Exception;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author anhlhnse05444
 */
public class HtmlHelper {

    public static String generateHyperlink(String href, String innerText) {
        String link = "<li><a href=\"" + href + "\">" + innerText + "</a></li>";
        return link;
    }

    public static String pagger(int pageIndex, int totalPage, String currentPage) throws Exception {
        /*Check case in which page-index is out-of-range*/
        if(pageIndex > totalPage){
            Exception ex = new Exception("Customer accesses page out of range"); 
            //Log error
            Logger.getLogger(HtmlHelper.class.getName()).log(Level.SEVERE,  null, ex);
            //Throw to error page
            throw ex;
        }
        /*---------If page-index if in range, continue processing-------------*/
        String result = "";
        //Generate tag a with link for all page from 1 to the current pageIndex
        for (int i = 1; i < pageIndex; i++) {
            result += generateHyperlink(currentPage+"?page=" + i, "" + i);
        }
        
        //Generate the span tag for the current pageIndex
        result += "<li><span>" + pageIndex + "</span></li>";
        
        //Generate tag a with link for all pages from the current page to the last one
        for (int i = pageIndex + 1; i <= totalPage; i++) {
            result += generateHyperlink(currentPage+"?page=" + i, "" + i);
        }
        
        return result;
    }
}
