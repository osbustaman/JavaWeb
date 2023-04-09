package Controllers;

import Models.Cargo;
import Models.Colaborador;
import Models.Comuna;
import Models.CorreoColaborador;
import Models.ExpedienteUsuario;
import Models.Pais;
import Models.Region;
import Models.TelefonoColaborador;
import connection.Utils;
import connection.ConexionMySQL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

public class TelefonoColaboradorDao {
    
    public int insertarTelefono(TelefonoColaborador tc) throws SQLException, ClassNotFoundException{

        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();

        // Crear la sentencia SQL para insertar un huerto
        String sql = "INSERT INTO gp_telefono_colaborador (colaborador_id, tipo_telefono, numero_telefono)"
                   + " VALUES (?, ?, ?);";

        // Declarar una variable para almacenar el ID generado
        int telefonoId;

        // Crear un PreparedStatement y especificar que se deben devolver las claves generadas
        try (PreparedStatement ps = _conexion.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            // Establecer los valores de los parámetros en la sentencia SQL
            ps.setInt(1, tc.getColaborador().getId());
            ps.setString(2, tc.getTipoTelefono());
            ps.setString(3, tc.getNumeroTelefono());

            
            // Ejecutar la sentencia SQL
            ps.executeUpdate();

            try ( // Obtener el ID generado
                    ResultSet result = ps.getGeneratedKeys()) {
                telefonoId = -1;
                if (result.next()) {
                    telefonoId = result.getInt(1);
                }
                // Cerrar el ResultSet
            }
        }

        // Devolver el ID insertado
        return telefonoId;
    }
    
    public List<TelefonoColaborador> listarTelefonoColaborador(int id) throws SQLException, ClassNotFoundException{
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();
        
        // Crear la sentencia SQL para insertar un huerto
        String sqlSelect = "SELECT id, colaborador_id, tipo_telefono, numero_telefono FROM gp_telefono_colaborador WHERE colaborador_id = ?;";
       
        try (PreparedStatement psSelect = _conexion.prepareStatement(sqlSelect)) {
            
            psSelect.setInt(1, id);

            // Ejecutar la sentencia SQL
            ResultSet rsSelect = psSelect.executeQuery();

            // Recorrer los resultados y mostrarlos por consola
            List<TelefonoColaborador> lista = new ArrayList<>();
            while (rsSelect.next()) {
                TelefonoColaborador tc = new TelefonoColaborador();
                tc.setId(rsSelect.getInt("id"));
                
                Colaborador c = new Colaborador();
                c.setId(rsSelect.getInt("colaborador_id "));
                tc.setColaborador(c);
                
                tc.setTipoTelefono(rsSelect.getString("tipo_telefono"));
                tc.setNumeroTelefono(rsSelect.getString("numero_telefono"));
                lista.add(tc);
            }
            return lista;
        }
    }
    
    
}
