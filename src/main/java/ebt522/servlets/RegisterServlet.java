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
import java.sql.SQLException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Veritabanı bağlantı bilgileri
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/ebt522";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "ebt522";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Formdan gelen verileri al
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");
        String[] hobbiesArray = request.getParameterValues("hobby");

        // Hobileri birleştir
        String hobbies = (hobbiesArray != null) ? String.join(", ", hobbiesArray) : "Belirtilmedi";

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // JDBC sürücüsünü yükle
            Class.forName("org.postgresql.Driver");

            // Veritabanına bağlan
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // SQL sorgusu
            String sql = "INSERT INTO users (name, surname, gender, city, hobbies) VALUES (?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, surname);
            preparedStatement.setString(3, gender);
            preparedStatement.setString(4, city);
            preparedStatement.setString(5, hobbies);

            // Sorguyu çalıştır
            preparedStatement.executeUpdate();

            // Kullanıcıya başarı mesajı göster
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html lang='en'>");
            out.println("<head>");
            out.println("<meta charset='UTF-8'>");
            out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
            out.println("<title>Kayıt Başarılı</title>");
            out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css' rel='stylesheet'>");
            out.println("</head>");
            out.println("<body class='bg-light'>");
            out.println("<div class='container py-5'>");
            out.println("<div class='row justify-content-center'>");
            out.println("<div class='col-md-6'>");
            out.println("<div class='card shadow'>");
            out.println("<div class='card-header bg-success text-white text-center'>");
            out.println("<h4>Kayıt Başarılı!</h4>");
            out.println("</div>");
            out.println("<div class='card-body'>");
            out.println("<p><strong>Ad:</strong> " + name + "</p>");
            out.println("<p><strong>Soyad:</strong> " + surname + "</p>");
            out.println("<p><strong>Cinsiyet:</strong> " + gender + "</p>");
            out.println("<p><strong>Şehir:</strong> " + city + "</p>");
            out.println("<p><strong>Hobiler:</strong> " + hobbies + "</p>");
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");
            out.println("<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js'></script>");
            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "JDBC sürücüsü bulunamadı!");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Veritabanı bağlantısında bir hata oluştu!");
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
