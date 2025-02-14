// camera.js
async function startCamera() {
    try {
        // Acceder a la cámara trasera
        const stream = await navigator.mediaDevices.getUserMedia({
            video: { facingMode: { exact: "environment" } } // "environment" indica la cámara trasera
        });

        // Obtener el elemento video
        const videoElement = document.getElementById('video');
        videoElement.srcObject = stream;

    } catch (err) {
        console.error("Error al acceder a la cámara: ", err);
    }
}

// Iniciar la cámara cuando la página se carga
window.onload = startCamera;
