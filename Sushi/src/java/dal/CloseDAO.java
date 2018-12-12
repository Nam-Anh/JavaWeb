package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CloseDAO {

    public CloseDAO() {
    }
    /*Close connection after being used
    Only close when connection is not null and is not closed */
    public void closeConnection(Connection conn){
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(CloseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    /*Close preparedStatement after being used
    Only close when preparedStatement is not null and is not closed */
    public void closePrepareStatement(PreparedStatement statement){
        try {
            if (statement != null && !statement.isClosed()) {
                statement.close();
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(CloseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /*Close ResultSet after being used
    Only close when ResultSet is not null and is not closed */
    public void closeResultSet(ResultSet rs){
        try {
            if (rs != null && !rs.isClosed()) {
                rs.close();
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(CloseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
