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

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // HTML Formu oluştur
        out.println("<html><body>");
        out.println("<h1>Kayıt Formu</h1>");
        out.println("<form action='registerServlet' method='post'>");
        out.println("Ad: <input type='text' name='name'><br>");
        out.println("Soyad: <input type='text' name='surname'><br>");
        out.println("Cinsiyet: <select name='gender'><option value='Erkek'>Erkek</option><option value='Kadın'>Kadın</option></select><br>");
        out.println("Şehir: <input type='text' name='city'><br>");
        out.println("Hobiler: <br>");
        out.println("<input type='checkbox' name='hobbies' value='Spor'>Spor<br>");
        out.println("<input type='checkbox' name='hobbies' value='Müzik'>Müzik<br>");
        out.println("<input type='checkbox' name='hobbies' value='Kitap Okuma'>Kitap Okuma<br>");
        out.println("<input type='submit' value='Kaydet'>");
        out.println("</form>");
        out.println("</body></html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Formdan gelen verileri al
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");
        String[] hobbiesArray = request.getParameterValues("hobbies");

        // Hobileri birleştir
        String hobbies;
        if (hobbiesArray != null) {
            hobbies = String.join(",", hobbiesArray);
        } else {
            hobbies = "Belirtilmedi"; // Hobiler seçilmediyse varsayılan değer
        }

        // Veritabanı bilgileri
        String url = "jdbc:postgresql://localhost:5432/ebt522";
        String user = "postgres";
        String password = "ebt522";

        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            // PostgreSQL JDBC sürücüsünü yükle
            Class.forName("org.postgresql.Driver");

            // Veritabanı bağlantısı oluştur
            connection = DriverManager.getConnection(url, user, password);

            // SQL sorgusu
            String sql = "INSERT INTO users (name, surname, gender, city, hobbies) VALUES (?, ?, ?, ?, ?)";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, surname);
            stmt.setString(3, gender);
            stmt.setString(4, city);
            stmt.setString(5, hobbies);

            // Veriyi kaydet
            stmt.executeUpdate();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("PostgreSQL JDBC Driver bulunamadı!");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Veritabanı bağlantısında bir hata oluştu!");
        } finally {
            // Kaynakları serbest bırak
            try {
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Kullanıcıya mesaj göster
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>Kayıt Başarılı!</h1>");
        out.println("<p>Ad: " + name + "</p>");
        out.println("<p>Soyad: " + surname + "</p>");
        out.println("<p>Cinsiyet: " + gender + "</p>");
        out.println("<p>Şehir: " + city + "</p>");
        out.println("<p>Hobiler: " + hobbies + "</p>");
        out.println("</body></html>");
    }
}
