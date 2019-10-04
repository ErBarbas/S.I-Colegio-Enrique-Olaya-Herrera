package ModeloDAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import ModeloVO.EstudianteVO;
import Util.Conexion;
import Util.InterfaceCRUD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Util.Fecha;

public class EstudianteDAO extends Conexion implements InterfaceCRUD {

    private Connection conexion = null;
    private ResultSet resulConsulta = null;
    private CallableStatement callStat;

    private boolean operacion = false;
    private String idEst = "";
    private String nombre = "";
    private String apellido = "";
    private String identificacion = "";
    private String telefono = "";
    private String grado = "";
    private String estado = "";
    private String idAcu = "";
    private String idUsu = "";
    private String fechaGestion = "";
    private String descripcion = "";
    private String idProf = "";

    public String getIdUsu() {
        return idUsu;
    }

    public void setIdUsu(String idUsu) {
        this.idUsu = idUsu;
    }

    public EstudianteDAO() {
    }

    public EstudianteDAO(EstudianteVO estudianteVO) {

        super();

        conexion = this.obtenerConexion();
        idEst = estudianteVO.getIdEst();
        nombre = estudianteVO.getNombre();
        apellido = estudianteVO.getApellido();
        identificacion = estudianteVO.getIdentificacion();
        telefono = estudianteVO.getTelefono();
        grado = estudianteVO.getGrado();
        estado = estudianteVO.getEstado();
        idAcu = estudianteVO.getIdAcu();
        fechaGestion = estudianteVO.getFecha();
        descripcion = estudianteVO.getDescripcion();
        idProf = estudianteVO.getIdProf();

    }

