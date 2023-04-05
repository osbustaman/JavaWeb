package Controllers;
import connection.Conexion;
import connection.ConexionMySQL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class ColaboradorDao {
    
    public boolean loginUsuario(String rut, String pass) throws SQLException, ClassNotFoundException{
        
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();
        
        if (_conexion != null) {
            System.out.println("La conexión se realizó con éxito!!!!!!");
        } else {
            System.out.println("La conexión falló");
        }
        
        return false;
    }
}

// 19369586-8
