package ModeloVO;

public class DetalleEstudiante {

    String fecha, descripcion, idProf;

    public DetalleEstudiante(String fechaGestion, String descripcion, String idProf) {
        this.fecha = fechaGestion;
        this.descripcion = descripcion;
        this.idProf = idProf;
    }

    public DetalleEstudiante() {
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getIdProf() {
        return idProf;
    }

    public void setIdProf(String idProf) {
        this.idProf = idProf;
    }

}
