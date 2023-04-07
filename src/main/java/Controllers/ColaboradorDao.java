package Controllers;

import Models.Cargo;
import Models.Colaborador;
import Models.Comuna;
import Models.Pais;
import Models.Region;
import connection.Utils;
import connection.ConexionMySQL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

public class ColaboradorDao {
    
    PreparedStatement sentencia = null;
    Utils cc = new Utils();
    ResultSet rs = null;
    
    /**
    * Función que permite realizar el login de un colaborador en la aplicación.
    * 
    * @param rut El rut del colaborador.
    * @param pass La contraseña del colaborador.
    * 
    * @return Un objeto de tipo Colaborador con los datos del colaborador que ha iniciado sesión.
    * 
    * @throws SQLException Si ocurre algún error al realizar la consulta en la base de datos.
    * @throws ClassNotFoundException Si no se encuentra la clase del driver JDBC para conectarse a la base de datos.
    */
    public Colaborador loginUsuario(String rut, String pass) throws SQLException, ClassNotFoundException {
        
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();
        
        // Definir la consulta SQL para buscar el colaborador por su rut y contraseña
        String sqlSelect = "SELECT "
                + "id, "
                + "rut, "
                + "nombres, "
                + "apellidos,"
                + "token_sesion "
                + "FROM "
                + "gp_colaborador "
                + "WHERE "
                + "rut = ? AND "
                + "password = MD5(?)";
        
        // Preparar la sentencia SQL para su ejecución
        sentencia = _conexion.prepareStatement(sqlSelect);
        sentencia.setString(1, rut);
        sentencia.setString(2, pass);
        
        // Ejecutar la consulta SQL y obtener el resultado
        rs = sentencia.executeQuery();
        
        // Crear un objeto Colaborador para almacenar los datos del colaborador que ha iniciado sesión
        Colaborador colaborador = new Colaborador();
        
        // Si se encuentra un registro en la consulta, llenar los datos del colaborador y actualizar su token de sesión
        if (rs.next()) {
            colaborador.setId(rs.getInt("id"));
            colaborador.setRut(rs.getString("rut"));
            colaborador.setNombres(rs.getString("nombres"));
            colaborador.setApellidos(rs.getString("apellidos"));
            //colaborador.setTokenSesion(rs.getString("token_sesion"));
            
            String tokenUsuario = updateTokenColaborador(rs.getInt("id"));
            
            colaborador.setTokenSesion(tokenUsuario);
        } else {
            // Si no se encuentra ningún registro, lanzar una excepción indicando que no se encontró el colaborador
            throw new SQLException("No se encontro colaborador");
        }
        
        // Devolver el objeto Colaborador con los datos del colaborador que ha iniciado sesión
        return colaborador;
    }
    
    public boolean isLogin(String token, int id) throws ClassNotFoundException, SQLException{
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();
        
        String sqlSelect = "SELECT * FROM gp_colaborador WHERE id = ? AND token_sesion = ?;";
        // Preparar la sentencia SQL para su ejecución
        sentencia = _conexion.prepareStatement(sqlSelect);
        sentencia.setInt(1, id);
        sentencia.setString(2, token);
        
        // Ejecutar la consulta SQL y obtener el resultado
        rs = sentencia.executeQuery();
        return rs.next();
    }
    
    public String updateTokenColaborador(int id) throws SQLException, ClassNotFoundException{
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();
        
        String token = cc.generaToken(); // Generar el token aleatorio
        
        String sqlUpdate = "UPDATE gp_colaborador SET token_sesion = ? WHERE id = ?;";
        sentencia = _conexion.prepareStatement(sqlUpdate);
        sentencia.setString(1, token);
        sentencia.setInt(2, id);
        sentencia.executeUpdate();
        return token;
    }
    
    public void clearTokenColaborador(int id) throws SQLException, ClassNotFoundException{
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();
        String sqlUpdate = "UPDATE gp_colaborador SET token_sesion = ? WHERE id = ?;";
        sentencia = _conexion.prepareStatement(sqlUpdate);
        sentencia.setString(1, "");
        sentencia.setInt(2, id);
        sentencia.executeUpdate();
    }
    
    public List<Pais> listarPaises() throws SQLException, ClassNotFoundException{
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();
        
        // Crear la sentencia SQL para insertar un huerto
        String sqlSelect = "SELECT * FROM gp_pais;";
       
        try (PreparedStatement psSelect = _conexion.prepareStatement(sqlSelect)) {

            // Ejecutar la sentencia SQL
            ResultSet rsSelect = psSelect.executeQuery();

            // Recorrer los resultados y mostrarlos por consola
            List<Pais> lista = new ArrayList<>();
            while (rsSelect.next()) {
                Pais pais = new Pais(rsSelect.getInt("id"), rsSelect.getString("nombre_pais"));
                lista.add(pais);
            }
            
            return lista;
        }
    }
    
