/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Views;

import Controllers.ColaboradorDao;
import Models.Colaborador;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author osbustaman
 */
@WebServlet(name = "LoginUser", urlPatterns = {"/LoginUser"})
public class LoginUser extends HttpServlet {
    
    public void cerrarSesion(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ClassNotFoundException{
        HttpSession session = request.getSession();
        
        ColaboradorDao cd = new ColaboradorDao();
        int colaboradorId = (Integer) session.getAttribute("id");
        cd.clearTokenColaborador(colaboradorId);
        
        session.invalidate();
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
                
        String accion = request.getParameter("accion");
        
        if("cerrarSesion".equals(accion)){
            try {
                cerrarSesion(request, response);
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(LoginUser.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException 
    {  
        
        try {
            String rut = request.getParameter("rut");
            String password = request.getParameter("password");
            
            response.setContentType("text/html;charset=UTF-8");
            
            ColaboradorDao cd = new ColaboradorDao();
            
            Colaborador colaborador = cd.loginUsuario(rut, password);
            if(colaborador != null){
                System.out.println("El usuario existe");
                
                // Crear una nueva sesión
                HttpSession session = request.getSession();

                // Establecer atributos en la sesión
                session.setAttribute("id", colaborador.getId());
                session.setAttribute("nombre", colaborador.getNombres());
                session.setAttribute("apellidos", colaborador.getApellidos());
                session.setAttribute("token", colaborador.getTokenSesion());
				
                // Redireccionar a otra página
                response.sendRedirect("PanelControl.jsp");
//                RequestDispatcher rd = request.getRequestDispatcher("/PanelControl.jsp");
//                rd.forward(request, response);

            }else{
                System.out.println("El usuario no existe");
            }
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(LoginUser.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("mensaje", "No existe el usuario"); // Agrega la variable "mensaje" al objeto request
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp"); // Redirecciona a index.jsp
            rd.forward(request, response); // Envía el objeto request y response a index.jsp
        }
    }
}
