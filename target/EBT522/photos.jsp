<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Fotoğraflar</title>
</head>
<body>
    <h1>Fotoğraflar</h1>
    <a href="uploadPhoto.jsp">Yeni Fotoğraf Yükle</a><br><br>
    <table border="1">
        <tr>
            <th>Başlık</th>
            <th>Açıklama</th>
            <th>Fotoğraf</th>
            <th>Yükleyen</th>
            <th>İşlem</th>
        </tr>
        <%
            String url = "jdbc:postgresql://localhost:5432/ebt522";
            String user = "postgres";
            String password = "ebt522";

            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                String query = "SELECT * FROM photos";
                try (Statement stmt = conn.createStatement()) {
                    ResultSet rs = stmt.executeQuery(query);
                    while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("description") %></td>
            <td><img src="<%= rs.getString("image_path") %>" alt="<%= rs.getString("title") %>" width="100"></td>
            <td><%= rs.getString("uploaded_by") %></td>
            <td>
                <form action="DeletePhotoServlet" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                    <button type="submit">Sil</button>
                </form>
            </td>
        </tr>
        <%
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>

