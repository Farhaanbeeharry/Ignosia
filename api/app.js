//importing modules from and into node.js
const express = require("express"); //requiring module 'express'
const pool = require("./db"); //importing file 'db' which contains the database's details and authentication
const bodyParser = require("body-parser"); //requiring module 'body-parser' to be able to read data exchanged
const app = express(); //defining express
const nodeMailer = require('nodemailer');
const { response } = require("express");
const e = require("express");

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

app.use("/API/web/login", function(req, res, next) {

    var emailAddress = req.body.emailAddress;
    var password = req.body.password;

    checkValidEmailAddress(emailAddress).then(result => {

        if (result == 1) {
            checkAccountType(emailAddress).then(result => {

                if (result == 'true') {
                    checkValidLogIn(emailAddress, password).then(result => {

                        if (result == 1) {
                            getLoginData(emailAddress).then(result => {

                                res.status(200).json({
                                    success: true,
                                    error: "",
                                    data: result[0],
                                    msg: ""
                                });

                            });
                        } else if (result == 0) {
                            res.status(200).json({
                                success: false,
                                error: "Password does not match!",
                                data: {},
                                msg: ""
                            });
                        }

                    });
                } else if (result == 0) {
                    res.status(200).json({
                        success: false,
                        error: "Account does not exist for web!",
                        data: {},
                        msg: ""
                    });
                }

            });
        } else if (result == 0) {
            res.status(200).json({
                success: false,
                error: "Account does not exist!",
                data: {},
                msg: ""
            });
        }

    });




});

app.use("/API/web/forgotPassword", function(req, res, next) {


    var emailAddress = req.body.emailAddress;

    checkValidEmailAddressAndRegistered(emailAddress).then(result => {

        if (result == 1) {

            addResetKeyToUser(emailAddress).then(result => {


                if (result == 0) {
                    res.status(200).json({
                        success: false,
                        error: "Failed to generate reset key!",
                        data: {},
                        msg: ""
                    });
                } else {
                    emailResetKey(emailAddress, result).then(result => {

                        if (result == 1) {
                            res.status(200).json({
                                success: true,
                                error: "",
                                data: {},
                                msg: ""
                            });
                        } else if (result == 0) {
                            res.status(200).json({
                                success: false,
                                error: "Failed to email your reset key!",
                                data: {},
                                msg: ""
                            });
                        }

                    });
                }

            });

        } else if (result == 0) {
            res.status(200).json({
                success: false,
                error: "Account does not exist or not registered!",
                data: {},
                msg: ""
            });
        }

    });



});

app.use("/API/web/resetPassword", function(req, res, next) {

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
                                data: {},
                                msg: ""
                            });
                        } else if (result == 1) {

                            setKeyToNull(emailAddress).then(result => {

                                if (result == 1) {
                                    res.status(200).json({
                                        success: true,
                                        error: "",
                                        data: {},
                                        msg: ""
                                    });
                                } else if (result == 0) {
                                    res.status(200).json({
                                        success: false,
                                        error: "Failed to set reset key to null",
                                        data: {},
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
                        data: {},
                        msg: ""
                    });
                }

            });


        } else if (result == 0) {
            res.status(200).json({
                success: false,
                error: "Account does not exist!",
                data: {},
                msg: ""
            });
        }

    });

});

app.use("/API/web/createMember", function(req, res, next) {

    var ID = req.body.ID;
    var rawPassword = req.body.rawPassword;
    var password = req.body.password;
    var emailAddress = req.body.emailAddress;
    var firstName = req.body.firstName;
    var lastName = req.body.lastName;
    var phoneNumber = req.body.phoneNumber;
    var webUser = req.body.webUser;
    var mobileUser = req.body.mobileUser;

    checkValidEmailAddress(emailAddress).then(result => {
        if (result == 1) {
            res.status(200).json({
                success: false,
                error: "Account with this email address already exists!",
                data: {},
                msg: ""
            });
        } else if (result == 0) {
            createMember(ID, emailAddress, firstName, lastName, phoneNumber, webUser, mobileUser, password).then(result => {
                if (result == 0) {
                    res.status(200).json({
                        success: false,
                        error: "Failed to create member!",
                        data: {},
                        msg: ""
                    });
                } else if (result == 1) {
                    sendNewMemberEmail(emailAddress, rawPassword).then(result => {
                        if (result == 0) {
                            res.status(200).json({
                                success: false,
                                error: "Failed to send new member email!",
                                data: {},
                                msg: ""
                            });
                        } else if (result == 1) {
                            res.status(200).json({
                                success: true,
                                error: "",
                                data: {},
                                msg: ""
                            });
                        }
                    });
                }
            });
        }
    });

});

