package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Sushi;
import model.SushiMenu;

public class MenuDAO {

    BaseDAO bd;
    CloseDAO closeD;

    public MenuDAO() throws Exception {
        try {
            //Initialize new BaseDAO instance to connect to database
            bd = new BaseDAO();
            closeD = new CloseDAO();
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(MenuDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
    }

    //Get one menu by ID
    public SushiMenu getByID(int id) throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            //Create connection to database
            conn = bd.getConnection();
            String query = "select id, name, description, shortDescription, price, day_created\n"
                    + "from menu\n"
                    + "where id = ?;";
            statement = conn.prepareStatement(query);
            statement.setInt(1, id);
            rs = statement.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String description = rs.getString("description");
                String shortDes = rs.getString("shortDescription");
                String price =  "€" + rs.getString("price");
                Date date = rs.getDate("day_created");
                SushiMenu menu = new SushiMenu(id, name, description, shortDes, price, date);
                return menu;
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(MenuDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    /*Get the number of menu in database*/
    public int getNumberOfMenu() throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            //Create connection to database
            conn = bd.getConnection();
            //Set up connection
            String query = "SELECT COUNT(*)"
                    + "FROM [menu]";
            statement = conn.prepareStatement(query);
            //Get data taken from database
            rs = statement.executeQuery();
            if (rs.next()) {
                int total_number = Integer.parseInt(rs.getString(""));
                return total_number;
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(MenuDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    /*Get list of menu*/
    public ArrayList<SushiMenu> getList(int startIndex, int endIndex) throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        ArrayList<SushiMenu> list = new ArrayList<>();
        try {
            //Create connection to database
            conn = bd.getConnection();

            String query = "select id, name, description, shortDescription, price, day_created\n"
                    + "from \n"
                    + "(select ROW_NUMBER() over (order by day_created asc) as \n"
                    + "row_num, id, name, description, shortDescription, price, day_created\n"
                    + "from menu) as x\n"
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
                String shortDes = rs.getString("shortDescription");
                String price = "€" + rs.getString("price");
                Date date = rs.getDate("day_created");

                SushiMenu menu = new SushiMenu(id, name, description, shortDes, price, date);
                list.add(menu);
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(MenuDAO.class.getName()).log(Level.SEVERE, null, ex);
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