    public List<Region> listarRegiones() throws SQLException, ClassNotFoundException{
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();
        
        // Crear la sentencia SQL para insertar un huerto
        String sqlSelect = "SELECT * FROM gp_region;";
       
        try (PreparedStatement psSelect = _conexion.prepareStatement(sqlSelect)) {

            // Ejecutar la sentencia SQL
            ResultSet rsSelect = psSelect.executeQuery();

            // Recorrer los resultados y mostrarlos por consola
            List<Region> lista = new ArrayList<>();
            while (rsSelect.next()) {
                Region region;
                region = new Region(rsSelect.getInt("id"), rsSelect.getString("nombre_region"));
                lista.add(region);
            }
            return lista;
        }
    }
    
    public List<Comuna> listarComunas() throws SQLException, ClassNotFoundException{
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();
        
        // Crear la sentencia SQL para insertar un huerto
        String sqlSelect = "SELECT * FROM gp_comuna;";
       
        try (PreparedStatement psSelect = _conexion.prepareStatement(sqlSelect)) {

            // Ejecutar la sentencia SQL
            ResultSet rsSelect = psSelect.executeQuery();

            // Recorrer los resultados y mostrarlos por consola
            List<Comuna> lista = new ArrayList<>();
            while (rsSelect.next()) {
                Comuna comuna;
                comuna = new Comuna(rsSelect.getInt("id"), rsSelect.getString("nombre_comuna"));
                lista.add(comuna);
            }
            return lista;
        }
    }
    
    public List<Cargo> listarCargos() throws SQLException, ClassNotFoundException{
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();
        
        // Crear la sentencia SQL para insertar un huerto
        String sqlSelect = "SELECT * FROM gp_cargo;";
       
        try (PreparedStatement psSelect = _conexion.prepareStatement(sqlSelect)) {

            // Ejecutar la sentencia SQL
            ResultSet rsSelect = psSelect.executeQuery();

            // Recorrer los resultados y mostrarlos por consola
            List<Cargo> lista = new ArrayList<>();
            while (rsSelect.next()) {
                Cargo cargo;
                cargo = new Cargo(rsSelect.getInt("id"), rsSelect.getString("nombre_cargo"));
                lista.add(cargo);
            }
            return lista;
        }
    }
    
    
    public int insertarColaborador(Colaborador colaborador) throws SQLException, ClassNotFoundException{

        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();

        // Crear la sentencia SQL para insertar un huerto
        String sql = "INSERT INTO gp_colaborador (rut, nombres, apellidos, direccion, pais_id, region_id, comuna_id, estado_civil, sexo, empresa_id, cargo_id, fecha_ingreso, password, perfil_id)"
                   + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, MD5(?), ?);";

        // Declarar una variable para almacenar el ID generado
        int colaboradorId;

        // Crear un PreparedStatement y especificar que se deben devolver las claves generadas
        try (PreparedStatement ps = _conexion.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            // Establecer los valores de los parámetros en la sentencia SQL
            ps.setString(1, colaborador.getRut());
            ps.setString(2, colaborador.getNombres());
            ps.setString(3, colaborador.getApellidos());
            ps.setString(4, colaborador.getDireccion());
            ps.setInt(5, colaborador.getPais().getId());
            ps.setInt(6, colaborador.getRegion().getId());
            ps.setInt(7, colaborador.getComuna().getId());
            ps.setString(8, colaborador.getEstadoCivil());
            ps.setString(9, colaborador.getSexo());
            ps.setInt(10, colaborador.getEmpresa().getId());
            ps.setInt(11, colaborador.getCargo().getId());
            ps.setString(12, colaborador.getFechaIngreso());
            ps.setString(13, colaborador.getPassword());
            ps.setInt(14, colaborador.getPerfil());
            
            // Ejecutar la sentencia SQL
            ps.executeUpdate();

            try ( // Obtener el ID generado
                    ResultSet result = ps.getGeneratedKeys()) {
                colaboradorId = -1;
                if (result.next()) {
                    colaboradorId = result.getInt(1);
                }
                // Cerrar el ResultSet
            }
        }

        // Devolver el ID del huerto insertado
        return colaboradorId;

    }

}