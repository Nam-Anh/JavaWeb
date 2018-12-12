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
import model.Sushi;

/**
 *
 * @author anhlhnse05444
 */
public class SushiDAO {

    BaseDAO bd;
    CloseDAO closeD;

    public SushiDAO() throws Exception {
        try {
            //Initialize new BaseDAO instance to connect to database
            bd = new BaseDAO();
            closeD = new CloseDAO();
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(SushiDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
    }

    //Get one product by ID
    public Sushi getByID(int id) throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            //Create connection to database
            conn = bd.getConnection();
            String query = "select [id]"
                    + ",[name]"
                    + ",[description]"
                    + ",[photo]"
                    + ",[day_created]"
                    + ",[short_description]"
                    + " from [sushiMeal]"
                    + " where id = ? ";
            statement = conn.prepareStatement(query);
            statement.setInt(1, id);
            rs = statement.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String description = rs.getString("description");
                String photoName = bd.getPhotoPath() + rs.getString("photo");
                Date date = rs.getDate("day_created");
                String shortDescription = rs.getString("short_description");
                Sushi s = new Sushi(id, name, description, date, photoName, shortDescription);
                return s;
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(SushiDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    /*Get the number of sushi in database*/
    public int getNumberOfSushi() throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            //Create connection to database
            conn = bd.getConnection();
            //Set up connection
            String query = "SELECT COUNT(*)"
                    + "FROM [sushiMeal]";
            statement = conn.prepareStatement(query);
            //Get data taken from database
            rs = statement.executeQuery();
            if (rs.next()) {
                int total_number = Integer.parseInt(rs.getString(""));
                return total_number;
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(SushiDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    /*Get list of sushi*/
    public ArrayList<Sushi> getList(int startIndex, int endIndex) throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        ArrayList<Sushi> list = new ArrayList<>();
        try {
            //Create connection to database
            conn = bd.getConnection();

            String query = "select id, name, description, day_created, photo, short_description\n"
                    + "from (select ROW_NUMBER() over (order by day_created desc) as\n"
                    + "		row_num, id, name, description, day_created, photo, short_description \n"
                    + "	  from sushiMeal) as x\n"
                    + "where x.row_num between ? and ?";
            statement = conn.prepareStatement(query);
            statement.setInt(1, startIndex);
            statement.setInt(2, endIndex);
            rs = statement.executeQuery();
            //Take all results and assigns to the ArrayList
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("id"));
                String name = rs.getString("name");
                String description = rs.getString("description");
                Date date = rs.getDate("day_created");
                String photoName = bd.getPhotoPath() + rs.getString("photo");
                String shortDescription = rs.getString("short_description");

                Sushi su = new Sushi(id, name, description, date, photoName, shortDescription);
                list.add(su);
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(SushiDAO.class.getName()).log(Level.SEVERE, null, ex);
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
