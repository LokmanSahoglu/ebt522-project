<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Yeni Kişi Ekle</title>
</head>
<body>
    <h1>Yeni Kişi Ekle</h1>
    <form action="addPersonServlet" method="post" enctype="multipart/form-data">
        <label for="name">Ad:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="surname">Soyad:</label>
        <input type="text" id="surname" name="surname" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="phone">Telefon:</label>
        <input type="text" id="phone" name="phone" required><br>

        <label for="photo">Fotoğraf:</label>
        <input type="file" id="photo" name="photo" required><br>

        <button type="submit">Ekle</button>
    </form>
</body>
</html>