app.use("/API/web/signUp", function(req, res, next) {

    var firstName = req.body.firstName;
    var lastName = req.body.lastName;
    var emailAddress = req.body.emailAddress;
    var phoneNumber = req.body.phoneNumber;
    var password = req.body.password;
    var address = req.body.address;
    var dob = req.body.dob;

    updateSignUpInfo(firstName, lastName, emailAddress, phoneNumber, password, address, dob).then(result => {

        if (result == 1) {
            res.status(200).json({
                success: true,
                error: "",
                data: {},
                msg: ""
            });
        } else if (result == 0) {
            res.status(200).json({
                success: false,
                error: "Failed to update your data!",
                data: {},
                msg: ""
            });
        }

    });



});

app.use("/API/web/getMemberList", function(req, res, next) {

    getMemberList().then(result => {

        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "Failed to update your data!",
                data: {},
                msg: ""
            });
        } else {
            res.status(200).json({
                success: true,
                error: "Failed to update your data!",
                data: result,
                msg: ""
            });
        }

    });


});

app.use("/API/web/deleteMember", function(req, res, next) {

    var id = req.body.memberID;

    deleteMember(id).then(result => {

        if (result == 1) {
            res.status(200).json({
                success: true,
                error: "Failed to delete member with ID " + id + "!",
                data: {},
                msg: ""
            });
        } else if (result == 0) {
            res.status(200).json({
                success: false,
                error: "Failed to delete member with ID " + id + "!",
                data: {},
                msg: ""
            });
        }

    });


});

app.use("/API/web/reportBug", function(req, res, next) {

    var id = req.body.id;
    var reportedBy = req.body.reportedBy;
    var bug = req.body.bug;
    var date = req.body.date;

    reportBug(id, reportedBy, bug, date).then(result => {

        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "",
                data: {},
                msg: ""
            });
        } else if (result == 1) {
            res.status(200).json({
                success: true,
                error: "",
                data: {},
                msg: ""
            });
        }

    });

});

app.use("/API/web/updateUserData", function(req, res, next) {

    var id = req.body.id;
    var firstName = req.body.firstName;
    var lastName = req.body.lastName;
    var password = req.body.password;
    var location = req.body.location;
    var emailAddress = req.body.emailAddress;

    updateUserData(id, firstName, lastName, password, location, emailAddress).then(result => {

        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "",
                data: {},
                msg: ""
            });
        } else if (result == 1) {
            res.status(200).json({
                success: true,
                error: "",
                data: {},
                msg: ""
            });
        }

    });

});

app.use("/API/web/newTransaction", function(req, res, next) {

    var id = req.body.id;
    var userID = req.body.userID;
    var name = req.body.name;
    var description = req.body.description;
    var amount = req.body.amount;
    var date = req.body.date;
    var type = req.body.type;
    var method = req.body.method;

    addNewTransaction(id, userID, name, description, amount, date, type, method).then(result => {

        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "",
                data: {},
                msg: ""
            });
        } else if (result == 1) {
            res.status(200).json({
                success: true,
                error: "",
                data: {},
                msg: ""
            });
        }

    });

});

app.use("/API/web/getTransactionList", function(req, res, next) {

    getTransactionList().then(result => {

        if (result == -1) {
            res.status(200).json({
                success: false,
                error: "",
                data: {},
                msg: ""
            });
        } else {
            res.status(200).json({
                success: true,
                error: "",
                data: result,
                msg: ""
            });
        }
    });

});

