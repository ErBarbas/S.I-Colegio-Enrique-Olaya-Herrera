<%-- 
    Document   : Datos_Acudiente
    Created on : 27-ago-2019, 23:14:42
    Author     : Windows 10
--%>

<%@page import="ModeloDAO.ProfesorDAO"%>
<%@page import="ModeloVO.ProfesorVO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%    response.setHeader("Pragma", "no-cache");
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

        <link rel="stylesheet" href="CSS/cards.css">
        <link rel="stylesheet" href="CSS/estilos.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <img class="logo" src="imagenes/logo2.png" width="200" height="50" alt="logo" />
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <i class="fas fa-user-alt text-primary pl-4 fs"></i><b class="text-primary fs pr-4"><%=sesion.getAttribute("nomUsu")%></b>
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
                            <a href="Estudiantes_Enlazados.jsp" class="dropdown-item">Informacion de mi Estudiante</a>
                            <a href="Vincular_Estudiante.jsp" class="dropdown-item">Enlazar un nuevo Estudiante</a>
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
                            <a href="Datos_Acudiente.jsp?idUsu=<%= sesion.getAttribute("idUsu")%>" class="dropdown-item">Mis Datos</a>
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
            <div class="card rounded-lg m-auto text-center cardStyle p-4" style="background-color: rgba(20,25,30,0.65);">

                <h1>Datos del Profesor</h1>
                <hr>

                <%                String idProf = request.getParameter("id");

                    ProfesorVO profVO = new ProfesorVO();
                    ProfesorDAO profDAO = new ProfesorDAO();

                    ArrayList<ProfesorVO> listaDatosProf = profDAO.listarDatosPerfilProfesor(idProf);

                    for (int i = 0;
                            i < listaDatosProf.size();
                            i++) {
                        profVO = listaDatosProf.get(i);

                %>
                
                <label for="nombre">Nombre</label><br>
                <input type="text" class="form-control" id="nombre" placeholder="No hay datos" maxlength="20" readonly value="<%=profVO.getNombre()%>"><br>
                <label for="identificacion">Identificación</label><br>
                <input type="number" class="form-control" id="identificacion" placeholder="No hay datos" maxlength="15" readonly value="<%=profVO.getIdentificacion()%>"><br>
                <label for="telefono">Teléfono</label><br>
                <input type="number" class="form-control" id="telefono" placeholder="No hay datos" readonly maxlength="15" value=<%=profVO.getTelefono()%>>
                <p>Quieres enviarme un mensaje?  <a href="Menu_Acudiente.jsp" class="text-white"><span class="text-success">Contactame!</span></a><br>
                    <br>
                    <%}%>
                    <button class="btn btn-success" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">Enviar mensaje por WhatsApp <i class="fab fa-whatsapp"></i></button>
                <div class="collapse" id="collapseExample">
                    <form class="p-4 m-auto" action="" method="post" style="width: 80%;">
                        <label for="telefonoWsp">Teléfono</label>
                        <input type="tel" class="form-control" name="telefono" pattern="[0-9]{0,12}" maxlength="12" autocomplete="off" placeholder="Sin numero de celular" id="telefonoWsp" value=<%=profVO.getTelefono()%>><br>
                        <label for="nombre">Ingresa tu nombre</label>
                        <input type="text" class="form-control" name="nombre" id="nombre"><br>
                        <label for="hijo">Acudiente de:</label>
                        <input type="text" class="form-control" name="hijo" id="hijo"><br>
                        <label for="mensaje">Escribe tu mensaje</label>
                        <textarea class="form-control" name="mensaje" id="mensaje"></textarea><br>
                        <input class="btn btn-success" type="submit" name="btnEnviar">
                    </form>
                    <%
                        if (request.getParameter("btnEnviar") != null) {

                            String telefono = "57" + request.getParameter("telefono");
                            String nombre = request.getParameter("nombre");
                            String hijo = request.getParameter("hijo");
                            String mensaje = "Nombre: " + nombre + "%0A" + "Hijo: " + hijo + "%0A" + request.getParameter("mensaje");
                            String mensajeLink = mensaje.replaceAll(" ", "%20");

                            response.sendRedirect("https://api.whatsapp.com/send?phone=" + telefono + "&text=" + mensajeLink);
                        }
                    %>
                </div>
                <input type="hidden" value="<%= sesion.getAttribute("rolUsu")%>" id="usuRol">
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
        <script src="JS/Mod_URL.js" type="text/javascript"></script>
        <script>

        </script>
    </body>
</html>