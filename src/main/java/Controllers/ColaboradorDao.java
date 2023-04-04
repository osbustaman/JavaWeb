package Controllers;
import connection.Conexion;
import java.sql.Connection;
import java.sql.SQLException;

public class ColaboradorDao {
    
    Conexion con;
    
    public void loginUsuario() throws SQLException{
        con = new Conexion();
        Connection _con = con.conector();
        
        String sqlSelect = "";
    }
}
