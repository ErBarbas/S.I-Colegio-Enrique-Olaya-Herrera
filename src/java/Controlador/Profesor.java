/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.ProfesorDAO;
import ModeloVO.ProfesorVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Windows 10
 */
@WebServlet(name = "Profesor", urlPatterns = {"/Profesor"})
public class Profesor extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            int opcion = Integer.parseInt(request.getParameter("opcion"));
            
            String idProf = request.getParameter("txtIdUsu");
            String nombre = request.getParameter("txtNombre");
            String identificacion = request.getParameter("txtIdentificacion");
            String telefono = request.getParameter("txtTelefono");
            
            if (telefono.equals("")) {
                
                telefono = "0";
                
            }
            
            ProfesorVO profesorVO = new ProfesorVO(idProf, nombre, identificacion, telefono);
            ProfesorDAO profesorDAO = new ProfesorDAO(profesorVO);
            
            HttpSession sesion = (HttpSession) request.getSession();
            
            switch(opcion){
            
            case 1:
                
                if (profesorDAO.modificarRegistro()) {
                    
                    request.setAttribute("MensajeExito", "Datos actualizados correctamente");
                    
                }else{
                
                    request.setAttribute("MensajeError", "No se han podido actualizar los datos");
                    
                }
                
                request.getRequestDispatcher("Datos_Profesor.jsp?idUsu=" + sesion.getAttribute("idUsu")).forward(request, response);
                
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
