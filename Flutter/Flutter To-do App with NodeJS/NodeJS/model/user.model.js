class UserModel {
    constructor(id, email, password) {
      this._id = id;
      this._email = email;
      this._password = password;
    }
  
    get id() {
      return this._id;
    }
  
    set id(newId) {
      this._id = newId;
    }

    get email() {
      return this._email;
    }
  
    set email(newEmail) {
      this._email = newEmail;
    }
    
    get password() {
      return this._password;
    }
  
    set password(newPassword) {
      this._password = newPassword;
    }
  
    getInfo() {
      return `User email (${this.email}),  password (${this.password})`;
    }
  }
  
module.exports = UserModel;
  