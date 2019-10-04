/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.AcudienteDAO;
import ModeloVO.AcudienteVO;
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
 * @author JS
 */
@WebServlet(name = "Acudiente", urlPatterns = {"/Acudiente"})
public class Acudiente extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        int opcion = Integer.parseInt(request.getParameter("opcion"));

        String idAcu = request.getParameter("txtIdUsu");
        String nombre = request.getParameter("txtNombre");
        String identificacion = request.getParameter("txtIdentificacion");
        String telefono = request.getParameter("txtTelefono");

        if (telefono.equals("")) {

            telefono = "0";

        }

        HttpSession sesion = (HttpSession) request.getSession();

        AcudienteVO acuVO = new AcudienteVO(idAcu, nombre, identificacion, telefono);

        AcudienteDAO acuDAO = new AcudienteDAO(acuVO);

        switch (opcion) {
            case 1:
                if (acuDAO.crearRegistro()) {
                    request.setAttribute("mensajeExito", "!El Acudiente se registro correctamente");
                } else {
                    request.setAttribute("mensajeErro", "!El Acudiente no se registro correctamente");

                }
                request.getRequestDispatcher("registrar_Acudiente.jsp").forward(request, response);

                break;

            case 2:
                if (acuDAO.modificarRegistro()) {

                    request.setAttribute("mensajeExito", "!El Acudiente se Actualizo correctamente");

                } else {

                    request.setAttribute("mensajeErro", "!El Acudiente no se Actualizo correctamente");

                }

                request.getRequestDispatcher("Datos_Acudiente.jsp?idUsu=" + sesion.getAttribute("idUsu")).forward(request, response);

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
