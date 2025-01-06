<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kişiler</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container py-5">
        <h1 class="text-center mb-4">Kişiler</h1>

        <!-- Kişi Tablosu -->
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">Kişi Listesi</h5>
            </div>
            <table class="table table-striped mb-0">
                <thead class="table-light">
                    <tr>
                        <th>Thumbnail</th>
                        <th>ID</th>
                        <th>Ad</th>
                        <th>Soyad</th>
                        <th>Detay</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;

                        try {
                            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/ebt522", "postgres", "ebt522");
                            stmt = conn.prepareStatement("SELECT id, name, surname, thumbnail FROM persons");
                            rs = stmt.executeQuery();

                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String name = rs.getString("name");
                                String surname = rs.getString("surname");
                                String thumbnail = rs.getString("thumbnail");
                    %>
                    <tr>
                        <td><img src="<%= thumbnail %>" alt="Thumbnail" class="img-thumbnail" style="width: 50px; height: 50px;"></td>
                        <td><%= id %></td>
                        <td><%= name %></td>
                        <td><%= surname %></td>
                        <td><a href="personDetail.jsp?id=<%= id %>" class="btn btn-sm btn-primary">Detay</a></td>
                    </tr>
                    <%
                            }
                        } catch (SQLException e) {
                            out.println("<tr><td colspan='5' class='text-danger'>Veritabanı hatası: " + e.getMessage() + "</td></tr>");
                            e.printStackTrace();
                        } finally {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
