<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kişi Kayıt Formu</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white text-center">
                        <h4>Kişi Kayıt Formu</h4>
                    </div>
                    <div class="card-body">
                        <form action="RegisterServlet" method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label">Ad:</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Adınızı giriniz" required>
                            </div>
                            <div class="mb-3">
                                <label for="surname" class="form-label">Soyad:</label>
                                <input type="text" class="form-control" id="surname" name="surname" placeholder="Soyadınızı giriniz" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Cinsiyet:</label><br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="male" name="gender" value="male" required>
                                    <label class="form-check-label" for="male">Erkek</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="female" name="gender" value="female" required>
                                    <label class="form-check-label" for="female">Kadın</label>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="city" class="form-label">Şehir:</label>
                                <select class="form-select" id="city" name="city" required>
                                    <option selected disabled>Şehir seçin...</option>
                                    <option value="istanbul">İstanbul</option>
                                    <option value="ankara">Ankara</option>
                                    <option value="izmir">İzmir</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Hobiler:</label><br>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="hobby1" name="hobbies" value="Spor">
                                    <label class="form-check-label" for="hobby1">Spor</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="hobby2" name="hobbies" value="Müzik">
                                    <label class="form-check-label" for="hobby2">Müzik</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="hobby3" name="hobbies" value="Kitap Okuma">
                                    <label class="form-check-label" for="hobby3">Kitap Okuma</label>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Kayıt Ol</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
