/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import dal.BaseDAO;
import dal.CloseDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.SushiInfo;

/**
 *
 * @author anhlhnse05444
 */
public class InfoDAO {

    BaseDAO bd;
    CloseDAO closeD;

    public InfoDAO() throws Exception {
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

    //Get one Info object in the database by id number
    public SushiInfo getByID(int id) throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            //Get connection to database    
            conn = bd.getConnection();
            String query = "select id, address, tel, email, photoPath, schedule\n"
                    + "from sushiInfo\n"
                    + "where id = ?;";
            //Set up connection
            statement = conn.prepareStatement(query);
            statement.setInt(1, id);
            //Store result in one Info instace
            rs = statement.executeQuery();
            if (rs.next()) {
                String address = rs.getString("address");
                String tel = rs.getString("tel");
                String mail = rs.getString("email");
                String photoPath = bd.getPhotoPath() + rs.getString("photoPath");
                String schedule = rs.getString("schedule");
                SushiInfo info = new SushiInfo(id, address, tel, mail, photoPath, schedule);
                return info;
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
