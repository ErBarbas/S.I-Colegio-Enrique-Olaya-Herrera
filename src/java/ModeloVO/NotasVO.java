package ModeloVO;

public class NotasVO extends MateriaVO {

    private String id_Nota;
    private String nombre_Nota;
    private String periodo;
    private String nota;
    private String promedio_Nota;
    private String desempeño;
    private String id_Estudiante;
    private String id_Profesor;

    public NotasVO() {
    }

    public NotasVO(String id_Nota, String nombre_Nota, String periodo, String nota, String promedio_Nota, String desempeño, String id_Estudiante, String id_Profesor, String id_Materia, String materia) {
        super(id_Materia, materia);
        this.id_Nota = id_Nota;
        this.nombre_Nota = nombre_Nota;
        this.periodo = periodo;
        this.nota = nota;
        this.promedio_Nota = promedio_Nota;
        this.desempeño = desempeño;
        this.id_Estudiante = id_Estudiante;
        this.id_Profesor = id_Profesor;
    }

    public String getId_Nota() {
        return id_Nota;
    }

    public void setId_Nota(String id_Nota) {
        this.id_Nota = id_Nota;
    }

    public String getNombre_Nota() {
        return nombre_Nota;
    }

    public void setNombre_Nota(String nombre_Nota) {
        this.nombre_Nota = nombre_Nota;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public String getNota() {
        return nota;
    }

    public void setNota(String nota) {
        this.nota = nota;
    }

    public String getPromedio_Nota() {
        return promedio_Nota;
    }

    public void setPromedio_Nota(String promedio_Nota) {
        this.promedio_Nota = promedio_Nota;
    }

    public String getDesempeño() {
        return desempeño;
    }

    public void setDesempeño(String desempeño) {
        this.desempeño = desempeño;
    }

    public String getId_Estudiante() {
        return id_Estudiante;
    }

    public void setId_Estudiante(String id_Estudiante) {
        this.id_Estudiante = id_Estudiante;
    }

    public String getId_Profesor() {
        return id_Profesor;
    }

    public void setId_Profesor(String id_Profesor) {
        this.id_Profesor = id_Profesor;
    }
}
