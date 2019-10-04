<%-- 
   Document   : index
   Created on : 27-jul-2019, 19:50:08
   Author     : Windows 10
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="container my-4">
            <div class="card text-center m-auto rounded-lg cardStyle">
                <form class="m-auto" action="SValidsUsu" method="post">
                    <img src="imagenes/logo.png" alt="logo" />
                    <h2>Iniciar Sesión</h2><hr>
                    <label for="usuario">Usuario</label>
                    <input class="form-control" type="text" name="txtUsuario" id="usuario" maxlength="20" required autocomplete="off"><br>
                    <label for="clave">Clave</label>
                    <input class="form-control" type="password" name="txtClave" id="clave" maxlength="20" required autocomplete="off">
                    <button class="btn btn-primary my-4">Ingresar</button>
                    <input type="hidden" value="1" name="btnOpcion"><br>
                    <a class="btn btn-link" href="Form_Registro_Usuario.jsp">Registrese como Acudiente</a><br>
                    <a class="btn btn-link" href="Registro_Profesor.jsp">Registrese como Profesor</a><br><hr>
                    <%
                        if (request.getAttribute("Error") != null) {
                    %>
                    ${Error}
                    <%} else {%>
                    ${MsgInhabilitado}
                    <%}%>
                </form>
            </div>
        </div>
        <footer id="sticky-footer" class="py-4 bg-light text-dark">
            <div class="container text-center">
                <p >Colegio Enrique Olaya Herrera &COPY;</p>
                <p>Colegio Enrique Olaya Herrera<br /> Tels: (571) 361 4147 - 361 4146 / Cra. 10 No. 31 - 29 Sur / BogotÃ¡ D.C. Colombia</p>
                <a href="https://www.facebook.com/enriqueolayah?ref=ts&fref=ts"><i class="fab fa-facebook-square icons"></i></a>
                <a href="https://twitter.com/colegioeoh"><i class="fab fa-twitter-square icons"></i></a>
            </div>
        </footer>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="JS/Mod_URL.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
