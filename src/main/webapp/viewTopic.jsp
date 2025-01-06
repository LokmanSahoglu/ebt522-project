<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Başlık Görüntüle</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h2 class="text-center">Başlık Detayı</h2>
            </div>
            <div class="card-body">
                <%
                    int topicId = Integer.parseInt(request.getParameter("id"));
                    Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/ebt522", "postgres", "ebt522");

                    PreparedStatement topicStmt = conn.prepareStatement("SELECT title, description FROM topics WHERE id = ?");
                    topicStmt.setInt(1, topicId);
                    ResultSet topicRs = topicStmt.executeQuery();
                    if (topicRs.next()) {
                %>
                <h3 class="mb-3"><%= topicRs.getString("title") %></h3>
                <p class="text-muted"><%= topicRs.getString("description") %></p>
                <%
                    }
                    topicRs.close();
                    topicStmt.close();
                %>

                <hr>
                <h4 class="mt-4">Yorumlar</h4>
                <ul class="list-group mb-4">
                    <%
                        PreparedStatement commentStmt = conn.prepareStatement("SELECT comment, commented_by FROM comments WHERE topic_id = ? ORDER BY commented_at ASC");
                        commentStmt.setInt(1, topicId);
                        ResultSet commentRs = commentStmt.executeQuery();
                        if (!commentRs.isBeforeFirst()) {
                    %>
                        <li class="list-group-item text-muted">Henüz yorum yapılmamış.</li>
                    <%
                        } else {
                            while (commentRs.next()) {
                    %>
                    <li class="list-group-item">
                        <strong><%= commentRs.getString("commented_by") %>:</strong>
                        <p><%= commentRs.getString("comment") %></p>
                    </li>
                    <%
                            }
                        }
                        commentRs.close();
                        commentStmt.close();
                        conn.close();
                    %>
                </ul>

                <h4>Yorum Ekle</h4>
                <form action="CreateCommentServlet" method="post" class="needs-validation" novalidate>
                    <input type="hidden" name="topicId" value="<%= topicId %>">
                    <div class="mb-3">
                        <label for="comment" class="form-label">Yorum:</label>
                        <textarea class="form-control" id="comment" name="comment" rows="3" placeholder="Yorumunuzu buraya yazın..." required></textarea>
                        <div class="invalid-feedback">Lütfen bir yorum yazın.</div>
                    </div>
                    <button type="submit" class="btn btn-primary">Gönder</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
        // Form validation script
        (function () {
            'use strict'
            const forms = document.querySelectorAll('.needs-validation')
            Array.from(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        })()
    </script>
</body>
</html>

