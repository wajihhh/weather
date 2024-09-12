const db = require ('../config/db');
const mongoose = require ('mongoose');
const UserModel = require('../model/user.model')





const {Schema} = mongoose;


const todoSchema = new Schema({

    userId:{
        type:Schema.Types.ObjectId,
        ref: UserModel.modelName

    },


    title:{ 
    type : String,
    required: true,
    },
    description:{
    type : String,
    required : true,
    
    },  

    photo: {
        type: String, // This will store the URL or path to the photo
        default: null,
    },

    });

    const ToDoModel = db.model('todo',todoSchema);

module.exports = ToDoModel;
