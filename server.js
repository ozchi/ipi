var express = require('express');
var path = require('path');
var logger = require('morgan');
var mysql = require('mysql');


var connPool = mysql.createPool({
    host: '127.0.0.1',
    database: 'adelaide_dev',
    port:'3306',
    user: "admin",
    password: "12345678"
});


// Test the connection
connPool.getConnection((err, connection) => {
    if (err) {
        console.error("Error connecting to the database:", err.message);
    } else {
        console.log("Successfully connected to the database.");
        connection.release(); 
    }
});

var searchRouter = require('./routes/searchRoutes');
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var apiRoutes = require('./routes/apiRoutes');
var app = express();

app.use(function(req, res, next) {
    req.pool = connPool;
    next();
});


app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));
app.use('/api', searchRouter);
app.use('/', indexRouter);
app.use('/api', apiRoutes);
app.use('/users', usersRouter);

module.exports = app;

app.listen(9000, () => console.log('Curriculum Mapping Tool is listening on port 9000.'));
