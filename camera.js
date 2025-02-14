// camera.js
async function startCamera() {
    try {
        // Acceder a la c�mara trasera
        const stream = await navigator.mediaDevices.getUserMedia({
            video: { facingMode: { exact: "environment" } } // "environment" indica la c�mara trasera
        });

        // Obtener el elemento video
        const videoElement = document.getElementById('video');
        videoElement.srcObject = stream;

    } catch (err) {
        console.error("Error al acceder a la c�mara: ", err);
    }
}

// Iniciar la c�mara cuando la p�gina se carga
window.onload = startCamera;
