package ebt522.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CreateTopicServlet")
public class CreateTopicServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Formdan gelen verileri al
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        // Veritabanı bilgileri
        String url = "jdbc:postgresql://localhost:5432/ebt522";
        String user = "postgres";
        String password = "ebt522";

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String sql = "INSERT INTO topics (title, description, created_by) VALUES (?, ?, 'Anonymous')";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, title);
                stmt.setString(2, description);

                // Sorguyu çalıştır
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Forum sayfasına yönlendir
        response.sendRedirect("forum.jsp");
    }
}
