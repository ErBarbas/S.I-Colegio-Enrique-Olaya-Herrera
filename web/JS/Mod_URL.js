$(document).ready(function () {

    var telefono = $('#telefono');
    var telefonoWsp = $('#telefonoWsp');

    if (telefonoWsp.val() == 0) {

        telefonoWsp.attr("value", "");

    }else if (telefonoWsp.val() != 0) {
        
        telefonoWsp.attr("readonly", "true");
        
    }


    if (telefono.val() == 0) {

        telefono.attr("value", "");

    }

    var rol = $("#usuRol").val();
    var url1 = $('#url1');
    var url2 = $('#url2');
    if (rol === "Acudiente") {

        $('.oProf').remove();
        url1.attr("href", "Estudiantes_Enlazados.jsp");
        url1.text("Informacion de mi Estudiante");
        url2.attr("href", "Vincular_Estudiante.jsp");
        url2.text("Enlazar un nuevo Estudiante");
    }

    if (rol === "Profesor") {
        $('#lkProf').css("display", "inline");
        $("#linkM").attr("href", "Menu_Profesor.jsp");
        $("#logoUsu").attr("class", "fas fa-user-tie text-primary pl-4 fs");
        url1.attr("href", "consultar_Estudiante.jsp");
        url1.text("Gestionar Estudiantes");
        url2.attr("href", "registrar_Estudiante.jsp");
        url2.text("Crear Estudiante");
    }

});



