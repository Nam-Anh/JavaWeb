/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**
 *
 * @author anhlhnse05444
 */
public class SharingGenerator {
    public static String generateLink(){
        String code = "<div id=\"content_right_site\" class = \"col-3\">\n" +
"                    <!--Right Site-->    \n" +
"                    <div class=\"sharing-options border-round\">\n" +
"                        <!--Sharing-->\n" +
"                        <ul>\n" +
"                            <li>\n" +
"                                <h6>Share this page</h6>\n" +
"                            </li>\n" +
"                            <li>\n" +
"                                <div class=\"social-icon\"></div>\n" +
"                                <a href = \"#\">Share on Facebook </a>\n" +
"                            </li>\n" +
"                            <li>\n" +
"                                <div class=\"social-icon\"></div>\n" +
"                                <a href = \"#\">Share on Twitter </a>\n" +
"                            </li>\n" +
"                            <li>\n" +
"                                <div class=\"social-icon\"></div>\n" +
"                                <a href = \"#\">Share on Google </a>\n" +
"                            </li>\n" +
"                        </ul>\n" +
"                    </div>\n" +
"                </div>";
        
        return code;
    }
}
