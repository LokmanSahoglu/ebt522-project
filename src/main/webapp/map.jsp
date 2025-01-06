<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Türkiye Haritası</title>
    <!-- Stil -->
    <style>
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
        }

        #mapContainer {
            width: 100%;
            height: 100vh;
            overflow: hidden;
            position: relative;
            background-color: #f0f0f0;
        }

        #map {
            background-image: url('https://www.kgm.gov.tr/SiteCollectionImages/KGMimages/Haritalar/turistik.jpg');
            background-size: contain;
            background-repeat: no-repeat;
            width: 2000px; /* Haritanın genişliği */
            height: 1500px; /* Haritanın yüksekliği */
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            cursor: grab;
            transition: transform 0.2s ease-out;
        }
    </style>
</head>
<body>
    <div id="mapContainer">
        <div id="map"></div>
    </div>

    <script>
        let map = document.getElementById("map");
        let isPanning = false;
        let startX, startY, initialX, initialY;
        let scale = 1;  // Başlangıç zoom seviyesi

        // **Pan İşlemi**
        map.addEventListener("mousedown", (e) => {
            isPanning = true;
            startX = e.clientX;
            startY = e.clientY;
            initialX = map.offsetLeft;
            initialY = map.offsetTop;
            map.style.cursor = "grabbing";
        });

        window.addEventListener("mousemove", (e) => {
            if (!isPanning) return;
            let dx = e.clientX - startX;
            let dy = e.clientY - startY;
            map.style.left = `${initialX + dx}px`;
            map.style.top = `${initialY + dy}px`;
        });

        window.addEventListener("mouseup", () => {
            isPanning = false;
            map.style.cursor = "grab";
        });

        // **Zoom İşlemi**
        window.addEventListener("wheel", (e) => {
            e.preventDefault();
            let zoomFactor = e.deltaY < 0 ? 1.1 : 0.9;  // Yukarı scroll = zoom in, aşağı scroll = zoom out

            let rect = map.getBoundingClientRect();
            let mouseX = e.clientX - rect.left;
            let mouseY = e.clientY - rect.top;

            let offsetX = (mouseX / rect.width - 0.5) * 2;
            let offsetY = (mouseY / rect.height - 0.5) * 2;

            scale *= zoomFactor;

            // Zoom sınırları
            if (scale < 0.5) scale = 0.5;
            if (scale > 3) scale = 3;

            map.style.transform = `translate(-50%, -50%) scale(${scale}) translate(${offsetX * 50}%, ${offsetY * 50}%)`;
        });
    </script>
</body>
</html>
