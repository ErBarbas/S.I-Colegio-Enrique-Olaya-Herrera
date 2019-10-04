package Util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Fecha {

    public java.util.Date fecha;
    public java.sql.Date fechaBD;
    public DateFormat formatoFecha;

    public Fecha(Date fecha, java.sql.Date fechaBD, DateFormat formatoFecha) {
        this.fecha = fecha;
        this.fechaBD = fechaBD;
        this.formatoFecha = formatoFecha;
    }

    public Fecha() {
    }

    public String fechaSistema() {

        fecha = new java.util.Date();
        fechaBD = new java.sql.Date(fecha.getTime());
        formatoFecha = new SimpleDateFormat("HH:mm:ss");

        String fechaHora = fechaBD + " " + formatoFecha.format(fecha);

        return fechaHora;

    }

}
