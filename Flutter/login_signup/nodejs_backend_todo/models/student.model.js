const mongoose = require('mongoose');
const { Schema } = mongoose;
const db = require('../config/db');

// Định nghĩa schema và model cho sinh viên
const studentSchema = new Schema({
    studentId: {
        type: String,
        required: [true, "Student ID is required"],
        unique: true,
    },
    studentName: {
        type: String,
        required: [true, "Student Name is required"],
    },
    classCode: {
        type: String,
        required: [true, "Class Code is required"],
    },
    gender: {
        type: String,
        required: [true, "Gender is required"],
        enum: ['Nam', 'Nữ'],
    },
    birthDate: {
        type: Date,
        required: [true, "Birth Date is required"],
    },
}, { timestamps: true });

const Student = db.model('student', studentSchema);
module.exports = Student;