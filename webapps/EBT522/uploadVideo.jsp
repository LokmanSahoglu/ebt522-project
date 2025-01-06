<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Video Yükle</title>
</head>
<body>
    <h1>Yeni Video Yükle</h1>
    <form action="UploadVideoServlet" method="post" enctype="multipart/form-data">
        <label for="title">Başlık:</label><br>
        <input type="text" id="title" name="title" required><br><br>
        <label for="description">Açıklama:</label><br>
        <textarea id="description" name="description" required></textarea><br><br>
        <label for="video">Video Dosyası:</label><br>
        <input type="file" id="video" name="video" accept="video/*" required><br><br>
        <button type="submit">Yükle</button>
    </form>
</body>
</html>
