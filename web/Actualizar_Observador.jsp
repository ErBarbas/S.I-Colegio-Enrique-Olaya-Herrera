<%-- 
    Document   : Actualizar_Observador
    Created on : 09-sep-2019, 19:25:44
    Author     : Windows 10
--%>

<%@page import="ModeloDAO.ObservadorDAO"%>
<%@page import="ModeloVO.ObservadorVO"%>
<%@page import="java.util.ArrayList"%>

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
        <title>Cambiar Usuario</title>
        <link rel="stylesheet" href="CSS/estilos.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
        <div class="container text-white py-4">
            <div class="card m-auto rounded-lg text-center p-4" style="background-color: rgba(20,25,30,0.65);">
                <form method="post" action="Observador" class="m-auto" style="width: 66%;">

                    <h1 class="text-center">Actualizar Observador</h1>
                    <hr>

                    <%

                        String id = request.getParameter("id");

                        ObservadorVO Obs_VO2 = new ObservadorVO();
                        ObservadorDAO Obs_DAO2 = new ObservadorDAO();

                        ArrayList<ObservadorVO> lista_OBS = Obs_DAO2.listarDatosObservador(id);

                        for (int i = 0; i < lista_OBS.size(); i++) {
                            Obs_VO2 = lista_OBS.get(i);

                    %>
                    
                    <label for="idObs">ID del observador</label>
                    <input type="number" class="form-control" id="idObs" maxlength="5" readonly value=<%= Obs_VO2.getIdObs()%>><br>
                    <label for="grado">Grado</label><br>
                    <input type="text" class="form-control" id="grado" readonly value="<%=Obs_VO2.getGrado()%>"><br>
                    <label for="descripcion">Descripción</label><br>
                    <textarea class="form-control" name="txaObservacion" id="descripcion" maxlength="254" ><%=Obs_VO2.getDescripcion()%></textarea><br>
                    <label for="compromiso">Compromiso</label><br>
                    <textarea class="form-control" name="txaCompromiso" id="compromiso" maxlength="254" required><%=Obs_VO2.getCompromiso()%></textarea><br>
                    <label for="idEst">Codigo del estudiante</label><br>
                    <input type="text" class="form-control" id="idEst" maxlength="15" value=<%=Obs_VO2.getCodigoEst()%> readonly ><br>
                    <input type="hidden" value="<%= Obs_VO2.getIdObs()%>" name="id" >
                    <br>
                    <%
                        }
                    %>       
                    <button class="btn btn-primary">Actualizar</button>
                    <input type="hidden" value=2 name="btnOpcion"><br><hr>
                    <%
                        if (request.getAttribute("MensajeError") != null) {%>
                    ${MensajeError}
                    <%} else {%>
                    ${MensajeExito}
                    <%}%>
                </form>
            </div>
        </div>
        <footer id="sticky-footer" class="py-4 bg-light text-dark">
            <div class="container text-center">
                <p >Colegio Enrique Olaya Herrera &COPY;</p>
                <p>Colegio Enrique Olaya Herrera<br /> Tels: (571) 361 4147 - 361 4146 / Cra. 10 No. 31 - 29 Sur / Bogotá D.C. Colombia</p>
                <a href="https://www.facebook.com/enriqueolayah?ref=ts&fref=ts"><i class="fab fa-facebook-square icons"></i></a>
                <a href="https://twitter.com/colegioeoh"><i class="fab fa-twitter-square icons"></i></a>
            </div>
        </footer>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
