const UserService = require('../services/user.services');

exports.register = async(req, res, next) => {
    try {
        const {email, password} = req.body;

        const successRes = await UserService.registerUser(email, password);

        res.json({status: true, success: 'User registered successfully'});
    } catch (error) {
        throw error;
    }
}

exports.login = async(req, res, next) => {
    try {
        const {email, password} = req.body;
        
        const user = await UserService.checkuser(email);
        const hashpass = user.password;

        if (hashpass == '' && hashpass != undefined) {
            // throw new Error('User don\'t exist');
            console.log('User don\'t exist');
        }
        else {
            console.log('User exists');
            const isMatch = await UserService.comparePassword(password, hashpass);

            if (!isMatch) {
                // throw new Error('Password invalid');
                console.log('Password invalid');
            }

            let tokenData = {_id: user.id, email: email};

            const token = await UserService.generateToken(tokenData, 'secretKey', '1h');
            
            res.status(200).json({status: true, token: token});
        }
        
    } catch (error) {
        throw error;
    }
}