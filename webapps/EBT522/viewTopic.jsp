<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Başlık Görüntüle</title>
</head>
<body>
    <%
        int topicId = Integer.parseInt(request.getParameter("id"));
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/ebt522", "postgres", "ebt522");

        PreparedStatement topicStmt = conn.prepareStatement("SELECT title, description FROM topics WHERE id = ?");
        topicStmt.setInt(1, topicId);
        ResultSet topicRs = topicStmt.executeQuery();
        if (topicRs.next()) {
    %>
    <h1><%= topicRs.getString("title") %></h1>
    <p><%= topicRs.getString("description") %></p>
    <%
        }
        topicRs.close();
        topicStmt.close();
    %>

    <h2>Yorumlar</h2>
    <ul>
        <%
            PreparedStatement commentStmt = conn.prepareStatement("SELECT comment, commented_by FROM comments WHERE topic_id = ? ORDER BY commented_at ASC");
            commentStmt.setInt(1, topicId);
            ResultSet commentRs = commentStmt.executeQuery();
            while (commentRs.next()) {
        %>
        <li>
            <strong><%= commentRs.getString("commented_by") %>:</strong>
            <p><%= commentRs.getString("comment") %></p>
        </li>
        <%
            }
            commentRs.close();
            commentStmt.close();
            conn.close();
        %>
    </ul>

    <h2>Yorum Ekle</h2>
    <form action="CreateCommentServlet" method="post">
        <input type="hidden" name="topicId" value="<%= topicId %>">
        <label for="comment">Yorum:</label><br>
        <textarea id="comment" name="comment" rows="3" cols="50" required></textarea><br><br>
        <button type="submit">Gönder</button>
    </form>
</body>
</html>
