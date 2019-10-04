<%-- 
   Document   : Pagina_Prueba
   Created on : 17-ago-2019, 2:36:04
   Author     : Windows 10
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="CSS/validacion.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="jumbotron text-center">
            <h1 class="text-warning">Habilitar Cuenta</h1>
        </div>
        <h4 class="text-center">Bienvenido a la seccion para habilitar tu cuenta. </h4>
        <br>
        <h6 class="list-group-item text-info text-center">Por favor necesitamos que ingreses tu Usuario y Clave de Seguridad (Contraseña).</h6>
        <br>
        <form class="text-center" action="SValidsUsu" method="post">
            <label for="usuario">Usuario</label><br>
            <input class="form-control" type="text" name="txtUsuario" id="usuario" pattern="[a-zA-Z_ñá-ú0-9]{0,20}" maxlength="20" required autocomplete="off"><br>
            <label for="clave">Clave</label><br>
            <input class="form-control" type="password" name="txtClave" id="clave" pattern="[a-zA-Z_ñá-ú0-9]{0,20}" maxlength="20" required autocomplete="off"><br>
            <button class="btn btn-primary">Habilitar Cuenta</button>
            <input type="hidden" value="4" name="btnOpcion">
            <input type="hidden" value="1" name="opcCambiar">
            <hr>
            <%
                if (request.getAttribute("Error") != null) {%>
            ${Error}
            <%} else {%>
            ${Exito}
            <%}%><br>
        </form>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
