<%-- 
   Document   : Java_mail
   Created on : 10-ago-2019, 14:58:00
   Author     : Windows 10
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>JSP Page</title>
        <link href="CSS/validacion.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <h1 class="text-center text-primary">Solicitar codigo de registro (Profesor)</h1>
        <hr>
        <div class="container">
            <p>Pasos para solicitar su Codigo de Validacion:</p>
            <ul class="list-group">
                <li class="list-group-item">1. Diligencie el cuerpo del mensaje incluyendo su nombre e identificacion asi como informacion de contacto adicional
                    (Telefono, Direccion u otro correo electronico).
                </li>
                <li class="list-group-item">2. De click en enviar. Revisaremos su informacion y le proporcionaremos el codigo.</li>
            </ul>
            <h6 class="my-3 mb-4 text-danger">Cualquier correo electronico enviado con un formato incorrecto no sera atendido.</h6>
        </div>
        <div class="container text-center">
            <div class="card py-3 pl-4 pr-4 m-auto border border-primary" style="width: 77%">
                <form method="post" action="RecogidaCorreoS">
                    <div class="form-group">
                        <label for="destino">Destino</label>
                        <input class="form-control" type="email" name="destino" maxlength="40" id="destino" value="camilocomservices@gmail.com" readonly>
                        <label for="suCorreo">Ingrese su correo</label>
                        <input class="form-control" type="email" name="suCorreo" maxlength="40" required id="suCorreo" autocomplete="off">
                        <label for="mensaje">Mensaje</label>
                        <textarea class="form-control" name="mensaje" required id="mensaje"></textarea>
                        <br><input class="btn btn-primary" type="submit" name="" value="Enviar" >
                        <hr>
                        <%if (request.getAttribute("MensajeResultado") != null) {%>
                        ${MensajeResultado}        
                        <%
                            }
                        %>
                    </div>
            </div>
        </div>
    </form><br>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
