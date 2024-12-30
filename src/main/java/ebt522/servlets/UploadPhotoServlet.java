package ebt522.servlets;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/UploadPhotoServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class UploadPhotoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Upload dizinini al
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Form verilerini al
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String fileName = null;

        // Yüklenen dosyaları işle
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            String filePartName = part.getSubmittedFileName();
            if (filePartName != null && !filePartName.isEmpty()) {
                fileName = filePartName;
                part.write(uploadPath + File.separator + fileName);
            }
        }

        // Yüklenen dosyanın yolu
        String imagePath = UPLOAD_DIR + "/" + fileName;

        // Veritabanına kaydet
        String url = "jdbc:postgresql://localhost:5432/ebt522";
        String user = "postgres";
        String password = "ebt522";

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String sql = "INSERT INTO photos (title, description, image_path, uploaded_by) VALUES (?, ?, ?, 'Anonymous')";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, title);
                stmt.setString(2, description);
                stmt.setString(3, imagePath);

                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Fotoğraflar sayfasına yönlendir
        response.sendRedirect("photos.jsp");
    }
}
