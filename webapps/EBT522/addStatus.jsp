<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Yeni Durum Ekle</title>
</head>
<body>
    <h1>Yeni Durum Ekle</h1>
<form action="AddStatusServlet" method="post">
    <label for="person">Kişi:</label>
    <input type="text" id="person" name="person" required><br><br>
    <label for="location">Yer:</label>
    <input type="text" id="location" name="location" required><br><br>
    <label for="activity">Ne Yapıyor:</label>
    <textarea id="activity" name="activity" required></textarea><br><br>
    <button type="submit">Kaydet</button>
</form>
</body>
</html>
