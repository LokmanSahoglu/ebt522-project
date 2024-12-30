<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Kişi Detayları</title>
</head>
<body>
<h1>Kişi Detayları</h1>
<%
        String id = request.getParameter("id");

        // Veritabanı bağlantısı
        String url = "jdbc:postgresql://localhost:5432/ebt522";
        String user = "postgres";
        String password = "ebt522";

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String query = "SELECT * FROM persons WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setInt(1, Integer.parseInt(id));
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        String name = rs.getString("name");
                        String surname = rs.getString("surname");
                        String email = rs.getString("email");
                        String phone = rs.getString("phone");

    %>
<p><strong>Ad:</strong> <%= name %></p>
<p><strong>Soyad:</strong> <%= surname %></p>
<p><strong>Email:</strong> <%= email %></p>
<p><strong>Telefon:</strong> <%= phone %></p>
<a href="editPerson.jsp?id=<%= id %>">Düzenle</a>
<%
                    } else {
    %>
<p>Kişi bulunamadı.</p>
<%
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
<a href="persons.jsp">Geri Dön</a>
</body>
</html>
