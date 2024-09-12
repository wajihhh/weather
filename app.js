const express = require('express');
const body_parser = require('body-parser');
// const routers = require('/routers')
const userRouter = require('./routers/user.router');
const ToDoRouter = require('./routers/todo.router');

const app = express();

app.use(body_parser.json());

app.use('/', userRouter);
app.use('/', ToDoRouter);


module.exports = app;