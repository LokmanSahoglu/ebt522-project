<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Videolar</title>
</head>
<body>
    <h1>Videolar</h1>
    <a href="uploadVideo.jsp">Yeni Video Yükle</a><br><br>
    <table border="1">
        <tr>
            <th>Başlık</th>
            <th>Açıklama</th>
            <th>Video</th>
            <th>Yükleyen</th>
        </tr>
        <%
            String url = "jdbc:postgresql://localhost:5432/ebt522";
            String user = "postgres";
            String password = "ebt522";

            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                String query = "SELECT * FROM videos";
                try (Statement stmt = conn.createStatement()) {
                    ResultSet rs = stmt.executeQuery(query);
                    while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("description") %></td>
            <td>
                <video width="320" height="240" controls>
                    <source src="<%= rs.getString("video_path") %>" type="video/mp4">
                    Tarayıcınız bu videoyu desteklemiyor.
                </video>
            </td>
            <td><%= rs.getString("uploaded_by") %></td>
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
