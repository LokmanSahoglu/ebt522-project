package ebt522.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddStatusServlet")
public class AddStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Formdan gelen verileri alın
        String person = request.getParameter("person");
        String location = request.getParameter("location");
        String activity = request.getParameter("activity");

        // Burada verileri veritabanına kaydetme işlemi yapılabilir
        System.out.println("Person: " + person);
        System.out.println("Location: " + location);
        System.out.println("Activity: " + activity);

        // Ana sayfaya yönlendirme
        response.sendRedirect("index.jsp");
    }
}


