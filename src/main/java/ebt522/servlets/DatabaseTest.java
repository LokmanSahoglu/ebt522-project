package ebt522.servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseTest {
    public static void main(String[] args) {
        // PostgreSQL bağlantı bilgileri
        String url = "jdbc:postgresql://localhost:5432/ebt522";
        String user = "postgres";
        String password = "ebt522";

        // Bağlantıyı test et
        try (Connection connection = DriverManager.getConnection(url, user, password)) {
            if (connection != null) {
                System.out.println("Bağlantı başarılı!");
            } else {
                System.out.println("Bağlantı başarısız!");
            }
        } catch (SQLException e) {
            System.out.println("Bağlantı sırasında bir hata oluştu:");
            e.printStackTrace();
        }
    }
}

