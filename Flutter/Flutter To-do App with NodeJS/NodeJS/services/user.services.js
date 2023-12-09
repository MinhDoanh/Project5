const sql = require('mssql');
const db = require('../config/sql');
const UserModel = require('../model/user.model');
const bcrypt = require('bcrypt');
const { v4: uuidv4 } = require('uuid');
const jwt = require('jsonwebtoken');

class UserService {
    static async registerUser(email, password) {
        try {
            // Tạo id user mới
            const newId = uuidv4();

            // Mã hóa password
            const salt = await bcrypt.genSalt(10);
            const hashpass = await bcrypt.hash(password, salt);
            
            const createUser = new UserModel(newId, email, hashpass);
            
            const pool = await db;
            await pool
                .request()
                .input('id', sql.NVarChar(255), createUser.id)
                .input('email', sql.NVarChar(255), createUser.email)
                .input('password', sql.NVarChar(255), createUser.password)
                .execute('register_user');

        } catch (err) {
            throw err;
        }
    }

    static async checkuser(email) {
        try {
            const pool = await db;
            const result = await pool
                .request()
                .input('email', sql.NVarChar(255), email)
                .execute('check_user')
            return result.recordset[0][0];
        } catch (err) {
            console.error(err);
        }
    }

    static async comparePassword(password, hashpass) {
        try {
            return await bcrypt.compare(password, hashpass);
        } catch (error) {
            throw error;
        }
    }

    static async generateToken(tokenData, secretKey, jwt_expire) {
        return jwt.sign(tokenData, secretKey, {expiresIn: jwt_expire});
    }
}

module.exports = UserService;