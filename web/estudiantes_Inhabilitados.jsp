<%-- 
    Document   : consultar_Estudiante
    Created on : 11/08/2019, 01:34:52 PM
    Author     : felipe
--%>
<%@page import="ModeloDAO.EstudianteDAO"%>
<%@page import="ModeloVO.EstudianteVO"%>
<%@page import="java.util.ArrayList"%>

<% response.setHeader("Pragma", "no-cache");
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
                        <a class="nav-link" href="Menu_Profesor.jsp">Inicio</a>
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
                            <a href="Inhabilitar_Cuenta.jsp" class="dropdown-item">Inhabilitar Cuenta</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="CSesion">Cerrar Sesión</a>
                    </li>
                </ul>
            </div>
        </nav>

        <br>
        <div class="container text-white text-center">
            <br>
            <table id="table_id" class="table table-striped table-bordered dt-responsive nowrap bg-light text-dark m-auto" style="width: 77%">
                <thead>
                    <tr>
                        <th>Codigo</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Identificacion</th>
                        <th>Grado</th>
                        <th>Telefono</th>
                        <th>Id del Acudiente</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        EstudianteVO estVO = new EstudianteVO();
                        EstudianteDAO estDAO = new EstudianteDAO();
                        ArrayList<EstudianteVO> listaEstudiantes = estDAO.listarEstudiantes("2");
                        for (int i = 0; i < listaEstudiantes.size(); i++) {
                            estVO = listaEstudiantes.get(i);

                    %>

                    <tr>

                        <td>
                            <%= estVO.getIdEst()%>
                        </td>
                        <td>
                            <%= estVO.getNombre()%>
                        </td>
                        <td>
                            <%= estVO.getApellido()%>
                        </td>
                        <td>
                            <%= estVO.getIdentificacion()%>
                        </td>
                        <td>
                            <%= estVO.getGrado()%>
                        </td>
                        <td>
                            <%= estVO.getTelefono()%>
                        </td>
                        <td>
                            <%= estVO.getIdAcu()%>
                        </td>
                        <td>
                            <form method="post" action="Estudiante">
                                <button class="btn btn-primary">Habilitar</button>
                                <input type="hidden" name="opcion" value="4">
                                <input type="hidden" name="txtId" value="<%= estVO.getIdEst()%>">
                            </form>
                        </td>

                    </tr>

                    <%}%>
                </tbody>
            </table>
        </div><br>

        <footer id="sticky-footer" class="py-4 bg-light text-dark">
            <div class="container text-center">
                <p>Colegio Enrique Olaya Herrera &COPY;</p>
                <p>Colegio Enrique Olaya Herrera<br /> Tels: (571) 361 4147 - 361 4146 / Cra. 10 No. 31 - 29 Sur / Bogotá D.C. Colombia</p>
                <a href="https://www.facebook.com/enriqueolayah?ref=ts&fref=ts"><i class="fab fa-facebook-square icons"></i></a>
                <a href="https://twitter.com/colegioeoh"><i class="fab fa-twitter-square icons"></i></a>
            </div>
        </footer>

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
