// camera.js
async function startCamera() {
    try {
        // Acceder a la cámara trasera
        const stream = await navigator.mediaDevices.getUserMedia({
            video: { facingMode: { exact: "environment" } } // "environment" indica la cámara trasera
        });

        // Aquí es donde conectarías el stream al servidor WebSockets para enviarlo
        sendToServer(stream);
        
    } catch (err) {
        console.error("Error al acceder a la cámara: ", err);
    }
}

function sendToServer(stream) {
    // Aquí enviarías el stream al servidor a través de WebSockets
    const socket = new WebSocket('ws://tuservidor.com'); // Conexión WebSocket al servidor
    socket.onopen = () => {
        socket.send(stream); // Aquí deberías enviar los datos del vídeo
    };
}


// Iniciar la cámara cuando la página se carga
window.onload = startCamera;
