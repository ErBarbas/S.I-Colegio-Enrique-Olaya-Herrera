package ModeloVO;

public class ObservadorVO {

    private String grado, descripcion, compromiso, codigoEst, idObs;

    public ObservadorVO() {
    }

    public ObservadorVO(String grado, String descripcion, String compromiso, String codigoEst, String idObs) {
        this.grado = grado;
        this.descripcion = descripcion;
        this.compromiso = compromiso;
        this.codigoEst = codigoEst;
        this.idObs = idObs;
    }

    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCompromiso() {
        return compromiso;
    }

    public void setCompromiso(String compromiso) {
        this.compromiso = compromiso;
    }

    public String getCodigoEst() {
        return codigoEst;
    }

    public void setCodigoEst(String codigoEst) {
        this.codigoEst = codigoEst;
    }

    public String getIdObs() {
        return idObs;
    }

    public void setIdObs(String idObs) {
        this.idObs = idObs;
    }

}
