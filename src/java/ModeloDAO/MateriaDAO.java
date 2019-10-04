
package ModeloDAO;

import ModeloVO.MateriaVO;
import Util.Conexion;
import Util.InterfaceCRUD;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;

public class MateriaDAO extends Conexion implements InterfaceCRUD{
    
    private Connection conexion = null;
    private ResultSet resulConsulta = null;
    private CallableStatement callStat = null;
    
    private boolean operacion = false;
    private String id_Materia = "";
    private String materia = "";
    
    public MateriaDAO(MateriaVO materiaVO){
        
        conexion = this.obtenerConexion();
        id_Materia = materiaVO.getId_Materia();
        materia = materiaVO.getMateria();
        
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
    public boolean modificarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
