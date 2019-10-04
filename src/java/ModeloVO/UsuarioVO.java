package ModeloVO;

public class UsuarioVO {

    private String nombre, clave, rolAsignado, estadoAsignado, codigo;

    public UsuarioVO() {
    }

    public UsuarioVO(String nomUsu, String claveUsu, String asigRol, String asigEstado, String codigo) {
        this.nombre = nomUsu;
        this.clave = claveUsu;
        this.rolAsignado = asigRol;
        this.estadoAsignado = asigEstado;
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getRolAsignado() {
        return rolAsignado;
    }

    public void setRolAsignado(String rolAsignado) {
        this.rolAsignado = rolAsignado;
    }

    public String getEstadoAsignado() {
        return estadoAsignado;
    }

    public void setEstadoAsignado(String estadoAsignado) {
        this.estadoAsignado = estadoAsignado;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

 

}
