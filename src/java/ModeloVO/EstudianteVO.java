package ModeloVO;

public class EstudianteVO extends DetalleEstudiante {

    String idEst, nombre, apellido, identificacion, grado, telefono, estado, idAcu;

    public EstudianteVO() {
    }

    public EstudianteVO(String idEst, String nombre, String apellido, String identificacion, String grado, String telefono, String estado, String idAcu) {
        this.idEst = idEst;
        this.nombre = nombre;
        this.apellido = apellido;
        this.identificacion = identificacion;
        this.grado = grado;
        this.telefono = telefono;
        this.estado = estado;
        this.idAcu = idAcu;
    }

    public String getIdEst() {
        return idEst;
    }

    public void setIdEst(String idEst) {
        this.idEst = idEst;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getIdAcu() {
        return idAcu;
    }

    public void setIdAcu(String idAcu) {
        this.idAcu = idAcu;
    }

}
