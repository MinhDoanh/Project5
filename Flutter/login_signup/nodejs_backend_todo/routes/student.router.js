const router = require("express").Router();
const StudentController = require('../controller/student.controller');

router.post("/create", StudentController.createStudent);

router.get("/getAll", StudentController.getAllStudent);



module.exports = router;