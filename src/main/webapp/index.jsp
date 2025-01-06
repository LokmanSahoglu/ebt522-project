<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Anasayfa</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        .card-icon {
            font-size: 80px;
            margin-bottom: 10px;
        }
        .icon-kisi {
            color: #3498db;  /* Mavi */
        }
        .icon-forum {
            color: #9b59b6;  /* Mor */
        }
        .icon-list {
            color: #e67e22;  /* Turuncu */
        }
        .icon-photo {
            color: #2ecc71;  /* Yeşil */
        }
        .icon-video {
            color: #e74c3c;  /* Kırmızı */
        }
        .icon-status {
            color: #f1c40f;  /* Sarı */
        }
        .icon-map {
            color: #1abc9c;  /* Turkuaz */
        }
    </style>
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">EBT522 Portal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="login.jsp">Oturum Aç</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Kayıt Ol</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout.jsp">Çıkış Yap</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="text-center mb-4">
            <h1 class="display-4">EBT522 Portal Anasayfa</h1>
            <p class="lead">Kişi bilgilerini, fotoğrafları, videoları ve durumları görüntüleyin veya ekleyin.</p>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="card shadow-sm text-center">
                    <div class="card-body">
                        <i class="fas fa-user-plus card-icon icon-kisi"></i>
                        <h5 class="card-title mt-3">Kişi Kayıt</h5>
                        <a href="addPerson.jsp" class="btn btn-primary">Kişi Ekle</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card shadow-sm text-center">
                    <div class="card-body">
                        <i class="fas fa-comments card-icon icon-forum"></i>
                        <h5 class="card-title mt-3">Forum</h5>
                        <a href="forum.jsp" class="btn btn-primary">Forum Sayfası</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card shadow-sm text-center">
                    <div class="card-body">
                        <i class="fas fa-users card-icon icon-list"></i>
                        <h5 class="card-title mt-3">Kişiler</h5>
                        <a href="persons.jsp" class="btn btn-primary">Kişi Listesi</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card shadow-sm text-center">
                    <div class="card-body">
                        <i class="fas fa-images card-icon icon-photo"></i>
                        <h5 class="card-title mt-3">Fotoğraflar</h5>
                        <a href="photos.jsp" class="btn btn-success">Fotoğrafları Görüntüle</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card shadow-sm text-center">
                    <div class="card-body">
                        <i class="fas fa-video card-icon icon-video"></i>
                        <h5 class="card-title mt-3">Videolar</h5>
                        <a href="videos.jsp" class="btn btn-success">Videoları Görüntüle</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card shadow-sm text-center">
                    <div class="card-body">
                        <i class="fas fa-map-marker-alt card-icon icon-status"></i>
                        <h5 class="card-title mt-3">Kim, Nerede, Ne Yapıyor?</h5>
                        <a href="statuses.jsp" class="btn btn-warning">Durumlar</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-12">
                <div class="card shadow-sm text-center">
                    <div class="card-body">
                        <i class="fas fa-map card-icon icon-map"></i>
                        <h5 class="card-title mt-3">Harita</h5>
                        <a href="map.jsp" class="btn btn-danger">Haritayı Görüntüle</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
