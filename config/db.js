const mongoose = require('mongoose');

let connection = null

if(!connection) {
connection = mongoose.createConnection('mongodb://localhost:27017/newTodo').on('open', ()=>{
console.log("MongoDb Connected");


}).on("error",()=>{
console.log("MongoDb Connection error");

});

}
module.exports = connection;