    @Override
    public boolean
            crearRegistro() {
        try {
            callStat = conexion.prepareCall("CALL crear_estudiante(?,?,?,?,?);");
            callStat.setString(1, nombre);
            callStat.setString(2, apellido);
            callStat.setString(3, identificacion);
            callStat.setString(4, telefono);
            callStat.setString(5, grado);
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

    public boolean generarDetalles(String idProf, String tipoDetalle) {

        Fecha fecha;
        Conexion conexion;

        try {

            conexion = new Conexion();

            callStat = conexion.obtenerConexion().prepareCall("CALL consultar_estudiante(?);");

            callStat.setString(1, identificacion);

            resulConsulta = callStat.executeQuery();

            if (resulConsulta.next()) {

                idEst = resulConsulta.getString("id_estudiante");

            }

            callStat = conexion.obtenerConexion().prepareCall("CALL detalle_estudiante(?,?,?,?);");

            fecha = new Fecha();

            callStat.setString(1, fecha.fechaSistema());
            callStat.setString(2, idProf);
            callStat.setString(3, idEst);
            callStat.setString(4, tipoDetalle);

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

    @Override
    public boolean modificarRegistro() {
        try {
            callStat = conexion.prepareCall("CALL actualizar_estudiante(?,?,?,?,?,?,?);");

            callStat.setString(1, nombre);
            callStat.setString(2, apellido);
            callStat.setString(3, identificacion);
            callStat.setString(4, telefono);
            callStat.setString(5, grado);
            callStat.setString(6, estado);
            callStat.setString(7, idEst);

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

    public boolean enlazarEstudiante(String identificacion) {

        try {

            callStat = conexion.prepareCall("CALL consultar_acudiente(?);");

            callStat.setString(1, idAcu);

            resulConsulta = callStat.executeQuery();

            if (resulConsulta.next()) {

                idAcu = resulConsulta.getString("id_acudiente");

                callStat = conexion.prepareCall("CALL enlazar_estudiante(?,?);");

                callStat.setString(1, idAcu);
                callStat.setString(2, identificacion);

                callStat.executeUpdate();

                operacion = true;

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

        return operacion;

    }

    public boolean habilitarEstudiante(String idEst) {

        try {

            callStat = conexion.prepareCall("CALL habilitar_estudiante(?);");
            callStat.setString(1, idEst);

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

    public ArrayList< EstudianteVO> listarEstudiantes(String estado) {

        Conexion conexion;
        ArrayList< EstudianteVO> listaEstudiantes = null;
        EstudianteVO estudianteVO;

        try {

            conexion = new Conexion();
            listaEstudiantes = new ArrayList<>();

            callStat = conexion.obtenerConexion().prepareCall("CALL listar_estudiantes(?);");
            callStat.setString(1, estado);
            resulConsulta = callStat.executeQuery();

            while (resulConsulta.next()) {

                idEst = resulConsulta.getString("id_estudiante");
                nombre = resulConsulta.getString("nombre_estudiante");
                apellido = resulConsulta.getString("apellido_estudiante");
                identificacion = resulConsulta.getString("identificacion_estudiante");
                telefono = resulConsulta.getString("telefono_estudiante");
                grado = resulConsulta.getString("grado");
                idAcu = resulConsulta.getString("id_acudiente");

                estudianteVO = new EstudianteVO();
                estudianteVO.setIdEst(idEst);
                estudianteVO.setNombre(nombre);
                estudianteVO.setApellido(apellido);
                estudianteVO.setIdentificacion(identificacion);
                estudianteVO.setTelefono(telefono);
                estudianteVO.setGrado(grado);
                estudianteVO.setIdAcu(idAcu);

                listaEstudiantes.add(estudianteVO);

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

        return listaEstudiantes;

    }

    public ArrayList< EstudianteVO> listarDatosEstudiante(String idEst) {

        ArrayList< EstudianteVO> listaDatos = null;
        EstudianteVO estudianteVO;
        Conexion conexion;

        try {

            conexion = new Conexion();

            callStat = conexion.obtenerConexion().prepareCall("CALL estudiante_a_actualizar(?);");

            callStat.setString(1, idEst);

            resulConsulta = callStat.executeQuery();

            while (resulConsulta.next()) {

                idEst = resulConsulta.getString("id_estudiante");
                nombre = resulConsulta.getString("nombre_estudiante");
                apellido = resulConsulta.getString("apellido_estudiante");
                identificacion = resulConsulta.getString("identificacion_estudiante");
                telefono = resulConsulta.getString("telefono_estudiante");
                grado = resulConsulta.getString("grado");
                estado = resulConsulta.getString("estado_estudiante");

                estudianteVO = new EstudianteVO();

                estudianteVO.setIdEst(idEst);
                estudianteVO.setNombre(nombre);
                estudianteVO.setApellido(apellido);
                estudianteVO.setIdentificacion(identificacion);
                estudianteVO.setTelefono(telefono);
                estudianteVO.setGrado(grado);
                estudianteVO.setEstado(estado);

                listaDatos = new ArrayList<>();

                listaDatos.add(estudianteVO);

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

        return listaDatos;

    }

    public ArrayList< EstudianteVO> listarEstudianteEnlazado(String idUsu) {

        ArrayList<EstudianteVO> listaEstudiantes = null;
        EstudianteVO estudianteVO;
        Conexion conexion;

        try {

            listaEstudiantes = new ArrayList<>();
            conexion = new Conexion();

            callStat = conexion.obtenerConexion().prepareCall("CALL consultar_acudiente(?);");

            callStat.setString(1, idUsu);

            resulConsulta = callStat.executeQuery();

            if (resulConsulta.next()) {

                idAcu = resulConsulta.getString("id_acudiente");

                callStat = conexion.obtenerConexion().prepareCall("CALL listar_estudiantes_enlazados(?);");

                callStat.setString(1, idAcu);

                resulConsulta = callStat.executeQuery();

                while (resulConsulta.next()) {

                    idEst = resulConsulta.getString("id_estudiante");
                    nombre = resulConsulta.getString("nombre_estudiante");
                    apellido = resulConsulta.getString("apellido_estudiante");
                    identificacion = resulConsulta.getString("identificacion_estudiante");
                    telefono = resulConsulta.getString("telefono_estudiante");
                    grado = resulConsulta.getString("grado");
                    estado = resulConsulta.getString("estado_estudiante");

                    estudianteVO = new EstudianteVO();

                    estudianteVO.setIdEst(idEst);
                    estudianteVO.setNombre(nombre);
                    estudianteVO.setApellido(apellido);
                    estudianteVO.setIdentificacion(identificacion);
                    estudianteVO.setTelefono(telefono);
                    estudianteVO.setGrado(grado);
                    estudianteVO.setEstado(estado);

                    listaEstudiantes.add(estudianteVO);

                }
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

        return listaEstudiantes;

    }

    public ArrayList< EstudianteVO> listarDetallesEstudiante(String idEst) {

        ArrayList< EstudianteVO> listaDetalles = null;
        EstudianteVO estudianteVO;
        Conexion conexion;

        try {

            conexion = new Conexion();
            listaDetalles = new ArrayList<>();

            callStat = conexion.obtenerConexion().prepareCall("CALL listar_detalle_estudiante(?);");

            callStat.setString(1, idEst);

            resulConsulta = callStat.executeQuery();

            while (resulConsulta.next()) {

                nombre = resulConsulta.getString("nombre_estudiante");
                apellido = resulConsulta.getString("apellido_estudiante");
                grado = resulConsulta.getString("grado");
                fechaGestion = resulConsulta.getString("fecha_detalle_estudiante");
                descripcion = resulConsulta.getString("descripcion_detalle_estudiante");
                idProf = resulConsulta.getString("id_profesor");

                estudianteVO = new EstudianteVO();

                estudianteVO.setNombre(nombre);
                estudianteVO.setApellido(apellido);
                estudianteVO.setGrado(grado);
                estudianteVO.setFecha(fechaGestion);
                estudianteVO.setDescripcion(descripcion);
                estudianteVO.setIdProf(idProf);

                listaDetalles.add(estudianteVO);

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

        return listaDetalles;

    }

    @Override
    public boolean consultarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose

    }

}