app.use("/API/web/deleteTransaction", function(req, res, next) {

    var id = req.body.id;
    deleteTransaction(id).then(result => {

        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "An error occured while trying to delete transaction with ID '" + id + "'",
                data: {},
                msg: ""
            });
        } else {
            res.status(200).json({
                success: true,
                error: "",
                data: {},
                msg: ""
            });
        }
    });

});

async function deleteTransaction(id) {
    let sqlQuery = "UPDATE TRANSACTION SET Deleted = 'true' WHERE ID = '" + id + "';";

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

async function addNewTransaction(id, userID, name, description, amount, date, type, method) {
    let sqlQuery = "INSERT INTO TRANSACTION (ID, UserID, Name, Description, Amount, Date, Type, Method, Deleted) VALUES ('" + id + "', '" + userID + "', '" + name + "', '" + description + "', '" + amount + "', '" + date + "', '" + type + "', '" + method + "', 'false');";

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

async function updateUserData(id, firstName, lastName, password, location, emailAddress) {
    let sqlQuery = "UPDATE User SET FirstName = '" + firstName + "', LastName = '" + lastName + "', Password = '" + password + "', Address = '" + location + "', EmailAddress = '" + emailAddress + "' WHERE ID = '" + id + "';";

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


async function reportBug(id, reportedBy, bug, date) {
    let sqlQuery = "INSERT INTO Bug (ID, ReportedBy, Description, Date, Solved) VALUES ('" + id + "', '" + reportedBy + "', '" + bug + "', '" + date + "', 'false');";

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

async function deleteMember(id) {
    let sqlQuery = "DELETE FROM User WHERE ID = '" + id + "';";

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

async function checkValidEmailAddressAndRegistered(emailAddress) {

    let sqlQuery = "SELECT EXISTS(SELECT * FROM USER WHERE EmailAddress = '" + emailAddress + "' AND FirstTimeUser = 'false') AS result;"

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

async function getTransactionList() {
    let sqlQuery = "SELECT * FROM Transaction";

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                resolve(-1);
            } else {
                resolve(result);
            }
        });

    });
}

async function getMemberList() {
    let sqlQuery = "SELECT * FROM User";

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                resolve(0);
            } else {
                resolve(result);
            }
        });

    });
}

async function checkAccountType(emailAddress) {
    let sqlQuery = "SELECT WebUser FROM User WHERE EmailAddress='" + emailAddress + "';"

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                resolve(0);
            } else {
                resolve(result[0].WebUser);
            }
        });

    });
}

async function updateSignUpInfo(firstName, lastName, emailAddress, phoneNumber, password, address, dob) {

    let sqlQuery = "UPDATE USER SET FirstName = '" + firstName + "', LastName = '" + lastName + "', PhoneNumber = '" + phoneNumber + "', Password = '" + password + "', Address = '" + address + "', DateOfBirth = '" + dob + "', FirstTimeUser = 'false'  WHERE EmailAddress = '" + emailAddress + "';";

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

async function getLoginData(emailAddress) {

    let sqlQuery = "SELECT * FROM USER WHERE EmailAddress = '" + emailAddress + "';";


    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                reject("Error executing the query: " + JSON.stringify(err));
            } else {

                resolve(result);
            }
        });

    });

}

async function createMember(ID, emailAddress, firstName, lastName, phoneNumber, webUser, mobileUser, password) {


    let sqlQuery = "INSERT INTO USER(ID, EmailAddress, FirstName, LastName, PhoneNumber, WebUser, MobileUser, Password, Status, FirstTimeUser, DateOfBirth, Address, UserToken, DeviceToken, ResetKey) VALUES ('" + ID + "', '" + emailAddress + "', '" + firstName + "', '" + lastName + "', '" + phoneNumber + "', '" + webUser + "', '" + mobileUser + "', '" + password + "', 'active', 'true', 'null', 'null', 'null', 'null', 'null');"

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                reject("Error executing the query: " + JSON.stringify(err));
                resolve(0);
            } else {
                resolve(1);
            }

        });
    });

}

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

