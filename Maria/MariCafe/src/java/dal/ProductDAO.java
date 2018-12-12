package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

public class ProductDAO {

    BaseDAO bd;
    CloseDAO closeD;
    public ProductDAO() throws Exception {
        try {
            //Initialize new BaseDAO instance to connect to database
            bd = new BaseDAO();
            closeD = new CloseDAO();
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
    }

    //Get one product by ID
    public Product getByID(int id) throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            //Create connection to database
            conn = bd.getConnection();
            String query = "select [id]"
                    + ",[title]"
                    + ",[description]"
                    + ",[day_created]"
                    + ",[photo_name]"
                    + ",[price]"
                    + ",[short_description]"
                    + " from [Product]"
                    + " where id = ? ";
            statement = conn.prepareStatement(query);
            statement.setInt(1, id);
            rs = statement.executeQuery();
            if (rs.next()) {
                String title = rs.getString("title");
                String description = rs.getString("description");
                Date date = rs.getDate("day_created");
                String photoName = bd.getPhotoPath() + rs.getString("photo_name");
                String price = rs.getString("price");
                String shortDescription = rs.getString("short_description");
                Product p = new Product(id, title, description, date, photoName, price, shortDescription);
                return p;
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    public int getNumberOfProduct() throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            //Create connection to database
            conn = bd.getConnection();
            //Set up connection
            String query = "SELECT COUNT(*)"
                    + "FROM [Product]";
            statement = conn.prepareStatement(query);
            //Get data taken from database
            rs = statement.executeQuery();
            if (rs.next()) {
                int total_number = Integer.parseInt(rs.getString(""));
                return total_number;
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    public ArrayList<Product> getList(int startIndex, int endIndex) throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        ArrayList<Product> list = new ArrayList<>();
        try {
            //Create connection to database
            conn = bd.getConnection();

            String query = "select [id],[title],[description],[day_created],[photo_name],[price],[short_description]\n"
                    + " from (Select ROW_NUMBER() over (order by day_created asc) as"
                    + " row_num,id, title,description,day_created,photo_name,price,short_description\n"
                    + " From Product) as x\n"
                    + " where x.row_num BETWEEN ? AND ?";
            statement = conn.prepareStatement(query);
            statement.setInt(1, startIndex);
            statement.setInt(2, endIndex);
            rs = statement.executeQuery();
            //Take all results and assigns to the ArrayList
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("id"));
                String title = rs.getString("title");
                String description = rs.getString("description");
                Date date = rs.getDate("day_created");
                String photoName = bd.getPhotoPath() + rs.getString("photo_name");
                String price = rs.getString("price");
                String shortDescription = rs.getString("short_description");

                Product p = new Product(id, title, description, date, photoName, price, shortDescription);
                list.add(p);
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    public ArrayList<Product> getTwoMostUpdated() throws Exception {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        ArrayList<Product> list = new ArrayList<>();
        try {
            //Create connection to database
            conn = bd.getConnection();

            //Set up connection
            String query = "SELECT TOP 2[id]"
                    + ",[title]"
                    + ",[description]"
                    + ",[day_created]"
                    + ",[photo_name]"
                    + ",[price]"
                    + ",[short_description]"
                    + " FROM [Product]"
                    + " ORDER BY [day_created] DESC";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            //Store results into one ArrayList
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("id"));
                String title = rs.getString("title");
                String description = rs.getString("description");
                Date date = rs.getDate("day_created");
                String photoName = bd.getPhotoPath() + rs.getString("photo_name");
                String price = rs.getString("price");
                String shortDescription = rs.getString("short_description");

                Product p = new Product(id, title, description, date, photoName, price, shortDescription);
                list.add(p);
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
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
