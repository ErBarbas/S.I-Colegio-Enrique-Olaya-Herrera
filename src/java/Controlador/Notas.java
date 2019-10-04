/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.NotasDAO;
import ModeloVO.NotasVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Windows 10
 */
@WebServlet(name = "Notas", urlPatterns = {"/Notas"})
public class Notas extends HttpServlet {

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
           String id_Nota = null;
           String nombre = request.getParameter("txtNombre");
           String periodo = request.getParameter("slcPeriodo");
           String nota = request.getParameter("txtNota");
           String promedio = null;
           String desempeño = null;
           String id_Estudiante = request.getParameter("idEst");
           String id_Prof = request.getParameter("idProf");
           String id_Materia = request.getParameter("idMat");
           
           NotasVO notasVO = new NotasVO(id_Nota, nombre, periodo, nota, promedio, desempeño, id_Estudiante, id_Prof, id_Materia, id_Materia);
           NotasDAO notasDAO = new NotasDAO(notasVO);
           
           switch(opcion){
           
               case 1:
                   
                   if (notasDAO.crearRegistro()) {
                       
                       request.setAttribute("MensajeExito", "Se ha registrado la nota correctamente");
                       
                   }else{
                   
                       request.setAttribute("MensajeError", "Ha ocurrido un problema al registrar la nota");
                   
                   }
                   
                   request.getRequestDispatcher("registrar_notas.jsp").forward(request, response);
           
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
