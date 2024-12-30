package ebt522.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/addCommentServlet")
public class AddCommentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String personId = request.getParameter("person_id");
        String comment = request.getParameter("comment");

        String url = "jdbc:postgresql://localhost:5432/ebt522";
        String user = "postgres";
        String password = "ebt522";

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String sql = "INSERT INTO comments (person_id, content, created_at) VALUES (?, ?, CURRENT_TIMESTAMP)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, Integer.parseInt(personId));
                stmt.setString(2, comment);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("personDetail.jsp?id=" + personId);
    }
}
