//importing a module from node.js
const { createPool } = require("mysql");

//creating a pool with the database details and authentication
const pool = createPool({
    connectionLimit: 100, //the maximum number of connections to the SQL database
    host: "localhost", //hosting link of the database
    user: "Farhaan", //the username of the database (default is "root")
    password: "admin", //the password of the database (default has no password)
    database: "test" //the name of the database
});

//export the pool so that 'app' can use the pool
module.exports = pool;