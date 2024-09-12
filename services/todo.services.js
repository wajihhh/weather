const ToDoModel = require('../model/todo.model');

class ToDoServices {

    // static async createTodo(userId,title,description){

    //     const createTodo = new ToDoModel({userId,title,description});
    //     return await createTodo.save(); 

    // }


    static async createTodo(userId, title, description, photo) {
        const createTodo = new ToDoModel({ userId, title, description, photo });
        return await createTodo.save();
    }
    





    static async getTodoData(userId){

        const todoData= await ToDoModel.find({userId})
        return await todoData; 

    }

    static async deleteTodoData(id){

        const deleted = await ToDoModel.findOneAndDelete({_id:id})
        return  deleted; 

    }



}

module.exports = ToDoServices;