package ModeloDAO;

import ModeloVO.AcudienteVO;
import Util.Conexion;
import Util.InterfaceCRUD;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AcudienteDAO extends Conexion implements InterfaceCRUD {

    private Connection conexion = null;
    private ResultSet resulConsulta = null;
    private CallableStatement callStat = null;

    private boolean operacion = false;
    private String idAcu = "";
    private String nombre = "";
    private String identificacion = "";
    private String telefono = "";

    public AcudienteDAO(AcudienteVO acudienteVO) {

        super();

        conexion = this.obtenerConexion();
        nombre = acudienteVO.getNombre();
        identificacion = acudienteVO.getIdentificacion();
        telefono = acudienteVO.getTelefono();
        idAcu = acudienteVO.getIdAcu();

    }

    public AcudienteDAO() {
    }

    public ArrayList<AcudienteVO> listarDatosAcudiente(String idAcu) {

        ArrayList<AcudienteVO> listaDatos = null;
        AcudienteVO acudienteVO;
        Conexion conexion;

        try {
            
            conexion = new Conexion();

            callStat = conexion.obtenerConexion().prepareCall("CALL consultar_acudiente(?);");

            callStat.setString(1, idAcu);

            resulConsulta = callStat.executeQuery();

            if (resulConsulta.next()) {

                idAcu = resulConsulta.getString("id_acudiente");
                nombre = resulConsulta.getString("nombre_acudiente");
                identificacion = resulConsulta.getString("identificacion_acudiente");
                telefono = resulConsulta.getString("telefono_acudiente");

                acudienteVO = new AcudienteVO();

                acudienteVO.setIdAcu(idAcu);
                acudienteVO.setNombre(nombre);
                acudienteVO.setIdentificacion(identificacion);
                acudienteVO.setTelefono(telefono);

                listaDatos = new ArrayList<>();

                listaDatos.add(acudienteVO);

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

    public ArrayList<AcudienteVO> listarDatosPerfilAcudiente(String idAcu) {

        ArrayList<AcudienteVO> listaDatos = null;
        AcudienteVO acudienteVO;

        try {

            callStat = conexion.prepareCall("{CALL consultar_perfil_acudiente(?);}");

            callStat.setString(1, idAcu);

            resulConsulta = callStat.executeQuery();

            if (resulConsulta.next()) {

                nombre = resulConsulta.getString("nombre_acudiente");
                identificacion = resulConsulta.getString("identificacion_acudiente");
                telefono = resulConsulta.getString("telefono_acudiente");

                acudienteVO = new AcudienteVO();

                acudienteVO.setNombre(nombre);
                acudienteVO.setIdentificacion(identificacion);
                acudienteVO.setTelefono(telefono);

                listaDatos = new ArrayList<>();

                listaDatos.add(acudienteVO);

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

    @Override
    public boolean modificarRegistro() {
        try {
            callStat = conexion.prepareCall("CALL actualizar_acudiente(?,?,?,?);");

            callStat.setString(1, nombre);
            callStat.setString(2, identificacion);
            callStat.setString(3, telefono);
            callStat.setString(4, idAcu);

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
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean crearRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean consultarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
