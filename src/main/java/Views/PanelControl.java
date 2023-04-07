/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Views;

import Controllers.ColaboradorDao;
import Models.Cargo;
import Models.Colaborador;
import Models.Comuna;
import Models.Empresa;
import Models.Pais;
import Models.Region;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author osbustaman
 */
@WebServlet(name = "PanelControl", urlPatterns = {"/PanelControl"})
@MultipartConfig
public class PanelControl extends HttpServlet {
    
    RequestDispatcher rd;
    static final int CHUNK_SIZE = 1024*4;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Crear una nueva sesión
        HttpSession session = request.getSession();
        if(session.getAttribute("token") == null){
            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }else {
            System.out.println("El valor de session.getAttribute('token') es: " + session.getAttribute("token"));
        }
        
        String accion = request.getParameter("page");
        
        if(null == accion){
            response.sendRedirect("PanelControl.jsp");
        }else switch (accion) {
            case "new_colaborador":
                request.setAttribute("pagina", "AddColaborador.jsp");
                
                ColaboradorDao colaboradorDao = new ColaboradorDao();
                request.setAttribute("lstPaises", colaboradorDao.listarPaises());
                
                request.setAttribute("lstRegiones", colaboradorDao.listarRegiones());
                
                request.setAttribute("lstComunas", colaboradorDao.listarComunas());
                
                request.setAttribute("lstCargos", colaboradorDao.listarCargos());
                
                rd = request.getRequestDispatcher("AddColaborador.jsp");
                rd.forward(request, response);
                break;
            case "list_colaborador":
                request.setAttribute("pagina", "ListColaborador.jsp");

                rd = request.getRequestDispatcher("ListColaborador.jsp");
                rd.forward(request, response);
                break;
            default:
                response.sendRedirect("PanelControl.jsp");
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(PanelControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            ColaboradorDao colaboradorDao = new ColaboradorDao();
            
            String rut = request.getParameter("rut");
            String nombres = request.getParameter("nombres");
            String apellidos = request.getParameter("apellidos");
            String direccion = request.getParameter("direccion");
            
            int pais_id = Integer.parseInt(request.getParameter("pais"));
            Pais pais = new Pais(pais_id);
            
            int region_id = Integer.parseInt(request.getParameter("region"));
            Region region = new Region(region_id);
            
            int comuna_id = Integer.parseInt(request.getParameter("comuna"));
            Comuna comuna = new Comuna(comuna_id);
            
            String estadoCivil = request.getParameter("estado_civil");
            String sexo = request.getParameter("sexo");
            
            int empresa_id = 1;
            Empresa empresa = new Empresa();
            empresa.setId(empresa_id);
            
            int cargo_id = Integer.parseInt(request.getParameter("cargo"));
            Cargo cargo = new Cargo();
            cargo.setId(cargo_id);
            
            String fechaIngreso = request.getParameter("fecha_ingreso");
            String password = request.getParameter("password");
            
            int perfil = Integer.parseInt(request.getParameter("perfil"));
            
            // Obtener el objeto ServletContext
            ServletContext context = getServletContext();

            // Obtener la ruta del directorio raíz
            String rootPath = context.getRealPath("/");

            // Imprimir la ruta del directorio raíz
            System.out.println("La ruta del directorio raíz es: " + rootPath);
            
            String rutaDirectorio = rootPath+"/"+rut+"/";
            File directorio = new File(rutaDirectorio);
            if (!directorio.exists()) {
                if (directorio.mkdirs()) {
                        System.out.println("Directorio creado con éxito!");
                }
            } else {
                System.out.println("El directorio ya existe.");
            }
            
            Colaborador colaborador = new Colaborador(rut
                    , nombres
                    , apellidos
                    , pais
                    , region
                    , comuna
                    , direccion
                    , estadoCivil
                    , sexo
                    , empresa
                    , cargo
                    , fechaIngreso
                    , password
                    , perfil
                    , rutaDirectorio
            );
            
            String imageColaborador = request.getParameter("imagen");
            Part parteDelArchivo = request.getPart("imagen");
            
            InputStream fileContent = parteDelArchivo.getInputStream();
            OutputStream os = new BufferedOutputStream(new FileOutputStream(new File(rutaDirectorio)));
            byte[] chunk = new byte[CHUNK_SIZE];
            int bytesLeidos = 0;
            
            while((bytesLeidos = fileContent.read(chunk)) > 0){
                os.write(chunk, 0, bytesLeidos);
            }
            os.close();
            
            System.out.println(colaborador.getPassword());
            colaboradorDao.insertarColaborador(colaborador);
            
            response.sendRedirect("PanelControl?page=new_colaborador");
       
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(PanelControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
