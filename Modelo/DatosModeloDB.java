
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


/**
 *
 * @author Edwin Brito
 */
public class DatosModeloDB {

    Conexion conexion = new Conexion();
    Connection connection;
    Statement st;
    PreparedStatement pst;
    ResultSet rs;
    ArrayList list = new ArrayList();
    DatoSucursalPuestoTrabajo datosDB;

    public ArrayList<DatoSucursalPuestoTrabajo> getPuestosTrabajo(int idSucursal) {
        String query = "SELECT `idPuestoTrabajo`, `nombrePuestoTrabajo`, `salario`, `FK_idSucursal` FROM `puestotrabajo`INNER JOIN sucursal ON sucursal.idSucursal = puestotrabajo.FK_idSucursal WHERE sucursal.idSucursal=?;";
        System.out.println(query);

        try {
            connection = conexion.getConnection();
            pst = connection.prepareStatement(query);
            st = connection.createStatement();
            pst.setInt(1, idSucursal);
            rs = pst.executeQuery();
            while (rs.next()) {
                datosDB = new DatoSucursalPuestoTrabajo();
//                int idPuestoTrabajo = rs.getInt("idPuestoTrabajo");
//                String nombrePuestoTrabajo = rs.getString("nombrePuestoTrabajo");
//                float salario = rs.getFloat("salario");
                datosDB.setIdPuestoTrabajo(rs.getInt("idPuestoTrabajo"));
                datosDB.setNombrePuestoTrabajo(rs.getString("nombrePuestoTrabajo"));
                datosDB.setSalario(rs.getFloat("salario"));
                list.add(datosDB);
                System.out.println(list);
            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        return list;
    }

    public ArrayList<DatoSucursalPuestoTrabajo> getSucursales(int idSucursal) {
        String query = "SELECT `idSucursal`, `nombreSucursal` FROM `sucursal`;";
        try {
            connection = conexion.getConnection();
            pst = connection.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                datosDB = new DatoSucursalPuestoTrabajo();
                datosDB.setIdSucursal(rs.getInt("idSucursal"));
                datosDB.setNombreSucursal(rs.getString("nombreSucursal"));
                list.add(datosDB);
            }
        }catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

       
        
}
