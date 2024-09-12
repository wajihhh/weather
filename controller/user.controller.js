// const UserService = require('../services/user.services');

// exports.register = async(req,res,next)=>{
// try{
// const {email,password} = req.body;
// console.log({req})
// const successRes = await UserService.registerUser(email,password);
// res.json({status:true,success:'User Registered Successfully'});
// }catch(error){
// throw error
// }

// }


// exports.login = async(req,res,next)=>{
// try{
// const {email,password} = req.body;
// console.log("--------------",password,email);

// const user =await UserService.checkUser(email);
// console.log("------------------------------------user-----------------------------------------",user);
// if(!user){
// throw new Error("user dont exist");}
// const isMatch =await user.comparePassword(password);
// if(isMatch == false){
// throw new Error("invalid password");
// }

// let tokenData = {_id:user._id, email:user.email};
// const token = await UserService.generateToken(tokenData,"secretKey",'1h')

// res.status(200).json({status:true,token:token})

// }catch(error){
// throw error
// }

// }

// exports.createTodo = async (req, res, next) => {
//     console.log(req.body, "check body")
//     // try {
//     //     console.log(req.body, "check body")
//     //     // const { userId, title, description } = req.body;

//     //     // let todo = await ToDoServices.createTodo(userId, title, description);
//     //     // res.json({ status: true, success: todo })
//     // }
//     // catch (error) {
//     //     next(error);
//     // }

// }




const UserService = require('../services/user.services');


exports.register = async (req, res, next) => {
    try {
        const { email, password, name } = req.body;

        // Check if the user already exists
        const existingUser = await UserService.checkUser(email);
        if (existingUser) {
            return res.status(400).json({ status: false, message: 'Email already exists' });
        }

        // Register new user
        const successRes = await UserService.registerUser(email, password,name);
        res.json({ status: true, success: 'User Registered Successfully' });
    } catch (error) {
        next(error);
    }
}


exports.login = async (req, res, next) => {
    try {
        const { email, password } = req.body;

        const user = await UserService.checkUser(email);
        if (!user) {
            return res.status(404).json({ status: false, message: "User doesn't exist" });
        }

        const isMatch = await user.comparePassword(password);
        if (!isMatch) {
            return res.status(401).json({ status: false, message: "Invalid password" });
        }

        let tokenData = { _id: user._id, email: user.email };
        const token = await UserService.generateToken(tokenData, "secretKey", '1h');

        res.status(200).json({ status: true, token: token });
    } catch (error) {
        next(error);
    }
}

exports.createTodo = async (req, res, next) => {
    try {
        const { userId, title, description } = req.body;
        let todo = await ToDoServices.createTodo(userId, title, description);
        res.json({ status: true, success: todo });
    } catch (error) {
        next(error);
    }
}
