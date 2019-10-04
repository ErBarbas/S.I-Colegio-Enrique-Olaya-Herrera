<%-- 
   Document   : Form_Validacion_Cambio_Usuario
   Created on : 30-jul-2019, 10:49:26
   Author     : Windows 10
--%>

<%

    HttpSession sesion = (HttpSession) request.getSession();

    if (sesion.getAttribute("rolUsu") == null) {

        response.sendRedirect("index.jsp");

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
        <link href="CSS/validacion.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="CSS/cards.css">
        <link rel="stylesheet" href="CSS/estilos.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <img class="logo" src="imagenes/logo2.png" width="200" height="50" alt="logo" />
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <i class="fas fa-user-alt text-primary pl-4 fs" id="logoUsu"></i><b class="text-primary fs pr-4"><%=sesion.getAttribute("nomUsu")%></b>
                </li>
            </ul>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse text-center" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="Menu_Acudiente.jsp" id="linkM">Inicio</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Acciones
                        </a>
                        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdownMenuLink">
                            <a href="Estudiantes_Enlazados.jsp" class="dropdown-item" id="url1">Informacion de mis Estudiantes</a>
                            <a href="Vincular_Estudiante.jsp" class="dropdown-item" id="url2">Enlazar un nuevo Estudiante</a>
                            <a href="estudiantes_Inhabilitados.jsp" class="dropdown-item" id="lkProf">Estudiantes Inhabilitados</a>
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
                            <a href="#" class="dropdown-item">Cambiar Usuario</a>
                            <a href="Form_Validacion_Cambio_Clave.jsp" class="dropdown-item">Cambiar Contraseña</a>
                            <a href="Datos_Acudiente.jsp?idUsu=<%= sesion.getAttribute("idUsu")%>" class="dropdown-item" id="datProf">Mis Datos</a>
                            <a href="Inhabilitar_Cuenta.jsp" class="dropdown-item">Inhabilitar Cuenta</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="CSesion">Cerrar Sesión</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container py-4">
            <div class="cardStyle text-center m-auto rounded-lg cardStyle" style="background-color: rgba(20,25,30,0.65);">
                <form class="text-white m-auto" action="SValidsUsu" method="post" style="width: 66%">
                    <h1>Ingrese los datos</h1>
                    <hr>
                    <input type="hidden" name="txtUsuario" value="<%= sesion.getAttribute("nomUsu")%>" autocomplete="off">
                    <label class="my-1" for="newUsuario">Introduzca su nuevo usuario </label>
                    <input class="form-control" type="text" name="txtNewUsuario" id="newUsuario" pattern="[a-zA-Z_ñá-ú0-9]{0,20}" maxlength="20" required autocomplete="off"><br>
                    <label class="my-1" for="clave">Introduzca su contraseña </label>
                    <input class="form-control" type="password" name="txtClave" id="clave" pattern="[a-zA-Z_ñá-ú0-9]{0,20}" maxlength="20" required autocomplete="off"><br>
                    <button class="btn btn-primary">Cambiar usuario</button>
                    <input type="hidden" value="2" name="btnOpcion">
                    <input type="hidden" value="1" name="opcCambiar">
                    <input type="hidden" value="<%= sesion.getAttribute("rolUsu")%>" id="usuRol">
                    <br>
                    <hr>
                    <%                if (request.getAttribute("Error") != null) {%>
                    ${Error}
                    <%} else {%>
                    ${Exito}
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
        <script src="JS/Mod_URL.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {

                var rol = $('#usuRol').val();

                if (rol == "Profesor") {

                    $('#datProf').attr("href", "Datos_Profesor.jsp?idUsu=<%= sesion.getAttribute("idUsu")%>")

                }
            });
        </script>
    </body>
</html>
