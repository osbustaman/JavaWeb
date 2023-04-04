
import Controllers.TestBD;
import java.sql.SQLException;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author osbustaman
 */
public class Main {
    public static void main(String[] args) throws SQLException{
        TestBD cc = new TestBD();
        cc.testConexion();
    }
}
