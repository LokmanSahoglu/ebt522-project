<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Durumlar</title>
</head>
<body>
    <h1>Kim, Nerede, Ne Yapıyor?</h1>
    <table border="1">
        <tr>
            <th>Kullanıcı</th>
            <th>Durum</th>
            <th>Konum</th>
            <th>Tarih</th>
        </tr>
        <%
            String query = "SELECT p.name, s.status_text, s.location, s.created_at FROM statuses s JOIN persons p ON s.user_id = p.id ORDER BY s.created_at DESC";
            try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/ebt522", "postgres", "ebt522");
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(query)) {
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("status_text") %></td>
            <td><%= rs.getString("location") %></td>
            <td><%= rs.getTimestamp("created_at") %></td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