async function sendNewMemberEmail(emailAddress, password) {
    var mailOptions = {
        from: '"Support" <support@ignosia.com>',
        to: emailAddress,
        subject: 'Your Credentials',
        html: '<h1>Welcome!</h1><h2>Your Credentials</h2><p>Email address: ' + emailAddress + '</p><p>Password: ' + password + '</p><p>Login to complete registration step.</p>',
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

async function emailResetKey(emailAddress, resetKey) {
    var mailOptions = {
        from: '"Support" <support@ignosia.com>',
        to: emailAddress,
        subject: 'Your Reset Key',
        html: '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office"><link type="text/css" rel="stylesheet" id="dark-mode-custom-link"> <link type="text/css" rel="stylesheet" id="dark-mode-general-link"> <style lang="en" type="text/css" id="dark-mode-custom-style"></style><style lang="en" type="text/css" id="dark-mode-native-style"></style> <head>  <meta charset="UTF-8"> <meta content="width=device-width, initial-scale=1" name="viewport"><meta name="x-apple-disable-message-reformatting"> <meta http-equiv="X-UA-Compatible" content="IE=edge"> <meta content="telephone=no" name="format-detection"><title></title> </head> <body> <div class="es-wrapper-color"> <table class="es-right" cellspacing="0" cellpadding="0" align="right"> <tbody> <tr> <td class="esd-container-frame" width="270" align="left"> </td> </tr> </tbody></table></td></tr></table> </td> </tr></tbody>    </table>   </td> </tr>  </tbody> </table> <table class="es-content" cellspacing="0" cellpadding="0" align="center">  <tbody>  <tr> <td class="esd-stripe" style="background-color: #fafafa;" bgcolor="#fafafa" align="center"> <table class="es-content-body" style="background-color: #ffffff;" width="600" cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center"> <tbody> <tr><td class="esd-structure es-p40t es-p20r es-p20l" style="background-color: transparent; background-position: left top;" bgcolor="transparent" align="left"><table width="100%" cellspacing="0" cellpadding="0"><tbody> <tr><td class="esd-container-frame" width="560" valign="top" align="center"> <table style="background-position: left top;" width="100%" cellspacing="0" cellpadding="0">  <tbody><tr> <td class="esd-block-image es-p5t es-p5b" align="center" style="font-size:0"> <a target="_blank"><img src="https://tlr.stripocdn.email/content/guids/CABINET_dd354a98a803b60e2f0411e893c82f56/images/23891556799905703.png" alt style="display: block;" width="175"></a> </td>  </tr> <tr><td class="esd-block-text es-p15t es-p15b" align="center"><h1 style="color: #333333; font-size: 20px;"><strong>FORGOT YOUR</strong></h1><h1 style="color: #333333; font-size: 20px;"><strong>&nbsp;PASSWORD?</strong></h1></td> </tr> <tr> <td class="esd-block-text es-p35r es-p40l" align="left"><p style="text-align: center;">Hello ' + emailAddress + '</p>  </td></tr>    <tr><td class="esd-block-text es-p35r es-p40l" align="left"> <p style="text-align: center;">There was a request to change your password!</p> </td> </tr> <tr> <td class="esd-block-button es-p40t es-p40b es-p10r es-p10l" align="center"><span class="es-button-border"><h1>Reset key: ' + resetKey + '</h1></span></td></tr> <tr><td class="esd-block-text es-p25t es-p40r es-p40l" align="center"><p>If you did not make this request, just ignore this email.<br>Otherwise, please use the reset key above to change your password.</p> </td> </tr> </tbody> </table></td> </tr>  </tbody>  </table></td> </tr><tr><td class="esd-structure es-p20t es-p10r es-p10l" style="background-position: center center;" align="left"> <!--[if mso]><table width="580" cellpadding="0" cellspacing="0"><tr><td width="199" valign="top"><![endif]--> <table class="es-left" cellspacing="0" cellpadding="0" align="left"> <tbody><tr> <td class="esd-container-frame" width="199" align="left">  </td>  </tr>  </tbody>  </table></td><td width="20"></td><td width="361" valign="top"></div>        </body>        </html>',
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

function generatePassword() {
    var password = "Password123";
    return password;

}

function generateRandomSixNumbers() {
    return Math.floor(100000 + Math.random() * 900000);
}

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