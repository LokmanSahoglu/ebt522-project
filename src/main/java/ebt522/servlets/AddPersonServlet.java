package ebt522.servlets;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/addPersonServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB
    maxFileSize = 1024 * 1024 * 5,   // 5MB
    maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class AddPersonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Kişi bilgilerini al
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Fotoğraf kaydetme
        Part photoPart = request.getPart("photo");
        String photoFileName = photoPart.getSubmittedFileName();

        // uploads klasörüne dosya kaydetme
        String uploadPath = "C:\\Users\\lokman.sahoglu\\EBT522\\uploads\\";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String photoPath = uploadPath + photoFileName;
        photoPart.write(photoPath);

        // Veritabanına kayıt için relative path
        String relativePath = "uploads/" + photoFileName;

        // Veritabanına kişi kaydetme
        String url = "jdbc:postgresql://localhost:5432/ebt522";
        String user = "postgres";
        String password = "ebt522";

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String sql = "INSERT INTO persons (name, surname, email, phone, photo_path) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, name);
                stmt.setString(2, surname);
                stmt.setString(3, email);
                stmt.setString(4, phone);
                stmt.setString(5, relativePath);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Yönlendirme
        response.sendRedirect("persons.jsp");
    }
}
