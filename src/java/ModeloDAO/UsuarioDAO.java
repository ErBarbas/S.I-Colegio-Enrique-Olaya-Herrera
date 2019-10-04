package ModeloDAO;

import ModeloVO.UsuarioVO;
import Util.Conexion;
import Util.InterfaceCRUD;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UsuarioDAO extends Conexion implements InterfaceCRUD {

    private Connection conexion = null;
    private ResultSet resulConsulta = null;
    private CallableStatement callStat = null;

    public boolean operacion = false;

    private String nombre = "";
    private String nombreComparar = "";
    private String claveComparar = "";
    private String clave = "";
    private String rol = "";
    private String estado = "";
    private String codigo = "";
    private String idUsu = "";

    public String getNombreComparar() {
        return nombreComparar;
    }

    public void setNombreComparar(String nombreComparar) {
        this.nombreComparar = nombreComparar;
    }

    public String getClaveComparar() {
        return claveComparar;
    }

    public void setClaveComparar(String claveComparar) {
        this.claveComparar = claveComparar;
    }

    public String getIdUsu() {
        return idUsu;
    }

    public void setIdUsu(String idUsu) {
        this.idUsu = idUsu;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public UsuarioDAO() {
    }

    public UsuarioDAO(UsuarioVO usuarioVO) {

        super();

        conexion = this.obtenerConexion();
        nombre = usuarioVO.getNombre();
        clave = usuarioVO.getClave();
        estado = usuarioVO.getEstadoAsignado();
        codigo = usuarioVO.getCodigo();

    }

    @Override
    public boolean consultarRegistro() {

        try {

            callStat = conexion.prepareCall("CALL consultar_usuario(?,?);");

            callStat.setString(1, nombre);
            callStat.setString(2, clave);

            resulConsulta = callStat.executeQuery();

            if (resulConsulta.next()) {

                idUsu = resulConsulta.getString("id_usuario");
                nombreComparar = resulConsulta.getString("usuario");
                claveComparar = resulConsulta.getString("clave");
                estado = resulConsulta.getString("estado_usuario");
                rol = resulConsulta.getString("rol");

                if (nombreComparar.equals(nombre) && claveComparar.equals(clave)) {

                    operacion = true;

                }

            }

        } catch (SQLException e) {

            Logger.getLogger(UsuarioDAO.class
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

    public boolean validacionCambioDatosAcceso(String newNombre, String nombre, String newClave, String clave, String opcion) {

        try {

            callStat = conexion.prepareCall("CALL validar_datos_usuario(?,?);");

            callStat.setString(1, nombre);
            callStat.setString(2, clave);

            resulConsulta = callStat.executeQuery();

            if (resulConsulta.next()) {

                nombreComparar = resulConsulta.getString("usuario");
                claveComparar = resulConsulta.getString("clave");

                if (opcion.equals("1") && this.nombre.equals(nombreComparar) && this.clave.equals(claveComparar)) {

                    callStat = conexion.prepareCall("CALL actualizar_usuario(?,?,?);");

                    callStat.setString(1, nombre);
                    callStat.setString(2, clave);
                    callStat.setString(3, newNombre);

                    callStat.executeUpdate();

                    operacion = true;

                } else if (opcion.equals("2") && this.nombre.equals(nombreComparar) && this.clave.equals(claveComparar)) {

                    callStat = conexion.prepareCall("CALL actualizar_clave(?,?,?);");

                    callStat.setString(1, nombre);
                    callStat.setString(2, clave);
                    callStat.setString(3, newClave);

                    callStat.executeUpdate();

                    operacion = true;

                }
            }

        } catch (SQLException e) {

            Logger.getLogger(UsuarioDAO.class
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

        try {

            callStat = conexion.prepareCall("CALL registrar_usuario (?,?,?);");

            callStat.setString(1, nombre);
            callStat.setString(2, clave);
            callStat.setString(3, codigo);

            callStat.executeUpdate();

            operacion = true;

        } catch (SQLException e) {

            Logger.getLogger(UsuarioDAO.class
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

    public boolean habilitarDeshabilitarCuenta(String nombre, String clave, String opcion) {

        try {

            callStat = conexion.prepareCall("CALL validar_datos_usuario(?,?);");

            callStat.setString(1, nombre);
            callStat.setString(2, clave);

            resulConsulta = callStat.executeQuery();

            if (resulConsulta.next()) {

                nombreComparar = resulConsulta.getString("usuario");
                claveComparar = resulConsulta.getString("clave");

                if (opcion.equals("2") && this.nombre.equals(nombreComparar) && this.clave.equals(claveComparar)) {

                    callStat = conexion.prepareCall("CALL inhabilitar_usuario(?,?);");

                    callStat.setString(1, nombre);
                    callStat.setString(2, clave);

                    callStat.executeUpdate();

                    operacion = true;

                } else if (opcion.equals("1") && this.nombre.equals(nombreComparar) && this.clave.equals(claveComparar)) {

                    callStat = conexion.prepareCall("CALL habilitar_usuario(?,?);");

                    callStat.setString(1, nombre);
                    callStat.setString(2, clave);

                    callStat.executeUpdate();

                    operacion = true;

                }

            }

        } catch (SQLException e) {

            Logger.getLogger(UsuarioDAO.class
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
    public boolean modificarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
