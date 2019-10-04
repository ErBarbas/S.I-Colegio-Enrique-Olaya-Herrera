<%-- 
   Document   : Form_Registro_Usuario
   Created on : 28-jul-2019, 15:48:01
   Author     : Windows 10
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="CSS/validacion.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="CSS/cards.css">
        <link rel="stylesheet" href="CSS/estilos.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container my-4">
            <div class="card text-center m-auto rounded-lg cardStyle">
                <form action="Cod_Usu" method="post" class="m-auto" style="width: 44%">
                    <img class="logo" src="imagenes/logo.png" width="200" height="200" alt="logo"/>
                    <h2>REGISTRESE</h2>
                    <hr>
                    <label for="usuario">Usuario</label><br>
                    <input class="form-control" type="text" name="txtUsuario" id="usuario" pattern="[a-zA-Z_ñá-ú0-9]{0,20}" maxlength="20" required autocomplete="off"><br>
                    <label for="clave">Clave</label><br>
                    <input class="form-control" type="password" name="txtClave" id="clave" pattern="[a-zA-Z_ñá-ú0-9]{0,20}" maxlength="20" requiredautocomplete="off"><br>
                    <button class="btn btn-primary">Registrar</button>
                    <input  type="hidden"  value="1" name="btnOpcion">
                    <input  type="hidden"  value="1" name="tipRol">
                    <input  type="hidden"  value="" name="txtCodigo"><br>
                    <hr>
                    <%
                        if (request.getAttribute("Error") != null) {%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
