/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Service;

/**
 *
 * @author anhlhnse05444
 */
public class ServiceDAO {

    BaseDAO bd;
    CloseDAO closeD;

    public ServiceDAO() throws Exception {
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

    //Get one Service object in the database by id number
    public Service getByID(int id) throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            //Get connection to database    
            conn = bd.getConnection();
            String query = "select id,name,description,schedule\n"
                    + "from Services\n"
                    + "where id = ?";
            //Set up connection
            statement = conn.prepareStatement(query);
            statement.setInt(1, id);
            //Store result in one Service instace
            rs = statement.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String des = rs.getString("description");
                String schedule;
                schedule = new SimpleDateFormat("dd-MMMM-yyyy", Locale.US).format(rs.getDate("schedule"));
                
                Service service = new Service(id, name, des, schedule);
                return service;
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    /*Get the number of service in database*/
    public int getNumberOfService() throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            //Create connection to database
            conn = bd.getConnection();
            //Set up connection
            String query = "SELECT COUNT(*)"
                    + "FROM [Services]";
            statement = conn.prepareStatement(query);
            //Get data taken from database
            rs = statement.executeQuery();
            if (rs.next()) {
                int total_number = Integer.parseInt(rs.getString(""));
                return total_number;
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
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
    public ArrayList<Service> getList(int startIndex, int endIndex) throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        ArrayList<Service> list = new ArrayList<>();
        try {
            //Create connection to database
            conn = bd.getConnection();

            String query = "select id, name, description, schedule\n"
                    + "from \n"
                    + "(select ROW_NUMBER() over (order by schedule asc) as row_num, id, name, description, schedule\n"
                    + "from Services)as x\n"
                    + "where x.row_num between ? and ?";
            statement = conn.prepareStatement(query);
            statement.setInt(1, startIndex);
            statement.setInt(2, endIndex);
            rs = statement.executeQuery();
            //Take all results and assigns to the ArrayList
            while (rs.next()) {
                String name = rs.getString("name");
                String description = rs.getString("description");
                DateFormat dFormat = new SimpleDateFormat("yyyy-MMMM-dd", Locale.US);
                        
                String schedule;
                schedule = new SimpleDateFormat("dd-MMMM-yyyy", Locale.US).format(rs.getDate("schedule"));
                
                Service service = new Service(endIndex, name, description, schedule);
                list.add(service);
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
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
