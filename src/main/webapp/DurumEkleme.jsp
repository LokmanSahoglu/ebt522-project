<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Durum Ekle</title>
</head>
<body>
    <h1>Durum Ekle</h1>
    <form action="AddStatusServlet" method="post">
        <label for="user_id">Kullanıcı:</label>
        <select id="user_id" name="user_id">
            <% 
            // Veritabanından kişileri listelemek için
            String query = "SELECT id, name FROM persons";
            try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/ebt522", "postgres", "ebt522");
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(query)) {
                while (rs.next()) {
            %>
                <option value="<%= rs.getInt("id") %>"><%= rs.getString("name") %></option>
            <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            %>
        </select><br><br>

        <label for="status_text">Durum:</label>
        <textarea id="status_text" name="status_text" required></textarea><br><br>

        <label for="location">Konum:</label>
        <input type="text" id="location" name="location"><br><br>

        <button type="submit">Gönder</button>
    </form>
</body>
</html>
