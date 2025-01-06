<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yeni Kişi Ekle</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header bg-primary text-white text-center">
                <h2>Yeni Kişi Ekle</h2>
            </div>
            <div class="card-body">
                <form action="addPersonServlet" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
                    <div class="mb-3">
                        <label for="name" class="form-label">Ad:</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Adınızı girin" required>
                        <div class="invalid-feedback">Lütfen adınızı girin.</div>
                    </div>

                    <div class="mb-3">
                        <label for="surname" class="form-label">Soyad:</label>
                        <input type="text" class="form-control" id="surname" name="surname" placeholder="Soyadınızı girin" required>
                        <div class="invalid-feedback">Lütfen soyadınızı girin.</div>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Email adresinizi girin" required>
                        <div class="invalid-feedback">Lütfen geçerli bir email adresi girin.</div>
                    </div>

                    <div class="mb-3">
                        <label for="phone" class="form-label">Telefon:</label>
                        <input type="text" class="form-control" id="phone" name="phone" placeholder="Telefon numaranızı girin" required>
                        <div class="invalid-feedback">Lütfen telefon numaranızı girin.</div>
                    </div>

                    <div class="mb-3">
                        <label for="photo" class="form-label">Fotoğraf:</label>
                        <input type="file" class="form-control" id="photo" name="photo" accept="image/*" required>
                        <div class="invalid-feedback">Lütfen bir fotoğraf yükleyin.</div>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Ekle</button>
                        <button type="reset" class="btn btn-secondary">Temizle</button>
                    </div>
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

