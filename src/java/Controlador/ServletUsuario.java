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

@WebServlet(name = "ServletUsuario", urlPatterns = {
    "/Cod_Usu"
})
public class ServletUsuario extends HttpServlet {

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

            int opcion = Integer.parseInt(request.getParameter("btnOpcion"));
            String nombre = request.getParameter("txtUsuario");
            String clave = request.getParameter("txtClave");
            String rolAsignado = request.getParameter("tipRol");
            String estadoAsignado = null;
            String codigo = request.getParameter("txtCodigo");

            UsuarioVO usuarioVO = new UsuarioVO(nombre, clave, rolAsignado, estadoAsignado, codigo);
            UsuarioDAO usuarioDAO = new UsuarioDAO(usuarioVO);

            out.print("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\">");

            switch (opcion) {

                case 1:

                    if (usuarioDAO.crearRegistro() && rolAsignado.equals("1")) {

                        request.setAttribute("Exito", "<p class='text-success'>Usuario 'Acudiente' creado exitosamente.</p>");

                    } else {

                        request.setAttribute("Error", "<p class='text-danger'>Usuario ya creado. Por favor, elija otro nombre.</p>");

                    }

                    request.getRequestDispatcher("Form_Registro_Usuario.jsp").forward(request, response);

                    break;

                case 2:

                    if (usuarioDAO.crearRegistro() && rolAsignado.equals("2")) {

                        request.setAttribute("Exito", "<p class='text-success'>Usuario 'Profesor' creado exitosamente.</p>");

                    } else {

                        request.setAttribute("Error", "<p class='text-danger'>Usuario ya creado o codigo incorrecto.</p>");

                    }

                    request.getRequestDispatcher("Registro_Profesor.jsp").forward(request, response);

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
    } // </editor-fold>

}
