/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Info;
import model.Prayer;

/**
 *
 * @author anhlhnse05444
 */
public class PrayerDAO {

    BaseDAO bd;
    CloseDAO closeD;

    public PrayerDAO() throws Exception {
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

    //Get one Prayer object in the database by id number
    public Prayer getByID(int id) throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            //Get connection to database    
            conn = bd.getConnection();
            String query = "select id, prayerTitle, prayerDes, prayerPhoto \n"
                    + "from Prayers\n"
                    + "where id = ?";
            //Set up connection
            statement = conn.prepareStatement(query);
            statement.setInt(1, id);
            //Store result in one Info instace
            rs = statement.executeQuery();
            if (rs.next()) {
                String prayerTitle = rs.getString("prayerTitle");
                String prayerDes = rs.getString("prayerDes");
                String prayerPhoto = bd.getPhotoPath() + rs.getString("prayerPhoto");

                Prayer prayer = new Prayer(id, prayerTitle, prayerDes, prayerPhoto);
                return prayer;
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(PrayerDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    /*Get the number of prayer in database*/
    public int getNumberOfPrayer() throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            //Create connection to database
            conn = bd.getConnection();
            //Set up connection
            String query = "SELECT COUNT(*)"
                    + "FROM [Prayers]";
            statement = conn.prepareStatement(query);
            //Get data taken from database
            rs = statement.executeQuery();
            if (rs.next()) {
                int total_number = Integer.parseInt(rs.getString(""));
                return total_number;
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(PrayerDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } finally {
            //Close result set
            closeD.closeResultSet(rs);
            //Close prepareStatement
            closeD.closePrepareStatement(statement);
            //Close connection
            closeD.closeConnection(conn);
        }

        return -1;
    }

    /*Get list of prayers*/
    public ArrayList<Prayer> getList(int startIndex, int endIndex) throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        ArrayList<Prayer> list = new ArrayList<>();
        try {
            //Create connection to database
            conn = bd.getConnection();

            String query = "select id, prayerTitle, prayerDes, prayerPhoto \n"
                    + "from \n"
                    + "(select ROW_NUMBER() over (order by id asc) as row_num, id, prayerTitle, prayerDes, prayerPhoto \n"
                    + "from Prayers) as x\n"
                    + "where x.row_num between ? and ?";
            statement = conn.prepareStatement(query);
            statement.setInt(1, startIndex);
            statement.setInt(2, endIndex);
            rs = statement.executeQuery();
            //Take all results and assigns to the ArrayList
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("id"));
                String prayerTitle = rs.getString("prayerTitle");
                String prayerDes = rs.getString("prayerDes");
                String prayerPhoto = bd.getPhotoPath() + rs.getString("prayerPhoto");
                
                Prayer prayer = new Prayer(id, prayerTitle, prayerDes, prayerPhoto);
                list.add(prayer);
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(PrayerDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } finally {
            //Close result set
            closeD.closeResultSet(rs);
            //Close prepareStatement
            closeD.closePrepareStatement(statement);
            //Close connection
            closeD.closeConnection(conn);
        }

        return list;
    }
}
