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

@WebServlet("/CreateCommentServlet")
public class CreateCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int topicId = Integer.parseInt(request.getParameter("topicId"));
        String comment = request.getParameter("comment");

        try {
            Class.forName("org.postgresql.Driver"); // PostgreSQL JDBC sürücüsünü yükle
            try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/ebt522", "postgres", "ebt522");
                 PreparedStatement stmt = conn.prepareStatement("INSERT INTO comments (topic_id, comment, commented_by) VALUES (?, ?, 'Anonymous')")) {
                stmt.setInt(1, topicId);
                stmt.setString(2, comment);
                stmt.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("PostgreSQL JDBC sürücüsü bulunamadı!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("viewTopic.jsp?id=" + topicId);
    }
}

