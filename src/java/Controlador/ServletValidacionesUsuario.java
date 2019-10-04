/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.UsuarioDAO;
import ModeloVO.UsuarioVO;
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
@WebServlet(name = "ServletValidacionesUsuario", urlPatterns = {"/SValidsUsu"})
public class ServletValidacionesUsuario extends HttpServlet {

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

        int opcion = Integer.parseInt(request.getParameter("btnOpcion"));
        String newNombre = request.getParameter("txtNewUsuario");
        String newClave = request.getParameter("txtNewClave");
        String nombre = request.getParameter("txtUsuario");
        String clave = request.getParameter("txtClave");
        String opcionCambiar = request.getParameter("opcCambiar");
        String rolAsignado = null;
        String estadoAsignado = null;
        String codigo = null;

        UsuarioVO usuarioVO = new UsuarioVO(nombre, clave, rolAsignado, estadoAsignado, codigo);
        UsuarioDAO usuarioDAO = new UsuarioDAO(usuarioVO);

        out.print("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\">");

        switch (opcion) {

            case 1: //Para Validar el ingreso del Usuario

                if (usuarioDAO.consultarRegistro()) {

                    int rol = Integer.parseInt(usuarioDAO.getRol());
                    int estado = Integer.parseInt(usuarioDAO.getEstado());
                    String idUsu = usuarioDAO.getIdUsu();

                    if (rol == 1 && estado == 1) {

                        HttpSession sesion = request.getSession(true);

                        sesion.setAttribute("nomUsu", nombre);
                        sesion.setAttribute("rolUsu", "Acudiente");
                        sesion.setAttribute("idUsu", idUsu);
                        
                        request.getRequestDispatcher("Menu_Acudiente.jsp").forward(request, response);

                    } else if (rol == 2 && estado == 1) {

                        HttpSession sesion = request.getSession(true);

                        sesion.setAttribute("nomUsu", nombre);
                        sesion.setAttribute("rolUsu", "Profesor");
                        sesion.setAttribute("idUsu", idUsu);

                        request.getRequestDispatcher("Menu_Profesor.jsp").forward(request, response);
                    } else {

                        request.setAttribute("MsgInhabilitado", "<p style=\"margin:-2.5% 0;\" class='text-danger'>La cuenta se encuentra inhabilitada</p><br><a href=\"Habilitar_Cuenta.jsp\">Volver a habilitar mi cuenta</a><br><br>");

                    }
                } else {

                    request.setAttribute("Error", "<p class='text-danger'>Datos incorrectos.</p>");

                }

                request.getRequestDispatcher("index.jsp").forward(request, response);

                break;

            case 2:

                if (usuarioDAO.validacionCambioDatosAcceso(newNombre, nombre, newClave, clave, opcionCambiar)) {

                    request.setAttribute("Exito", "<p class='text-success'>Usuario actualizado correctamente</p>");

                } else {

                    request.setAttribute("Error", "<p class='text-danger'>No se pudo actualizar su Usuario. <br>Revise sus datos o ingrese otro nombre.</p>");

                }

                request.getRequestDispatcher("Form_Validacion_Cambio_Usuario.jsp").forward(request, response);

                break;

            case 3:

                if (usuarioDAO.validacionCambioDatosAcceso(newNombre, nombre, newClave, clave, opcionCambiar)) {

                    request.setAttribute("Exito", "<p class='text-success'>Clave actualizada correctamente</p>");

                } else {

                    request.setAttribute("Error", "<p class='text-danger'>No se pudo actualizar su Clave. Datos Incorrectos</p>");

                }

                request.getRequestDispatcher("Form_Validacion_Cambio_Clave.jsp").forward(request, response);

                break;

            case 4:

                if (usuarioDAO.habilitarDeshabilitarCuenta(nombre, clave, opcionCambiar)) {

                    request.setAttribute("Exito", "<p class='text-success'>Su cuenta ha sido habilitada con exito.</p>");

                } else {

                    request.setAttribute("Error", "<p class='text-danger'>Datos incorrectos.</p>");

                }

                request.getRequestDispatcher("Habilitar_Cuenta.jsp").forward(request, response);

                break;

            case 5:

                if (usuarioDAO.habilitarDeshabilitarCuenta(nombre, clave, opcionCambiar)) {

                    request.setAttribute("Exito", "<p class='text-success'>Su cuenta ha sido inhabilitada con exito. Sera redireccionado al login en 3 segundos. </p>"
                            + "<script>function redireccionarPagina() {\n"
                            + "  window.location = \"CSesion\";\n"
                            + "}\n"
                            + "setTimeout(\"redireccionarPagina()\", 3000);</script>");

                } else {

                    request.setAttribute("Error", "<p class='text-danger'>Datos incorrectos.</p>");

                }

                request.getRequestDispatcher("Inhabilitar_Cuenta.jsp").forward(request, response);

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
