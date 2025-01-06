<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Kişi Düzenle</title>
</head>
<body>
    <h1>Kişi Düzenle</h1>
<form action="EditPersonServlet" method="post">
    <input type="hidden" name="id" value="${id}" />
    <label for="name">Ad:</label>
    <input type="text" id="name" name="name" value="${name}" required /><br>
    <label for="surname">Soyad:</label>
    <input type="text" id="surname" name="surname" value="${surname}" required /><br>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="${email}" required /><br>
    <label for="phone">Telefon:</label>
    <input type="text" id="phone" name="phone" value="${phone}" required /><br>
    <button type="submit">Kaydet</button>
</form>

</body>
</html>
