/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;

import connection.Conexion;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author osbustaman
 */
public class TestBD {
    Conexion con;
    
    public void testConexion() throws SQLException{
        con = new Conexion();
        Connection _con = con.conector();
        
        if (_con != null) {
            System.out.println("La conexión se realizó con éxito!!!!!!");
        } else {
            System.out.println("La conexión falló");
        }
    }
}
