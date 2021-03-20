//importing modules from and into node.js
const express = require("express"); //requiring module 'express'
const pool = require("./db"); //importing file 'db' which contains the database's details and authentication
const bodyParser = require("body-parser"); //requiring module 'body-parser' to be able to read data exchanged
const app = express(); //defining express
const nodeMailer = require('nodemailer');
const { response } = require("express");

var transporter = nodeMailer.createTransport({
    name: 'www.ignosia.com',
    host: 'reseller400.webserversystems.com',
    port: '465',
    secure: true,
    auth: {
        user: 'support@ignosia.com',
        pass: 'q4*?7Vh*S@ZY1}z*Q-'
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


app.use("/API/forgotPassword", function(req, res, next) {

    console.log('mo laem kkliki')

    var emailAddress = req.body.emailAddress;

    checkValidEmailAddress(emailAddress).then(result => {

        if (result == 1) {

            addResetKeyToUser(emailAddress).then(result => {


                if (result == 0) {
                    res.status(200).json({
                        success: false,
                        error: "Failed to generate reset key!",
                        data: "",
                        msg: ""
                    });
                } else {
                    emailResetKey(emailAddress, result).then(result => {

                        if (result == 1) {
                            res.status(200).json({
                                success: true,
                                error: "",
                                data: "",
                                msg: ""
                            });
                        } else if (result == 0) {
                            res.status(200).json({
                                success: false,
                                error: "Failed to email your reset key!",
                                data: "",
                                msg: ""
                            });
                        }

                    });
                }

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



});

async function addResetKeyToUser(emailAddress) {
    var resetKey = generateRandomSixNumbers();
    let sqlQuery = "UPDATE USER SET ResetKey = '" + resetKey + "' WHERE EmailAddress = '" + emailAddress + "';";

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                resolve(0);
            } else {
                resolve(resetKey);
            }
        });

    });
}


async function emailResetKey(emailAddress, resetKey) {
    var mailOptions = {
        from: '"Support" <support@ignosia.com>',
        to: emailAddress,
        subject: 'Your Reset Key',
        html: '<h1>Hello from Ignosia.</h1><p>Find below your reset key.<br>' + resetKey + '</p>'
    };


    return new Promise((resolve, reject) => {

        transporter.sendMail(mailOptions, function(error, info) {

            if (error) {
                resolve(0);
            } else {
                resolve(1);
            }
        });

    });


}

function generateRandomSixNumbers() {
    return Math.floor(100000 + Math.random() * 900000);
}


app.use("/API/resetPassword", function(req, res, next) {

    var resetKey = req.body.resetKey;
    var password = req.body.password;
    var emailAddress = req.body.emailAddress;

    checkValidEmailAddress(emailAddress).then(result => {

        if (result == 1) {

            checkResetKey(emailAddress, resetKey).then(result => {

                if (result == 1) {

                    changePassword(emailAddress, password).then(result => {

                        if (result == 0) {
                            res.status(200).json({
                                success: false,
                                error: "Failed to change your password!",
                                data: "",
                                msg: ""
                            });
                        } else if (result == 1) {

                            setKeyToNull(emailAddress).then(result => {

                                if (result == 1) {
                                    res.status(200).json({
                                        success: true,
                                        error: "",
                                        data: "",
                                        msg: ""
                                    });
                                } else if (result == 0) {
                                    res.status(200).json({
                                        success: false,
                                        error: "Failed to set reset key to null",
                                        data: "",
                                        msg: ""
                                    });
                                }
                            });

                        }


                    });

                } else if (result == 0) {
                    res.status(200).json({
                        success: false,
                        error: "Invalid reset key",
                        data: "",
                        msg: ""
                    });
                }

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

});

async function checkResetKey(emailAddress, resetKey) {
    let sqlQuery = "SELECT EXISTS(SELECT * FROM USER WHERE EmailAddress = '" + emailAddress + "' AND ResetKey = '" + resetKey + "') AS result;"

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

async function changePassword(emailAddress, password) {
    let sqlQuery = "UPDATE USER SET Password = '" + password + "' WHERE EmailAddress='" + emailAddress + "';";

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                resolve(0);
            } else {
                resolve(1);
            }
        });

    });

}


async function setKeyToNull(emailAddress) {
    let sqlQuery = "UPDATE USER SET ResetKey = 'null' WHERE EmailAddress = '" + emailAddress + "';";

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                resolve(0);
            } else {
                resolve(1);
            }
        });

    });
}

module.exports = app;