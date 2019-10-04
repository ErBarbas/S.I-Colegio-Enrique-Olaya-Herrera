package ModeloVO;

public class AcudienteVO {

    String idAcu, nombre, identificacion, telefono;

    public AcudienteVO(String id_Acu, String nombre_Acu, String identificacion_Acu, String telefono_Acu) {
        this.idAcu = id_Acu;
        this.nombre = nombre_Acu;
        this.identificacion = identificacion_Acu;
        this.telefono = telefono_Acu;
    }

    public AcudienteVO() {
    }

    public void setIdAcu(String idAcu) {
        this.idAcu = idAcu;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getIdAcu() {
        return idAcu;
    }

    public String getNombre() {
        return nombre;
    }

    public String getIdentificacion() {
        return identificacion;
    }

    public String getTelefono() {
        return telefono;
    }

}
