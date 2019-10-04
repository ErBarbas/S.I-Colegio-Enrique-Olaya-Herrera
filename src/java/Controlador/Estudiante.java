/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.EstudianteDAO;
import ModeloVO.EstudianteVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author felipe
 */
@WebServlet(name = "Estudiante", urlPatterns = {"/Estudiante"})
public class Estudiante extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @SuppressWarnings("empty-statement")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int opcion = Integer.parseInt(request.getParameter("opcion"));

        String idAcu = request.getParameter("txtIdUsu");
        String idEst = request.getParameter("txtId");
        String nombre = request.getParameter("txtNombre");;
        String apellido = request.getParameter("txtApellido");
        String identificacion = request.getParameter("txtIdentificacion");
        String grado = request.getParameter("txtGrado");
        String telefono = request.getParameter("txtTelefono");
        String estado = request.getParameter("estadoEst");

        //Variables detalles
        String tipoDetalle = request.getParameter("hdTipo");
        String idProf = request.getParameter("idProf");

        EstudianteVO estudianteVO = new EstudianteVO(idEst, nombre, apellido, identificacion, grado, telefono, estado, idAcu);

        EstudianteDAO estudianteDAO = new EstudianteDAO(estudianteVO);

        switch (opcion) {
            case 1:
                if (estudianteDAO.crearRegistro()) {
                    if (estudianteDAO.generarDetalles(idProf, tipoDetalle)) {
                        request.setAttribute("mensajeExito", "!El Estudiante se registro correctamente");
                    }
                } else {
                    request.setAttribute("mensajeErro", "!El Estudiante no se registro correctamente");

                }
                request.getRequestDispatcher("registrar_Estudiante.jsp").forward(request, response);

                break;

            case 2:
                if (estado.equals("2")) {

                    tipoDetalle = "3";

                }
                if (estudianteDAO.modificarRegistro()) {
                    if (estudianteDAO.generarDetalles(idProf, tipoDetalle)) {
                        request.setAttribute("mensajeExito", "!El Estudiante se Actualizo correctamente");
                    }
                } else {
                    request.setAttribute("mensajeErro", "!El Estudiante no se Actualizo correctamente");

                }
                request.getRequestDispatcher("actualizar_Estudiante.jsp?id=" + idEst).forward(request, response);

                break;

            case 3:
                if (estudianteDAO.enlazarEstudiante(identificacion)) {
                    request.setAttribute("mensajeExito", "!Se ha enlazado Correctamente");
                } else {
                    request.setAttribute("mensajeErro", "!El Codigo de Enlace no es Valido");

                }
                request.getRequestDispatcher("Vincular_Estudiante.jsp").forward(request, response);

                break;

            case 4:
                if (estudianteDAO.habilitarEstudiante(idEst)) {
                    request.setAttribute("mensajeExito", "!Se ha enlazado Correctamente");
                } else {
                    request.setAttribute("mensajeErro", "!El Codigo de Enlace no es Valido");

                }
                request.getRequestDispatcher("estudiantes_Inhabilitados.jsp").forward(request, response);

                break;
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
