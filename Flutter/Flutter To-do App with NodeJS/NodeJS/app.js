const express = require('express');
const bodyParser = require('body-parser');
const userRouter = require('./routers/user.router');
const cors = require('cors');

const app = express();

app.use(bodyParser.json());
app.use(cors());

app.use('/', userRouter);

module.exports = app;