/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

public class ProfesorVO {
    
    private String idProf, nombre, identificacion, telefono;

    public ProfesorVO(String idProf, String nombreProf, String identifiProf, String telefProf) {
        this.idProf = idProf;
        this.nombre = nombreProf;
        this.identificacion = identifiProf;
        this.telefono = telefProf;
    }

    public ProfesorVO() {
    }

    public String getIdProf() {
        return idProf;
    }

    public void setIdProf(String idProf) {
        this.idProf = idProf;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}
