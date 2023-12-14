const express = require("express");
const bodyParser = require("body-parser")
const UserRoute = require("./routes/user.routes");
const ToDoRoute = require('./routes/todo.router');
const StudentRoute = require('./routes/student.router');


const app = express();
const cors = require('cors');

app.use(cors())

app.use(bodyParser.json())

app.use("/user", UserRoute);
app.use("/todo", ToDoRoute);
app.use("/student", StudentRoute);

module.exports = app;