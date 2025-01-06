<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yeni Başlık Oluştur</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header text-center bg-primary text-white">
                <h2>Yeni Başlık Oluştur</h2>
            </div>
            <div class="card-body">
                <form action="CreateTopicServlet" method="post">
                    <div class="mb-3">
                        <label for="title" class="form-label">Başlık:</label>
                        <input type="text" class="form-control" id="title" name="title" placeholder="Başlık girin..." required>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Açıklama:</label>
                        <textarea class="form-control" id="description" name="description" rows="4" placeholder="Açıklama girin..." required></textarea>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Oluştur</button>
                        <button type="reset" class="btn btn-secondary">Temizle</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (Optional) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>

