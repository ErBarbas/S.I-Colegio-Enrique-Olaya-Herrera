package ModeloDAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import ModeloVO.ObservadorVO;
import Util.Conexion;
import Util.InterfaceCRUD;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ObservadorDAO extends Conexion implements InterfaceCRUD {

    private Connection conexion = null;
    private ResultSet resulConsulta = null;
    private CallableStatement callStat = null;

    public boolean operacion = false;

    private String idObs = "";
    private String grado = "";
    private String descripcion = "";
    private String compromiso = "";
    private String id_estudiante = "";

    public ObservadorDAO(ObservadorVO observadorVO) {
        super();

        conexion = this.obtenerConexion();

        id_estudiante = observadorVO.getCodigoEst();
        compromiso = observadorVO.getCompromiso();
        descripcion = observadorVO.getDescripcion();
        grado = observadorVO.getGrado();
        idObs = observadorVO.getIdObs();

    }

    @Override
    public boolean crearRegistro() {
        try {
            callStat = conexion.prepareCall("CALL registrar_observador(?,?,?,?);");

            callStat.setString(1, compromiso);
            callStat.setString(2, descripcion);
            callStat.setString(3, grado);
            callStat.setString(4, id_estudiante);

            callStat.executeUpdate();

            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(EstudianteDAO.class
                    .getName()).log(Level.SEVERE, null, "Error: " + e);
        } finally {

            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return operacion;

    }

    public ArrayList<ObservadorVO> listarObservadores(String idEst) {

        ArrayList<ObservadorVO> listaDatos = null;
        ObservadorVO observadorVO;
        Conexion conexion;

        try {

            conexion = new Conexion();
            listaDatos = new ArrayList<>();

            callStat = conexion.obtenerConexion().prepareCall("CALL listar_observador(?);");
            callStat.setString(1, idEst);
            resulConsulta = callStat.executeQuery();

            while (resulConsulta.next()) {
                idObs = resulConsulta.getString("id_observador");
                grado = resulConsulta.getString("grado");
                descripcion = resulConsulta.getString("descripcion_observador");
                compromiso = resulConsulta.getString("compromiso_observador");
                id_estudiante = resulConsulta.getString("id_estudiante");

                observadorVO = new ObservadorVO();
                observadorVO.setIdObs(idObs);
                observadorVO.setGrado(grado);
                observadorVO.setDescripcion(descripcion);
                observadorVO.setCompromiso(compromiso);
                observadorVO.setCodigoEst(id_estudiante);

                listaDatos.add(observadorVO);

            }

        } catch (SQLException e) {
            Logger.getLogger(EstudianteDAO.class
                    .getName()).log(Level.SEVERE, null, "Error: " + e);
        } finally {

            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return listaDatos;

    }

    public ObservadorDAO() {
    }

    public ArrayList<ObservadorVO> listarDatosObservador(String idObs) {

        ArrayList<ObservadorVO> listaDatos = null;
        ObservadorVO observadorVO;
        Conexion conexion;

        try {
            
            conexion = new Conexion();

            callStat = conexion.obtenerConexion().prepareCall("CALL observador_a_actualizar (?);");
            callStat.setString(1, idObs);
            resulConsulta = callStat.executeQuery();

            while (resulConsulta.next()) {
                idObs = resulConsulta.getString("id_observador");
                grado = resulConsulta.getString("grado");
                descripcion = resulConsulta.getString("descripcion_observador");
                compromiso = resulConsulta.getString("compromiso_observador");
                id_estudiante = resulConsulta.getString("id_estudiante");

                observadorVO = new ObservadorVO();

                observadorVO.setIdObs(idObs);
                observadorVO.setGrado(grado);
                observadorVO.setDescripcion(descripcion);
                observadorVO.setCompromiso(compromiso);
                observadorVO.setCodigoEst(id_estudiante);

                listaDatos = new ArrayList<>();

                listaDatos.add(observadorVO);

            }

        } catch (SQLException e) {
            Logger.getLogger(EstudianteDAO.class
                    .getName()).log(Level.SEVERE, null, "Error: " + e);
        } finally {

            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return listaDatos;

    }

    @Override
    public boolean modificarRegistro() {
        try {
            callStat = conexion.prepareCall("CALL actualizar_observador(?,?,?);");

            callStat.setString(1, idObs);
            callStat.setString(2, descripcion);
            callStat.setString(3, compromiso);

            callStat.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(EstudianteDAO.class
                    .getName()).log(Level.SEVERE, null, "Error: " + e);
        } finally {

            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return operacion;

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
