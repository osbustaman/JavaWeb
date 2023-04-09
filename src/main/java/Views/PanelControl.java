package Views;

import Controllers.ColaboradorDao;
import Models.Cargo;
import Models.Colaborador;
import Models.Comuna;
import Models.Empresa;
import Models.ExpedienteUsuario;
import Models.Pais;
import Models.Region;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
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


@WebServlet(name = "PanelControl", urlPatterns = {"/PanelControl"})
@MultipartConfig
public class PanelControl extends HttpServlet {
    
    RequestDispatcher rd;
    Colaborador colaborador;

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
        
        ColaboradorDao colaboradorDao = new ColaboradorDao();
        request.setAttribute("lstPaises", colaboradorDao.listarPaises());
        request.setAttribute("lstRegiones", colaboradorDao.listarRegiones());
        request.setAttribute("lstComunas", colaboradorDao.listarComunas());
        request.setAttribute("lstCargos", colaboradorDao.listarCargos());
        
        if(null == accion){
            response.sendRedirect("PanelControl.jsp");
        }else switch (accion) {
            case "edit_colaborador":
                
                Colaborador colaborador = colaboradorDao.getColaborador(Integer.parseInt(request.getParameter("id")));
                
                request.setAttribute("id", colaborador.getId());
                request.setAttribute("rut", colaborador.getRut());
                request.setAttribute("nombres", colaborador.getNombres());
                request.setAttribute("apellidos", colaborador.getApellidos());
                
                request.setAttribute("direccion", colaborador.getDireccion());
                request.setAttribute("pais", colaborador.getPais().getId());
                request.setAttribute("region", colaborador.getRegion().getId());
                request.setAttribute("comuna", colaborador.getComuna().getId());
                
                request.setAttribute("estado_civil", colaborador.getEstadoCivil());
                request.setAttribute("sexo", colaborador.getSexo());
                request.setAttribute("cargo", colaborador.getCargo().getId());
                request.setAttribute("fecha_ingreso", colaborador.getFechaIngreso());
                
                request.setAttribute("password", colaborador.getPassword());
                request.setAttribute("perfil", colaborador.getPerfil());
                
                request.setAttribute("lstExpedientes", colaboradorDao.listarExpedienteColaborador(colaborador.getId()));
                
                request.setAttribute("loQueHace", "Editar");
                rd = request.getRequestDispatcher("AddColaborador.jsp");
                rd.forward(request, response);
                break;
            case "new_colaborador":
                request.setAttribute("loQueHace", "Agregar");
                rd = request.getRequestDispatcher("AddColaborador.jsp");
                rd.forward(request, response);
                break;
            case "delete_colaborador":
                colaboradorDao.deletecolaborador(Integer.parseInt(request.getParameter("id")));
                response.sendRedirect("PanelControl?page=list_colaborador");
                break;
            case "list_colaborador":
                request.setAttribute("pagina", "ListColaborador.jsp");
                
                request.setAttribute("lstColaboradores", colaboradorDao.listarColaboradores());
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
            HttpSession session = request.getSession();
            
            String accion = request.getParameter("page");
            String _rut = request.getParameter("_rut");
            
            // Obtener el objeto ServletContext
            ServletContext context = getServletContext();

            // Obtener la ruta del directorio raíz
            String rootPath = context.getRealPath("\\");
            
            if (accion.equals("carga_masiva") || accion.equals("upload_archivo")){
                
                PrintWriter out = response.getWriter();
                
                String nombre = "upload_archivo.xlsx";
                if(request.getParameter("id") != null){
                    nombre = request.getParameter("nombre_completo");
                }
                
                Part archivo = request.getPart("upload-file");
                InputStream is = archivo.getInputStream();
                
                File f = new File(rootPath + "\\" + _rut + "\\" + nombre);
                FileOutputStream ous = new FileOutputStream(f);
                
                int dato = is.read();
                
                while(dato != -1){
                    ous.write(dato);
                    dato = is.read();
                }
                
                ous.close();
                is.close();
                
                String pathEmpleado = _rut + "\\" + nombre;
                if(request.getParameter("id") != null){
                    
                    String tipoArchivo = request.getParameter("tipo_archivo");
                    
                    if("FP".equals(tipoArchivo)){
                        int id = Integer.parseInt(request.getParameter("id"));
                        
                        if(request.getParameter("id") == session.getAttribute("id")){
                            session.setAttribute("imagenColaborador", pathEmpleado);
                        }
                        colaboradorDao.updateImagenColaborador(id, pathEmpleado);
                    }else if("OT".equals(tipoArchivo)){
                        ExpedienteUsuario eu = new ExpedienteUsuario();
                        
                        int id = Integer.parseInt(request.getParameter("id"));
                        colaborador = new Colaborador();
                        colaborador.setId(id);
                        
                        eu.setColaborador(colaborador);
                        eu.setNombreArchivo(nombre);
                        eu.setPath(pathEmpleado);
                        
                        colaboradorDao.insertarDocumento(eu);
                    }

                    response.sendRedirect("PanelControl?page=edit_colaborador&id="+request.getParameter("id"));
                }else{
                    response.sendRedirect("PanelControl?page=list_colaborador");
                }
                
                
                
            }else{
                
                String nombres = request.getParameter("nombres");
                String apellidos = request.getParameter("apellidos");
                String direccion = request.getParameter("direccion");
                String rut = request.getParameter("rut");

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

                // Imprimir la ruta del directorio raíz
                System.out.println("La ruta del directorio raíz es: " + rootPath);

                String rutaDirectorio = rootPath+"\\"+rut+"\\";
                File directorio = new File(rutaDirectorio);
                if (!directorio.exists()) {
                    if (directorio.mkdirs()) {
                            System.out.println("Directorio creado con éxito!");
                    }
                } else {
                    System.out.println("El directorio ya existe.");
                }

                colaborador = new Colaborador(
                        rut
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

                if(accion.equals("new_colaborador")){
                    int id = colaboradorDao.insertarColaborador(colaborador);
                    response.sendRedirect("PanelControl?page=edit_colaborador&accion=success&p=add&id="+String.valueOf(id));
                }else if(accion.equals("edit_colaborador")){
                    int colaboradorId = Integer.parseInt(request.getParameter("colaborador_id").trim());
                    int id = colaboradorDao.updateColaborador(colaboradorId, colaborador);
                    response.sendRedirect("PanelControl?page=edit_colaborador&accion=success&p=edit&id="+String.valueOf(id));
                }
            }

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(PanelControl.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(" --------- " + ex);
            
            response.sendRedirect("PanelControl?page=new_colaborador");
        }
    }
    
    
    
}
