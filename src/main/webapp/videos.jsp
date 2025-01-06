<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Videolar</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header bg-primary text-white text-center">
                <h2>Videolar</h2>
            </div>
            <div class="card-body">
                <div class="mb-3 text-end">
                    <a href="uploadVideo.jsp" class="btn btn-success">Yeni Video Yükle</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="table-primary text-center">
                            <tr>
                                <th>Başlık</th>
                                <th>Açıklama</th>
                                <th>Video</th>
                                <th>Yükleyen</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String url = "jdbc:postgresql://localhost:5432/ebt522";
                                String user = "postgres";
                                String password = "ebt522";

                                try (Connection conn = DriverManager.getConnection(url, user, password)) {
                                    String query = "SELECT * FROM videos";
                                    try (Statement stmt = conn.createStatement()) {
                                        ResultSet rs = stmt.executeQuery(query);
                                        if (!rs.isBeforeFirst()) {
                            %>
                                            <tr>
                                                <td colspan="4" class="text-center text-muted">Henüz video yüklenmemiş.</td>
                                            </tr>
                            <%
                                        }
                                        while (rs.next()) {
                            %>
                            <tr class="align-middle">
                                <td><%= rs.getString("title") %></td>
                                <td><%= rs.getString("description") %></td>
                                <td class="text-center">
                                    <video class="rounded shadow" width="320" height="240" controls>
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
                            %>
                            <tr>
                                <td colspan="4" class="text-center text-danger">Veritabanı hatası: <%= e.getMessage() %></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>

