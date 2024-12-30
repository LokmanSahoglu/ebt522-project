<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Yeni Başlık Oluştur</title>
</head>
<body>
    <h1>Yeni Başlık Oluştur</h1>
    <form action="CreateTopicServlet" method="post">
        <label for="title">Başlık:</label><br>
        <input type="text" id="title" name="title"><br><br>
        <label for="description">Açıklama:</label><br>
        <textarea id="description" name="description"></textarea><br><br>
        <button type="submit">Oluştur</button>
    </form>
</body>
</html>
