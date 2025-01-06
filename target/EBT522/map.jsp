<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Türkiye Haritası</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <style>
        /* Harita Konteyneri */
        #map {
            width: 100vw; /* Tüm ekran genişliği */
            height: 100vh; /* Tüm ekran yüksekliği */
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
    <div id="map"></div>

    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <script>
        // Leaflet Haritasını Başlat
        const map = L.map('map', {
            center: [39.0, 35.0], // Türkiye'nin merkez koordinatları
            zoom: 6, // Başlangıç zoom seviyesi
            minZoom: 4,
            maxZoom: 10
        });

        // Harita Katmanı Ekleyin
        const bounds = [[36.0, 26.0], [42.0, 45.0]]; // Türkiye'nin koordinat sınırları

        const imageOverlay = L.imageOverlay(
            'https://www.kgm.gov.tr/SiteCollectionImages/KGMimages/Haritalar/turistik.jpg', // Harita URL'si
            bounds
        );

        // Katmanı Haritaya Ekleyin
        imageOverlay.addTo(map);

        // Görünümü Otomatik Ayarla
        map.fitBounds(bounds);

        // Zoom Kontrolü Ekleyin
        L.control.zoom({
            position: 'topright'
        }).addTo(map);
    </script>
</body>
</html>



