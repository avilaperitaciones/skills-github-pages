// server.js
const WebSocket = require('ws');
const wss = new WebSocket.Server({ port: 8080 });

wss.on('connection', ws => {
    console.log('Cliente conectado');

    ws.on('message', message => {
        console.log('Recibiendo datos del cliente');
        // Aqu� manejar�as el flujo de v�deo que llega del tel�fono m�vil
        // y lo retransmitir�as a todos los clientes conectados
        wss.clients.forEach(client => {
            if (client !== ws && client.readyState === WebSocket.OPEN) {
                client.send(message); // Enviar a todos los clientes
            }
        });
    });

    ws.on('close', () => {
        console.log('Cliente desconectado');
    });
});
