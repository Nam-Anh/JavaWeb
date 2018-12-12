/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.naming.Context;
import javax.naming.InitialContext;

/**
 *
 * @author anhlhnse05444
 */
public class BaseDAO {

    public Connection conn = null;
    private static String connectionURL = "";
    private static String user = "";
    private static String pass = "";
    private static String photoPath = "";

    private static void initConfig() throws Exception {
        try {
            InitialContext initialContext = new InitialContext();
            Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
            connectionURL = (String) environmentContext.lookup("myConnectionURL");
            user = (String) environmentContext.lookup("databaseUser");
            pass = (String) environmentContext.lookup("databasePass");
            photoPath = (String) environmentContext.lookup("photoPath");
        } catch (Exception ex) {
            throw ex;
        }
    }

    public BaseDAO() throws Exception {
        try {
            initConfig();
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(connectionURL, user, pass);
        } catch (Exception ex) {
            throw ex;
        }
    }

//    //Close connection
//    public void clossConn() throws Exception {
//        this.conn.close();
//    }

    //Return connection to database
    public Connection getConnection() {
        return this.conn;
    }

    //Return the directory of the image folder 
    public String getPhotoPath() {
        return this.photoPath;
    }

}
