/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;

import java.sql.Connection;
import java.sql.SQLException;
import poo_2_semana_5.ConexionMySQL;

public class TestBD {
    ConexionMySQL con;
    
    public void testConexion() throws SQLException{
        con = new ConexionMySQL();
        Connection _con = con.conector();
        
        if (_con != null) {
            System.out.println("La conexión se realizó con éxito!!!!!!");
        } else {
            System.out.println("La conexión falló");
        }
    }
}
