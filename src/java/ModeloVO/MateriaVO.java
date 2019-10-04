package ModeloVO;

public class MateriaVO {

    private String id_Materia;
    private String materia;

    public MateriaVO(String id_Materia, String materia) {
        this.id_Materia = id_Materia;
        this.materia = materia;
    }

    public MateriaVO() {
    }
    

    public String getId_Materia() {
        return id_Materia;
    }

    public void setId_Materia(String id_Materia) {
        this.id_Materia = id_Materia;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

}
