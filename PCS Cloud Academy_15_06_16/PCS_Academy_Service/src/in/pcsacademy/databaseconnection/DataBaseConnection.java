package in.pcsacademy.databaseconnection;

import in.pcsacademy.exception.PCSAcademyServiceException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class DataBaseConnection {

    private static ResourceBundle resourceBundle = ResourceBundle.getBundle("in.pcsacademy.properties.DataBaseConnectionProperties");
    private static Connection con = null;

    public static Connection dbConnection() {
        try {
            Class.forName(resourceBundle.getString("DRIVER_CLASS"));
            con = DriverManager.getConnection(resourceBundle.getString("DRIVER_URL"));
            System.out.println("Connected");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }

    public static void main(String[] args) throws PCSAcademyServiceException {
        Connection con2 = DataBaseConnection.dbConnection();
        if (con2 == null) {
            throw new PCSAcademyServiceException("Database Connection Failure code 1: ", "Database Connection Failed..");
        }
    }
}
