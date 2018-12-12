/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.HomeInfo;

/**
 *
 * @author anhlhnse05444
 */
public class HomeInfoDAO {

    BaseDAO bd;
    CloseDAO closeD;

    public HomeInfoDAO() throws Exception {
        try {
            //Initialize new BaseDAO instance to connect to database with some config
            bd = new BaseDAO();
            //Initialize close connection instance
            closeD = new CloseDAO();
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(InfoDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
    }

    //Get one HomeInfo object in the database by id number
    public HomeInfo getByID(int id) throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            //Get connection to database    
            conn = bd.getConnection();
            String query = "select id,"
                    + " bannerPhoto,"
                    + " introImage,"
                    + " introTitle,"
                    + " introDes,"
                    + " aboutTitle,"
                    + " aboutDes,"
                    + " aboutImage,"
                    + " authorName,"
                    + " authorImage\n"
                    + "from HomePage\n"
                    + "where id = ?";
            //Set up connection
            statement = conn.prepareStatement(query);
            statement.setInt(1, id);
            //Store result in one Info instace
            rs = statement.executeQuery();
            if (rs.next()) {
                String bannerPhoto = bd.getPhotoPath() + rs.getString("bannerPhoto");
                String introImage =  bd.getPhotoPath() + rs.getString("introImage");
                String introTitle = rs.getString("introTitle");
                String introDes = rs.getString("introDes");
                String aboutTitle = rs.getString("aboutTitle");
                String aboutDes = rs.getString("aboutDes");
                String aboutImage =  bd.getPhotoPath() + rs.getString("aboutImage");
                String authorName = rs.getString("authorName");
                String authorImage =  bd.getPhotoPath() + rs.getString("authorImage");
                HomeInfo home = new HomeInfo(id, bannerPhoto, introImage, introTitle, introDes, aboutImage, aboutTitle, aboutDes, authorImage, authorName);
                return home;
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(InfoDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } finally {
            //Close result set
            closeD.closeResultSet(rs);
            //Close prepareStatement
            closeD.closePrepareStatement(statement);
            //Close connection
            closeD.closeConnection(conn);
        }

        return null;
    }
}
