const http = require('http');
const express = require('express');
const socketIo = require('socket.io');

const app = express();
const server = http.createServer(app);
const io = socketIo(server);

const PORT = 3000;

io.on('connection', (socket) => {
  console.log('Client connected');

  socket.on('fingerprintRegistered', (data) => {
    console.log('Fingerprint registered. Saving data to database...');

    // Xử lý và lưu dữ liệu vào CSDL ở đây
    // Ví dụ: sử dụng một thư viện như MongoDB, MySQL, hoặc Firebase để lưu trữ dữ liệu

    // Ví dụ với MongoDB
    /*
    const MongoClient = require('mongodb').MongoClient;
    const uri = "mongodb://localhost:27017";
    const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });

    client.connect(err => {
      const collection = client.db("fingerprintDB").collection("fingerprints");
      const binaryData = Buffer.from(data);

      collection.insertOne({ fingerprintData: binaryData }, (err, result) => {
        if (err) throw err;
        console.log('Fingerprint data saved to database:', result.insertedId);
        client.close();
      });
    });
    */

    // Thực hiện xử lý và lưu dữ liệu vào CSDL theo định dạng của bạn
  });

  socket.on('disconnect', () => {
    console.log('Client disconnected');
  });
});

server.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
