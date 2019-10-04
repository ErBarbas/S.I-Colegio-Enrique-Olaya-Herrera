package ModeloDAO;

import ModeloVO.NotasVO;
import Util.Conexion;
import Util.InterfaceCRUD;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class NotasDAO extends Conexion implements InterfaceCRUD {

    private Connection conexion = null;
    private ResultSet resulConsulta = null;
    private CallableStatement callStat;

    private boolean operacion = false;
    private String id_Nota = "";
    private String nombre = "";
    private String periodo = "";
    private String nota = "";
    private String promedio = "";
    private String desempeño = "";
    private String id_Estudiante = "";
    private String id_Profesor = "";
    private String id_Materia = "";
    private String materia = "";

    public NotasDAO() {
    }

    public NotasDAO(NotasVO notasVO) {
        conexion = this.obtenerConexion();
        id_Nota = notasVO.getId_Nota();
        nombre = notasVO.getNombre_Nota();
        periodo = notasVO.getPeriodo();
        nota = notasVO.getNota();
        promedio = notasVO.getPromedio_Nota();
        desempeño = notasVO.getDesempeño();
        id_Estudiante = notasVO.getId_Estudiante();
        id_Profesor = notasVO.getId_Profesor();
        id_Materia = notasVO.getId_Materia();
        materia = notasVO.getMateria();
    }

    @Override
    public boolean crearRegistro() {
        try {

            callStat = conexion.prepareCall("call registrar_nota(?,?,?,?,?,?)");

            callStat.setString(1, nombre);
            callStat.setString(2, periodo);
            callStat.setString(3, nota);
            callStat.setString(4, id_Estudiante);
            callStat.setString(5, id_Profesor);
            callStat.setString(6, id_Materia);

            callStat.executeUpdate();

            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(EstudianteDAO.class
                    .getName()).log(Level.SEVERE, null, "Error: " + e);
        } finally {

            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return operacion;

    }

    public boolean registrarNotaFinal() {

        try {
            callStat = conexion.prepareCall("call insertar_nota_final(?,?,?)");

            callStat.setString(1, id_Estudiante);
            callStat.setString(2, id_Materia);
            callStat.setString(3, id_Profesor);

            callStat.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(EstudianteDAO.class
                    .getName()).log(Level.SEVERE, null, "Error: " + e);
        } finally {

            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return operacion;

    }

    public ArrayList<NotasVO> listarNotas(String id_Est, String id_Mat) {

        Conexion conexion;
        ArrayList<NotasVO> listaNota = null;
        NotasVO notasVO;

        try {

            conexion = new Conexion();
            listaNota = new ArrayList<>();

            callStat = conexion.obtenerConexion().prepareCall("CALL listar_notas(?,?);");
            callStat.setString(1, id_Est);
            callStat.setString(2, id_Mat);

            resulConsulta = callStat.executeQuery();

            while (resulConsulta.next()) {

                id_Nota = resulConsulta.getString("id_nota");
                nombre = resulConsulta.getString("nombre_nota");
                periodo = resulConsulta.getString("periodo_nota");
                nota = resulConsulta.getString("nota");
                id_Estudiante = resulConsulta.getString("id_estudiante");
                id_Profesor = resulConsulta.getString("id_profesor");
                id_Materia = resulConsulta.getString("id_materia");

                notasVO = new NotasVO();
                notasVO.setId_Nota(id_Nota);
                notasVO.setNombre_Nota(nombre);
                notasVO.setPeriodo(periodo);
                notasVO.setNota(nota);
                notasVO.setId_Estudiante(id_Estudiante);
                notasVO.setId_Profesor(id_Profesor);
                notasVO.setId_Materia(id_Materia);

                listaNota.add(notasVO);

            }
        } catch (SQLException e) {

            Logger.getLogger(EstudianteDAO.class
                    .getName()).log(Level.SEVERE, null, "Error: " + e);

        } finally {

            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return listaNota;

    }

    @Override
    public boolean modificarRegistro() {
        try {

            callStat = conexion.prepareCall("CALL actualizar_nota(?,?,?,?,?,?);");

            callStat.setString(1, nombre);
            callStat.setString(2, periodo);
            callStat.setString(3, nota);
            callStat.setString(4, id_Estudiante);
            callStat.setString(5, id_Materia);
            callStat.setString(6, id_Nota);

            callStat.executeUpdate();

            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(EstudianteDAO.class
                    .getName()).log(Level.SEVERE, null, "Error: " + e);
        } finally {

            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return operacion;

    }
    
    public ArrayList<NotasVO> listarMaterias(String idEst){
    
        ArrayList<NotasVO> listarDatos = null;
        Conexion conexion;
        NotasVO notasVO;
        
        try {
            conexion = new Conexion();
            callStat = conexion.obtenerConexion().prepareCall("CALL mostrar_materias(?);");
            callStat.setString(1, idEst);
            
            resulConsulta = callStat.executeQuery();
            
            listarDatos = new ArrayList<>();
            
            while(resulConsulta.next()) {
                
                id_Materia = resulConsulta.getString("id_materia");
                materia = resulConsulta.getString("materia");
                
                notasVO = new NotasVO();
                
                notasVO.setId_Materia(id_Materia);
                notasVO.setMateria(materia);
                
                listarDatos.add(notasVO);
                
            }
            
        } catch (SQLException e) {
            Logger.getLogger(EstudianteDAO.class
                    .getName()).log(Level.SEVERE, null, "Error: " + e);
        } finally {

            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return listarDatos;

    }

    @Override
    public boolean consultarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
