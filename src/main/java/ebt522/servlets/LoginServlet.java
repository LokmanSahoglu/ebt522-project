package ebt522.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Kullanıcıdan gelen verileri al
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Veritabanı bilgileri
        String url = "jdbc:postgresql://localhost:5432/ebt522";
        String user = "postgres";
        String dbPassword = "ebt522";

        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet resultSet = null;

        boolean loginSuccessful = false;

        try {
            // PostgreSQL JDBC sürücüsünü yükle
            Class.forName("org.postgresql.Driver");

            // Veritabanı bağlantısı oluştur
            connection = DriverManager.getConnection(url, user, dbPassword);

            // Kullanıcı bilgilerini kontrol et
            String sql = "SELECT * FROM users WHERE name = ? AND surname = ?";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            resultSet = stmt.executeQuery();
            if (resultSet.next()) {
                loginSuccessful = true;
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Giriş sonucunu göster
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        if (loginSuccessful) {
            out.println("<h1>Giriş Başarılı!</h1>");
        } else {
            out.println("<h1>Giriş Başarısız!</h1>");
            out.println("<p>Lütfen bilgilerinizi kontrol edin.</p>");
        }
        out.println("</body></html>");
    }
}
