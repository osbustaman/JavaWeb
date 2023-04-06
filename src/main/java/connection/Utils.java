package connection;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.concurrent.ThreadLocalRandom;
import javax.crypto.spec.SecretKeySpec;
import connection.ConexionMySQL;

public class Utils {
    ConexionMySQL con;
    
    public void testConexion() throws SQLException, ClassNotFoundException{
        con = new ConexionMySQL();
        Connection _con = con.conector();
        
        if (_con != null) {
            System.out.println("La conexión se realizó con éxito!!!!!!");
        } else {
            System.out.println("La conexión falló");
        }
    }
    
    public String generaToken(){
        String banco = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        String key = "";
        for (int x = 0; x < 150; x++) {
                int indiceAleatorio = ThreadLocalRandom.current().nextInt(0, (banco.length() - 1) + 1);
                char caracterAleatorio = banco.charAt(indiceAleatorio);
                key += caracterAleatorio;
        }
        return key;
    }
}
