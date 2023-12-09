const app = require('./app');

const PORT = 3001;

app.get('/test', (req, res) => {
    res.send("Hello, world!");
});

app.listen(PORT, () => {
    console.log(`Server listening on port http://localhost:${PORT}`);
});