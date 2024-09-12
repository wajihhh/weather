// const mongoose = require ('mongoose');
// const bcrypt = require('bcrypt');

// const db = require ('../config/db');

// const {Schema} = mongoose;

// const userSchema =new Schema({
// email:{
// type : String,
// lowercase : true,
// required : true,
// unique: true,
// },
// password:{
// type : String,

// required : true,

// }
// });

// userSchema.pre('save',async function(){

// try{
// var user = this;
// const salt = await (bcrypt.genSalt(10));
// const hashpass = await bcrypt.hash(user.password,salt);
// user.password = hashpass;
// }catch(error)
// {throw error}
// });

// userSchema.methods.comparePassword = async function(userPassword){
// try{
// const isMatch = await bcrypt.compare(userPassword,this.password);
// return isMatch;
// }catch(error){ throw error}
// }

// const UserModel = db.model('user',userSchema);

// module.exports = UserModel;



// const mongoose = require('mongoose');
// const bcrypt = require('bcrypt');
// const db = require('../config/db');
// const { Schema } = mongoose;

// const userSchema = new Schema({
//     email: {
//         type: String,
//         lowercase: true,
//         required: true,
//         unique: true,
//     },
//     password: {
//         type: String,
//         required: true,
//     }
// });

// userSchema.pre('save', async function (next) {
//     try {
//         var user = this;
//         if (!user.isModified('password')) return next();
//         const salt = await bcrypt.genSalt(10);
//         const hashpass = await bcrypt.hash(user.password, salt);
//         user.password = hashpass;
//         next();
//     } catch (error) {
//         next(error);
//     }
// });

// userSchema.methods.comparePassword = async function (userPassword) {
//     try {
//         return await bcrypt.compare(userPassword, this.password);
//     } catch (error) {
//         throw error;
//     }
// }

// const UserModel = db.model('user', userSchema);

// module.exports = UserModel;


///------------------------///


const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const db = require('../config/db');
const { Schema } = mongoose;

const userSchema = new Schema({
    email: {
        type: String,
        lowercase: true,
        required: true,
        unique: true,
    },
    name: {
        type : String,
        required: true,
    },
    password: {
        type: String,
        required: true,
    }
});

userSchema.pre('save', async function (next) {
    try {
        var user = this;
        if (!user.isModified('password')) return next();
        const salt = await bcrypt.genSalt(10);
        const hashpass = await bcrypt.hash(user.password, salt);
        user.password = hashpass;
        next();
    } catch (error) {
        next(error);
    }
});

userSchema.methods.comparePassword = async function (userPassword) {
    try {
        return await bcrypt.compare(userPassword, this.password);
    } catch (error) {
        throw error;
    }
}

const UserModel = db.model('user', userSchema);

module.exports = UserModel;