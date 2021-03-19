//importing modules from and into node.js
const express = require("express"); //requiring module 'express'
const pool = require("./db"); //importing file 'db' which contains the database's details and authentication
const bodyParser = require("body-parser"); //requiring module 'body-parser' to be able to read data exchanged
const app = express(); //defining express
const nodeMailer = require('nodemailer');

var transporter = nodeMailer.createTransport({
    service: 'gmail',
    auth: {
        user: 'tipoumgropoum@gmail.com',
        pass: 'Password123@'
    }
});

//setting up the 'app'
app.use(bodyParser.urlencoded()); //converts data into 'body' which can be used later on

//header indicates whether the response can be shared with requesting code from the given origin
//this will accept requests from the source (the links allocated)
app.use(function(req, res, next) {

    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();

});

app.use("/API/login", function(req, res, next) {

    var emailAddress = req.body.emailAddress;
    var password = req.body.password;

    checkValidLogIn(emailAddress, password).then(result => {

        if (result == 1) {
            res.status(200).json({
                success: true,
                error: "",
                data: "",
                msg: ""
            });
        } else if (result == 0) {

            checkValidEmailAddress(emailAddress).then(result => {

                if (result == 1) {
                    res.status(200).json({
                        success: false,
                        error: "Password does not match!",
                        data: "",
                        msg: ""
                    });
                } else if (result == 0) {
                    res.status(200).json({
                        success: false,
                        error: "Account does not exist!",
                        data: "",
                        msg: ""
                    });
                }

            });

        }

    });

});

async function checkValidLogIn(emailAddress, password) {

    let sqlQuery = "SELECT EXISTS(SELECT * FROM USER WHERE EmailAddress = '" + emailAddress + "' AND Password = '" + password + "') AS result;"

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                reject("Error executing the query: " + JSON.stringify(err));
            } else {
                result = JSON.stringify(result[0].result);
                resolve(result);
            }
        });

    });

}

async function checkValidEmailAddress(emailAddress) {

    let sqlQuery = "SELECT EXISTS(SELECT * FROM USER WHERE EmailAddress = '" + emailAddress + "') AS result;"

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                reject("Error executing the query: " + JSON.stringify(err));
            } else {
                result = JSON.stringify(result[0].result);
                resolve(result);
            }
        });

    });

}

app.use("/API/testNode", function(req, res, next) {

    pool.query("CREATE TABLE Persons (PersonID int, LastName varchar(255), FirstName varchar(255), Address varchar(255), City varchar(255));")


    res.status(200).json({

        success: true, //setting success to true
        error: "", //send an error message if there is an error
        data: null, //sending data back to client (in this case, no data)
        msg: "" //send a message to the client if any

    });
});

app.use("/API/testSendEmail", function(req, res, next) {


    var mailOptions = {
        from: 'tipoumgropoum@gmail.com',
        to: 'farhaanbeeharry.ms@gmail.com',
        subject: 'Test Email via Node.JS',
        html: '<h1>Welcome</h1><p>That was easy!</p>'
    };

    transporter.sendMail(mailOptions, function(error, info) {

        if (error) {
            console.log(error);
        } else {
            console.log('Email sent:' + info.response)
        }
    });

});

module.exports = app;