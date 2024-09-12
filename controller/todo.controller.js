const ToDoServices = require("../services/todo.services");

// exports.createTodo = async (req, res, next) => {
//     console.log(req.body, "check body")
//     try {
//         console.log(req.body, "check body")
//         const { userId, title, description } = req.body;

//         let todo = await ToDoServices.createTodo(userId, title, description);
//         res.json({ status: true, success: todo })
//     }
//     catch (error) {
//         next(error);
//     }

// }

exports.createTodo = async (req, res, next) => {
    try {
        const { userId, title, description } = req.body;
        const photo = req.file ? req.file.path : null; // Get the photo path if available

        let todo = await ToDoServices.createTodo(userId, title, description, photo);
        res.json({ status: true, success: todo });
    } catch (error) {
        next(error);
    }
}


exports.getUserTodo = async (req, res, next) => {
    console.log(req.body, "check body")
    try {
        console.log(req.body, "check body")
        const { userId } = req.body;

        let todo = await ToDoServices.getTodoData(userId);
        return res.json({ status: true, success: todo })
    }
    catch (error) {
        return res.status(500).json({ status: false, message: 'internal server error', error: error })
    }

}

exports.deleteTodo = async (req, res, next) => {
    // console.log(req.body, "check body")
    try {
        // console.log(req.body, "check body")
        const { id } = req.body;

        let deleted = await ToDoServices.deleteTodoData(id);
        res.json({ status: true, success: deleted })
    }
    catch (error) {
        next(error);
    }

}