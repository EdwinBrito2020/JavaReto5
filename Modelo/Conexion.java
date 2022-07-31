
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexion {
    Connection connection;
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String user ="root";
    private String password ="";
    private String urlConexion = "jdbc:mysql://localhost:3306/reto1_g54_db";

    public Conexion() {
        //*this.connection = connection;
        try {
            Class.forName(driver);
            connection =(Connection)DriverManager.getConnection(urlConexion, user, password);
            if(connection != null) {
                System.out.println("Conexion exitosa con la Base de Datos");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error en la conexión" + e);
        }
        
    }
    
    public void finalizarConexion() {
        if (connection != null) {
            try {
                connection.close();
                connection = null;
                
            }catch (SQLException ex){
                System.out.println(ex.getMessage() + ". >>> Error de desconexion");
                    
                
            }
        }
    }
    
   
    public Connection getConnection() {
        return connection;
        
    }
    
}