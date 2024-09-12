// const UserModel = require('../model/user.model')
// const jwt = require('jsonwebtoken');


// class UserService{
// static async registerUser(email,password){
// console.log({email, password})
// try{
// const createUser = new UserModel({email,password});
// return await createUser.save();

// }catch(err){
// throw err;
// }
// }

// static async checkUser(email){
// try{
// return await UserModel.findOne({email});
// }catch(error)
// {throw error}

// }


// static async generateToken(tokeData,secretKey,jwt_expire){
//     return jwt.sign(tokeData,secretKey,{expiresIn: jwt_expire});
// }
 

// }

// module.exports = UserService;



const UserModel = require('../model/user.model');
const jwt = require('jsonwebtoken');

class UserService {
    static async registerUser(email, password, name) {
        console.log({ email, password, name });
        try {
            const createUser = new UserModel({ email, password, name });
            return await createUser.save();
        } catch (err) {
            throw err;
        }
    }

    static async checkUser(email) {
        try {
            return await UserModel.findOne({ email });
        } catch (error) {
            throw error;
        }
    }

    static async generateToken(tokenData, secretKey, jwt_expire) {
        return jwt.sign(tokenData, secretKey, { expiresIn: jwt_expire });
    }
}

module.exports = UserService;
