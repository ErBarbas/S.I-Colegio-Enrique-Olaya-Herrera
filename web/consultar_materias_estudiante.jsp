<%-- 
    Document   : consultar_materias_estudiante
    Created on : 02-oct-2019, 5:38:34
    Author     : Windows 10
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.NotasDAO"%>
<%@page import="ModeloVO.NotasVO"%>
<%

    response.setHeader("Pragma", "no-cache");
    response.addHeader("Cache-control", "must-revalidate");
    response.addHeader("Cache-control", "no-cache");
    response.addHeader("Cache-control", "no-store");
    response.setDateHeader("Expires", 0);

    HttpSession sesion = (HttpSession) request.getSession();

    if (sesion.getAttribute("rolUsu").equals("Acudiente")) {

        response.sendRedirect("Menu_Acudiente.jsp");

    }
    try {
        if (sesion.getAttribute("rolUsu") == null) {

            request.getRequestDispatcher("index.jsp").forward(request, response);

        }
    } catch (Exception e) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Consultar Estudiante</title>
        <link rel="stylesheet" href="CSS/estilos.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap4.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    </head>
    <body>
        <%            String idEst = request.getParameter("idEst");

        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <img class="logo" src="imagenes/logo2.png" width="200" height="50" alt="logo" />
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <i class="fas fa-user-tie text-primary pl-4 fs"></i><b class="text-primary fs pr-4"><%=sesion.getAttribute("nomUsu")%></b>
                </li>
            </ul>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse text-center" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Inicio</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Acciones
                        </a>
                        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdownMenuLink">
                            <a href="consultar_Estudiante.jsp" class="dropdown-item">Gestionar Estudiantes</a>
                            <a href="registrar_Estudiante.jsp" class="dropdown-item">Crear Estudiante</a>
                            <a href="estudiantes_Inhabilitados.jsp" class="dropdown-item">Estudiantes Inhabilitados</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Sobre Nosotros</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Ajustes de Usuario
                        </a>
                        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdownMenuLink">
                            <a href="Form_Validacion_Cambio_Usuario.jsp" class="dropdown-item">Cambiar Usuario</a>
                            <a href="Form_Validacion_Cambio_Clave.jsp" class="dropdown-item">Cambiar Contraseña</a>
                            <a href="Datos_Profesor.jsp?idUsu=<%= sesion.getAttribute("idUsu")%>" class="dropdown-item">Mis Datos</a>
                            <a href="Inhabilitar_Cuenta.jsp" class="dropdown-item">Inhabilitar Cuenta</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="CSesion">Cerrar Sesión</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container text-center text-white">

            <h1>Materias del Estudiante</h1>

            <table id="table_id" class="table table-striped table-bordered dt-responsive nowrap bg-light text-dark m-auto" style="width: 77%">
                <thead>
                    <tr>
                        <th>Materia</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        NotasVO notasVO = new NotasVO();
                        NotasDAO notasDAO = new NotasDAO();
                        ArrayList<NotasVO> listaMaterias = notasDAO.listarMaterias(idEst);
                        for (int i = 0; i < listaMaterias.size(); i++) {
                            notasVO = listaMaterias.get(i);

                    %>

                    <tr>

                        <td>
    <%= notasVO.getMateria()%>
                        </td>
                        <td>
                            <a href="registrar_notas.jsp?idEst=<%= idEst %>&&idMateria=<%= notasVO.getId_Materia() %>" title="Gestionar notas"><i class="fas fa-check-circle"></i></a>
                        </td>

                    </tr>

                    <%}%>
                </tbody>
            </table>
                
                <input type="hidden" name="idEst" value="<%= notasVO.getId_Materia()%>">

        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap4.min.js"></script>
        <script src="JS/DTables.js" type="text/javascript"></script>

    </body>
</html>
