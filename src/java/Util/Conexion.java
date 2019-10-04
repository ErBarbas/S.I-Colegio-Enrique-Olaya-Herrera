package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    //Establezco las variables para poder conectarme a mi base de datos.
    private final String URL_BD, DRIVER, NOMBRE_BD, PASSWORD_BD, USER_BD;
    Connection conexion;

    public Conexion() {

        //Establezco el contenido de cada variable para la conexion
        DRIVER = "com.mysql.jdbc.Driver";
        NOMBRE_BD = "colegio_eoh";
        USER_BD = "root";
        PASSWORD_BD = "";
        URL_BD = "jdbc:mysql://localhost:3306/" + NOMBRE_BD;

        //Utilizo una estructura try-catch para poder tener un mejor manejo de los errores por si ocurren problemas
        try {

            //utilizo la clase Class con el metodo forName para cargar el driver y instanciarlo
            Class.forName(DRIVER).newInstance();
            conexion = DriverManager.getConnection(URL_BD, USER_BD, PASSWORD_BD);

            System.out.println("Conexion OK");

        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e) {

            System.out.println("Error al conectar con la base de datos: --> " + e);

        }

    }

    public Connection obtenerConexion() {

        return conexion;

    }

    public Connection cerrarConexion() throws SQLException {

        conexion.close();
        conexion = null;

        return conexion;

    }

    public static void main(String[] args) {

        Conexion conexion1 = new Conexion();

    }

}

