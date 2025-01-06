<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
    <h1>Hoş Geldiniz!</h1>
    <p>Kullanıcı Adı: <%= username %></p>
    <p><a href="logout.jsp">Çıkış Yap</a></p>
</body>
</html>
