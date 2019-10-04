package ModeloDAO;

import ModeloVO.ProfesorVO;
import Util.Conexion;
import Util.InterfaceCRUD;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProfesorDAO extends Conexion implements InterfaceCRUD {

    private Connection conexion = null;
    private ResultSet resulConsulta = null;
    private CallableStatement callStat = null;

    private boolean operacion = false;
    private String idProf = "";
    private String nombre = "";
    private String identificacion = "";
    private String telefono = "";

    public String getIdProf() {
        return idProf;
    }

    public void setIdProf(String idProf) {
        this.idProf = idProf;
    }

    public ProfesorDAO(ProfesorVO profesorVO) {

        super();

        conexion = this.obtenerConexion();
        idProf = profesorVO.getIdProf();
        nombre = profesorVO.getNombre();
        identificacion = profesorVO.getIdentificacion();
        telefono = profesorVO.getTelefono();

    }

    public ProfesorDAO() {
    }

    public ArrayList<ProfesorVO> listarDatosProfesor(String idProf) {

        ArrayList<ProfesorVO> listaDatos = null;
        ProfesorVO profesorVO;
        Conexion conexion = new Conexion();

        try {

            callStat = conexion.obtenerConexion().prepareCall("CALL listar_datos_profesor(?);");
            callStat.setString(1, idProf);

            resulConsulta = callStat.executeQuery();

            if (resulConsulta.next()) {

                this.idProf = resulConsulta.getString("id_profesor");
                nombre = resulConsulta.getString("nombre_profesor");
                identificacion = resulConsulta.getString("identificacion_profesor");
                telefono = resulConsulta.getString("telefono_profesor");

                profesorVO = new ProfesorVO();

                profesorVO.setIdProf(this.idProf);
                profesorVO.setNombre(nombre);
                profesorVO.setIdentificacion(identificacion);
                profesorVO.setTelefono(telefono);

                listaDatos = new ArrayList<>();

                listaDatos.add(profesorVO);

            }

        } catch (SQLException e) {

            Logger.getLogger(AcudienteDAO.class
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

    public ArrayList<ProfesorVO> listarDatosPerfilProfesor(String idProf) {

        ArrayList<ProfesorVO> listaDatos = null;
        ProfesorVO profesorVO;
        Conexion conexion;

        try {

            conexion = new Conexion();

            callStat = conexion.obtenerConexion().prepareCall("CALL consultar_perfil_profesor(?);");
            callStat.setString(1, idProf);

            resulConsulta = callStat.executeQuery();

            if (resulConsulta.next()) {

                nombre = resulConsulta.getString("nombre_profesor");
                identificacion = resulConsulta.getString("identificacion_profesor");
                telefono = resulConsulta.getString("telefono_profesor");

                profesorVO = new ProfesorVO();

                profesorVO.setNombre(nombre);
                profesorVO.setIdentificacion(identificacion);
                profesorVO.setTelefono(telefono);

                listaDatos = new ArrayList<>();

                listaDatos.add(profesorVO);

                this.cerrarConexion();

            }

        } catch (SQLException e) {

            Logger.getLogger(AcudienteDAO.class
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

    public String traerIdProfesor(String idUsu) {

        Conexion conexion;

        try {

            conexion = new Conexion();

            callStat = conexion.obtenerConexion().prepareCall("CALL traer_id_profesor(?);");
            callStat.setString(1, idUsu);

            resulConsulta = callStat.executeQuery();

            if (resulConsulta.next()) {

                idProf = resulConsulta.getString("id_profesor");

            }

        } catch (SQLException e) {

            Logger.getLogger(AcudienteDAO.class
                    .getName()).log(Level.SEVERE, null, "Error: " + e);

        } finally {

            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return idProf;

    }

    @Override
    public boolean modificarRegistro() {

        try {

            callStat = conexion.prepareCall("CALL actualizar_profesor(?,?,?,?)");
            callStat.setString(1, nombre);
            callStat.setString(2, identificacion);
            callStat.setString(3, telefono);
            callStat.setString(4, idProf);

            callStat.executeUpdate();

            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(AcudienteDAO.class
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
    public boolean crearRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
