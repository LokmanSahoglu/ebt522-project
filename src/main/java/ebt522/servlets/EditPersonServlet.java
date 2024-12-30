package ebt522.servlets;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/EditPersonServlet")
public class EditPersonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");

        // ID parametresi boş veya null ise hatayı engelle
        if (idParam == null || idParam.isEmpty()) {
            response.getWriter().println("Geçersiz ID değeri");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            // Veritabanı bağlantısı
            String url = "jdbc:postgresql://localhost:5432/ebt522";
            String user = "postgres";
            String password = "ebt522";

            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                String query = "UPDATE persons SET name = ?, surname = ?, email = ?, phone = ? WHERE id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setString(1, name);
                    stmt.setString(2, surname);
                    stmt.setString(3, email);
                    stmt.setString(4, phone);
                    stmt.setInt(5, id);

                    stmt.executeUpdate();
                }
            }

            response.sendRedirect("persons.jsp");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().println("Geçersiz ID formatı: " + idParam);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Veritabanı hatası meydana geldi.");
        }
    }
}

