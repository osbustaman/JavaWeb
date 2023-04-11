package Controllers;

import Models.Colaborador;
import Models.CorreoColaborador;
import connection.ConexionMySQL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

public class CorreoColaboradorDao {
    
    PreparedStatement sentencia = null;
    
    public int insertarCorreo(CorreoColaborador cc) throws SQLException, ClassNotFoundException{

        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();

        // Crear la sentencia SQL para insertar un huerto
        String sql = "INSERT INTO gp_correo_colaborador (colaborador_id, tipo_correo, correo_colaborador)"
                   + " VALUES (?, ?, ?);";

        // Declarar una variable para almacenar el ID generado
        int correoId;

        // Crear un PreparedStatement y especificar que se deben devolver las claves generadas
        try (PreparedStatement ps = _conexion.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            // Establecer los valores de los parámetros en la sentencia SQL
            ps.setInt(1, cc.getColaborador().getId());
            ps.setString(2, cc.getTipoCorreo());
            ps.setString(3, cc.getCorreo());

            
            // Ejecutar la sentencia SQL
            ps.executeUpdate();

            try ( // Obtener el ID generado
                    ResultSet result = ps.getGeneratedKeys()) {
                correoId = -1;
                if (result.next()) {
                    correoId = result.getInt(1);
                }
                // Cerrar el ResultSet
            }
        }

        // Devolver el ID insertado
        return correoId;
    }
    
    public List<CorreoColaborador> listarCorreoColaborador(int id) throws SQLException, ClassNotFoundException{
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();
        
        // Crear la sentencia SQL para insertar un huerto
        String sqlSelect = "SELECT id, colaborador_id, tipo_correo, correo_colaborador FROM gp_correo_colaborador WHERE colaborador_id = ?;";
       
        try (PreparedStatement psSelect = _conexion.prepareStatement(sqlSelect)) {
            
            psSelect.setInt(1, id);

            // Ejecutar la sentencia SQL
            ResultSet rsSelect = psSelect.executeQuery();

            // Recorrer los resultados y mostrarlos por consola
            List<CorreoColaborador> lista = new ArrayList<>();
            while (rsSelect.next()) {
                CorreoColaborador cc = new CorreoColaborador();
                cc.setId(rsSelect.getInt("id"));
                
                Colaborador c = new Colaborador();
                c.setId(rsSelect.getInt("colaborador_id"));
                cc.setColaborador(c);
                
                cc.setTipoCorreo(rsSelect.getString("tipo_correo"));
                cc.setCorreo(rsSelect.getString("correo_colaborador"));
                lista.add(cc);
            }
            return lista;
        }
    }
    
        public void deleteCorreo(int id) throws SQLException, ClassNotFoundException{
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
            ConexionMySQL con = new ConexionMySQL();

            // Obtener la conexión a la base de datos
            Connection _conexion = con.conector();
            String sqlDeleteExpedienteColaborador = "DELETE FROM gp_correo_colaborador WHERE id = ?;";
            sentencia = _conexion.prepareStatement(sqlDeleteExpedienteColaborador);
            sentencia.setInt(1, id);
            sentencia.executeUpdate();
        }
}
