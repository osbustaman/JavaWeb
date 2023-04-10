package Controllers;

import Models.Cargo;
import Models.Colaborador;
import Models.Comuna;
import Models.ExpedienteUsuario;
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
                + "token_sesion, "
                + "path_colaborador, "
                + "perfil_id "
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
            colaborador.setPathColaborador(rs.getString("path_colaborador"));
            colaborador.setPerfil(rs.getInt("perfil_id"));
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
        String sql = "INSERT INTO gp_colaborador (rut, nombres, apellidos, direccion, pais_id, region_id, comuna_id, estado_civil, sexo, empresa_id, cargo_id, fecha_ingreso, password, perfil_id, path_colaborador)"
                   + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, MD5(?), ?, ?);";

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
            ps.setString(15, colaborador.getPathColaborador());
            
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
    
    public Colaborador getColaborador(int id) throws SQLException, ClassNotFoundException{
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();
        
        // Crear la sentencia SQL para insertar un huerto
        String sqlSelect = "SELECT id, rut, nombres, apellidos, direccion, pais_id, region_id, comuna_id, estado_civil, sexo, cargo_id, fecha_ingreso, password, perfil_id FROM gp_colaborador WHERE id = ?;";
       
        try (PreparedStatement psSelect = _conexion.prepareStatement(sqlSelect)) {
            
            psSelect.setInt(1, id);

            // Ejecutar la sentencia SQL
            ResultSet rsSelect = psSelect.executeQuery();

            // Recorrer los resultados y mostrarlos por consola
            Colaborador colaborador = new Colaborador();
            while (rsSelect.next()) {
                colaborador.setId(rsSelect.getInt("id"));
                colaborador.setRut(rsSelect.getString("rut"));
                colaborador.setNombres(rsSelect.getString("nombres"));
                colaborador.setApellidos(rsSelect.getString("apellidos"));
                colaborador.setDireccion(rsSelect.getString("direccion"));
                
                Pais pais = new Pais();
                pais.setId(rsSelect.getInt("pais_id"));
                colaborador.setPais(pais);
                
                Region region = new Region();
                region.setId(rsSelect.getInt("region_id"));
                colaborador.setRegion(region);
                
                Comuna comuna = new Comuna();
                comuna.setId(rsSelect.getInt("comuna_id"));
                colaborador.setComuna(comuna);
                
                colaborador.setEstadoCivil(rsSelect.getString("estado_civil"));
                colaborador.setSexo(rsSelect.getString("sexo"));
                
                Cargo cargo = new Cargo();
                cargo.setId(rsSelect.getInt("cargo_id"));
                colaborador.setCargo(cargo);
                
                colaborador.setFechaIngreso(rsSelect.getString("fecha_ingreso"));
                colaborador.setPassword(rsSelect.getString("password"));
                colaborador.setPerfil(rsSelect.getInt("perfil_id"));

            }
            return colaborador;
        }
    }
    
    public int updateColaborador(int id, Colaborador colaborador) throws SQLException, ClassNotFoundException{
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();
        String sqlUpdate = "UPDATE gp_colaborador SET nombres = ?, apellidos = ?, direccion = ?, pais_id = ?, region_id = ?, comuna_id = ?, estado_civil = ?, sexo = ?, cargo_id = ?, fecha_ingreso = ?, perfil_id = ? WHERE id = ?;";
        sentencia = _conexion.prepareStatement(sqlUpdate);
        sentencia.setString(1, colaborador.getNombres());
        sentencia.setString(2, colaborador.getApellidos());
        sentencia.setString(3, colaborador.getDireccion());
        sentencia.setInt(4, colaborador.getPais().getId());
        sentencia.setInt(5, colaborador.getRegion().getId());
        sentencia.setInt(6, colaborador.getComuna().getId());
        sentencia.setString(7, colaborador.getEstadoCivil());
        sentencia.setString(8, colaborador.getSexo());
        sentencia.setInt(9, colaborador.getCargo().getId());
        sentencia.setString(10, colaborador.getFechaIngreso());
        sentencia.setInt(11, colaborador.getPerfil());
        sentencia.setInt(12, id);
        sentencia.executeUpdate();
        
        return id;
    }
    
    public List<Colaborador> listarColaboradores() throws SQLException, ClassNotFoundException{
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();
        
        // Crear la sentencia SQL para insertar un huerto
        String sqlSelect = "SELECT \n" +
                            "	colaborador.id AS id\n" +
                            "    , colaborador.rut AS rut\n" +
                            "    , colaborador.nombres AS nombres\n" +
                            "    , colaborador.apellidos AS apellidos\n" +
                            "    , colaborador.estado_civil AS estado_civil\n" +
                            "    , colaborador.sexo AS sexo\n" +
                            "    , cargo.id AS cargo_id\n" +
                            "    , cargo.nombre_cargo AS nombre_cargo\n" +
                            "    , colaborador.perfil_id AS perfil_id\n" +
                            "FROM gp_colaborador colaborador\n" +
                            "INNER JOIN gp_cargo cargo ON cargo.id = colaborador.cargo_id;";
       
        try (PreparedStatement psSelect = _conexion.prepareStatement(sqlSelect)) {

            // Ejecutar la sentencia SQL
            ResultSet rsSelect = psSelect.executeQuery();

            // Recorrer los resultados y mostrarlos por consola
            List<Colaborador> listaColaborador = new ArrayList<>();
            while (rsSelect.next()) {
                Colaborador colaborador = new Colaborador();
                colaborador.setId(rsSelect.getInt("id"));
                colaborador.setRut(rsSelect.getString("rut"));
                colaborador.setNombres(rsSelect.getString("nombres"));
                colaborador.setApellidos(rsSelect.getString("apellidos"));
                colaborador.setEstadoCivil(rsSelect.getString("estado_civil"));
                colaborador.setSexo(rsSelect.getString("sexo"));
                
                Cargo cargo = new Cargo(rsSelect.getInt("cargo_id"), rsSelect.getString("nombre_cargo"));
                colaborador.setCargo(cargo);
                
                colaborador.setPerfil(rsSelect.getInt("perfil_id"));

                listaColaborador.add(colaborador);
            }
            return listaColaborador;
        }
    }
    
    public void deletecolaborador(int id) throws SQLException, ClassNotFoundException{
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();
        String sqlDeleteExpedienteColaborador = "DELETE FROM gp_expediente_colaborador WHERE colaborador_id = ?;";
        sentencia = _conexion.prepareStatement(sqlDeleteExpedienteColaborador);
        sentencia.setInt(1, id);
        sentencia.executeUpdate();

        String sqlDeleteColaborador = "DELETE FROM gp_colaborador WHERE id = ?;";
        sentencia = _conexion.prepareStatement(sqlDeleteColaborador);
        sentencia.setInt(1, id);
        sentencia.executeUpdate();
    }
    
    public void updateImagenColaborador(int id, String path) throws SQLException, ClassNotFoundException{
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();
        String sqlUpdate = "UPDATE gp_colaborador SET path_colaborador = ? WHERE id = ?;";
        sentencia = _conexion.prepareStatement(sqlUpdate);
        sentencia.setString(1, path);
        sentencia.setInt(2, id);
        sentencia.executeUpdate();
    }
    
    
    public int insertarDocumento(ExpedienteUsuario eu) throws SQLException, ClassNotFoundException{

        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();

        // Crear la sentencia SQL para insertar un huerto
        String sql = "INSERT INTO gp_expediente_colaborador (colaborador_id, path_archivo, nombre_archivo)"
                   + " VALUES (?, ?, ?);";

        // Declarar una variable para almacenar el ID generado
        int expedienteId;

        // Crear un PreparedStatement y especificar que se deben devolver las claves generadas
        try (PreparedStatement ps = _conexion.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            // Establecer los valores de los parámetros en la sentencia SQL
            ps.setInt(1, eu.getColaborador().getId());
            ps.setString(2, eu.getPath());
            ps.setString(3, eu.getNombreArchivo());

            
            // Ejecutar la sentencia SQL
            ps.executeUpdate();

            try ( // Obtener el ID generado
                    ResultSet result = ps.getGeneratedKeys()) {
                expedienteId = -1;
                if (result.next()) {
                    expedienteId = result.getInt(1);
                }
                // Cerrar el ResultSet
            }
        }

        return expedienteId;
    }
    
    public List<ExpedienteUsuario> listarExpedienteColaborador(int id) throws SQLException, ClassNotFoundException{
        // Crear un objeto ConexionMySQL para conectarnos a la base de datos
        ConexionMySQL con = new ConexionMySQL();

        // Obtener la conexión a la base de datos
        Connection _conexion = con.conector();
        
        // Crear la sentencia SQL para insertar un huerto
        String sqlSelect = "SELECT id, nombre_archivo, path_archivo FROM gp_expediente_colaborador WHERE colaborador_id = ?;";
       
        try (PreparedStatement psSelect = _conexion.prepareStatement(sqlSelect)) {
            
            psSelect.setInt(1, id);

            // Ejecutar la sentencia SQL
            ResultSet rsSelect = psSelect.executeQuery();

            // Recorrer los resultados y mostrarlos por consola
            List<ExpedienteUsuario> lista = new ArrayList<>();
            while (rsSelect.next()) {
                ExpedienteUsuario eu = new ExpedienteUsuario();
                eu.setId(rsSelect.getInt("id"));
                eu.setNombreArchivo(rsSelect.getString("nombre_archivo"));
                eu.setPath(rsSelect.getString("path_archivo"));
                lista.add(eu);
            }
            return lista;
        }
    }
}