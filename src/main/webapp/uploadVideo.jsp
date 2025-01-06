<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Yükle</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header bg-primary text-white text-center">
                <h2>Yeni Video Yükle</h2>
            </div>
            <div class="card-body">
                <form action="UploadVideoServlet" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
                    <div class="mb-3">
                        <label for="title" class="form-label">Başlık:</label>
                        <input type="text" class="form-control" id="title" name="title" placeholder="Videonuz için başlık girin" required>
                        <div class="invalid-feedback">Lütfen başlık girin.</div>
                    </div>

                    <div class="mb-3">
                        <label for="description" class="form-label">Açıklama:</label>
                        <textarea class="form-control" id="description" name="description" rows="4" placeholder="Video açıklaması yazın" required></textarea>
                        <div class="invalid-feedback">Lütfen açıklama girin.</div>
                    </div>

                    <div class="mb-3">
                        <label for="video" class="form-label">Video Dosyası:</label>
                        <input type="file" class="form-control" id="video" name="video" accept="video/*" required>
                        <div class="invalid-feedback">Lütfen bir video dosyası seçin.</div>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Yükle</button>
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

