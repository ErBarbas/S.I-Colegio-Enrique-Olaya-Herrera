<%-- 
   Document   : Menu
   Created on : 28-jul-2019, 16:38:11
   Author     : Windows 10
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="Cache-Control" content="no-cache">
        <meta http-equiv="Pragma" CONTENT="no-cache">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/estilos.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    </head>
    <body>
        <%

            response.setHeader("Pragma", "no-cache");
            response.addHeader("Cache-control", "must-revalidate");
            response.addHeader("Cache-control", "no-cache");
            response.addHeader("Cache-control", "no-store");
            response.setDateHeader("Expires", 0);

            HttpSession sesion = (HttpSession) request.getSession();

            if (sesion.getAttribute("rolUsu").equals("Profesor")) {

                response.sendRedirect("Menu_Profesor.jsp");

            }

            try {
                if (sesion.getAttribute("rolUsu") == null) {

                    request.getRequestDispatcher("index.jsp").forward(request, response);

                }
            } catch (Exception e) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        %>
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
        <div class="contenedor text-center">
            <h1 class="text-primary">COLEGIO ENRIQUE OLAYA HERRERA</h1>
            <hr>
            <h3 class="text-white">Bienvenido Acudiente: <i class="fas fa-user-alt"></i> <%=sesion.getAttribute("nomUsu")%></h3>
            <br>
            <div class="container text-center text-white">
                <div class="row">
                    <div class="col-sm-4">
                        <h3>Informacion de mi Estudiante</h3>
                        <p>Consulte los datos e informacion de su Hijo</p>
                        <img src="imagenes/niños.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
                    </div>
                    <div class="col-sm-4">
                        <h3>Notas de mi <br>Estudiante</h3>
                        <p>Consulte las notas de las materias de su Hijo</p>
                        <img src="imagenes/notas.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236">
                    </div>
                    <div class="col-sm-4">
                        <h3>Observador de mi Estudiante</h3>        
                        <p>Consulte informacion del observador de su Hijo</p>
                        <img src="imagenes/observaciones.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236">
                    </div>
                </div>
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
