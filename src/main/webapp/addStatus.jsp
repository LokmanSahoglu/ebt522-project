<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yeni Durum Ekle</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header bg-primary text-white text-center">
                <h2>Yeni Durum Ekle</h2>
            </div>
            <div class="card-body">
                <form action="AddStatusServlet" method="post" class="needs-validation" novalidate>
                    <div class="mb-3">
                        <label for="person" class="form-label">Kişi:</label>
                        <input type="text" class="form-control" id="person" name="person" placeholder="Kişi adını girin" required>
                        <div class="invalid-feedback">Lütfen kişi adını girin.</div>
                    </div>

                    <div class="mb-3">
                        <label for="location" class="form-label">Yer:</label>
                        <input type="text" class="form-control" id="location" name="location" placeholder="Konumu girin" required>
                        <div class="invalid-feedback">Lütfen yer bilgisi girin.</div>
                    </div>

                    <div class="mb-3">
                        <label for="activity" class="form-label">Ne Yapıyor:</label>
                        <textarea class="form-control" id="activity" name="activity" rows="4" placeholder="Ne yaptığını yazın" required></textarea>
                        <div class="invalid-feedback">Lütfen durum bilgisini girin.</div>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Kaydet</button>
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
