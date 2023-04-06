/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Views;

import Controllers.ColaboradorDao;
import Models.Pais;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "PanelControl", urlPatterns = {"/PanelControl"})
public class PanelControl extends HttpServlet {
    
    RequestDispatcher rd;
    ColaboradorDao cd;
    List<Pais> listaPaises;

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
            case "add_colaborador":
                request.setAttribute("pagina", "AddColaborador.jsp");
                
                ColaboradorDao colaboradorDao = new ColaboradorDao();
                request.setAttribute("lstPaises", colaboradorDao.listarPaises());
                
                request.setAttribute("lstRegiones", colaboradorDao.listarRegiones());
                
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
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(PanelControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
