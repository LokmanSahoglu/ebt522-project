<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forum</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container py-5">
        <h1 class="text-center mb-4">Forum</h1>
        <div class="text-end mb-3">
            <a href="createTopic.jsp" class="btn btn-primary">Yeni Başlık Oluştur</a>
        </div>

        <!-- Forum Başlıkları -->
        <div class="card shadow-sm mb-4">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">Başlıklar</h5>
            </div>
            <ul class="list-group list-group-flush">
                <%
                    int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                    int itemsPerPage = 10;
                    int offset = (currentPage - 1) * itemsPerPage;

                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/ebt522", "postgres", "ebt522");

                        // Başlıkları çekme
                        stmt = conn.prepareStatement("SELECT id, title, created_at FROM topics ORDER BY created_at DESC LIMIT ? OFFSET ?");
                        stmt.setInt(1, itemsPerPage);
                        stmt.setInt(2, offset);
                        rs = stmt.executeQuery();

                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String title = rs.getString("title");
                            Timestamp createdAt = rs.getTimestamp("created_at");
                %>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <a href="viewTopic.jsp?id=<%= id %>" class="text-decoration-none"><%= title %></a>
                    <small class="text-muted"><%= createdAt.toString() %></small>
                </li>
                <%
                        }
                    } catch (SQLException e) {
                        out.println("<p class='text-danger'>Veritabanı hatası: " + e.getMessage() + "</p>");
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </ul>
        </div>

        <!-- Sayfalama -->
        <nav class="mt-4">
            <ul class="pagination justify-content-center">
                <%
                    try {
                        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/ebt522", "postgres", "ebt522");
                        stmt = conn.prepareStatement("SELECT COUNT(*) FROM topics");
                        rs = stmt.executeQuery();
                        rs.next();
                        int totalItems = rs.getInt(1);
                        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

                        for (int i = 1; i <= totalPages; i++) {
                %>
                <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                    <a class="page-link" href="?page=<%= i %>"><%= i %></a>
                </li>
                <%
                        }
                    } catch (SQLException e) {
                        out.println("<p class='text-danger'>Veritabanı hatası: " + e.getMessage() + "</p>");
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </ul>
        </nav>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
