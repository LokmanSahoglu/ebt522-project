<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Fotoğraf Yükle</title>
</head>
<body>
    <h1>Yeni Fotoğraf Yükle</h1>
    <form action="UploadPhotoServlet" method="post" enctype="multipart/form-data">
        <label for="title">Başlık:</label>
        <input type="text" id="title" name="title" required><br><br>
        <label for="description">Açıklama:</label>
        <textarea id="description" name="description"></textarea><br><br>
        <label for="image">Fotoğraf:</label>
        <input type="file" id="image" name="image" accept="image/*" required><br><br>
        <button type="submit">Yükle</button>
    </form>
</body>
</html>
