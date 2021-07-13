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

                } else if (result == 'false') {

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
                error: "",
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

app.use("/API/web/sendEmailWithSubject", function(req, res, next) {

    var id = req.body.id;
    var senderID = req.body.senderID;
    var recipientID = req.body.recipientID;
    var timeAndDate = req.body.timeAndDate;
    var subject = req.body.subject;
    var content = req.body.content;
    var emailAddress = req.body.emailAddress;

    sendEmailWithSubject(subject, content, emailAddress).then(result => {
        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "Failed to send new member email!",
                data: {},
                msg: ""
            });
        } else if (result == 1) {
            addMessage(id, senderID, recipientID, timeAndDate, subject, content).then(result => {

                if (result == 0) {
                    res.status(200).json({
                        success: false,
                        error: "Failed to keep track of sent email!",
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

app.use("/API/web/alterBeneficiary", function(req, res, next) {

    var id = req.body.id;
    var validated = req.body.validated;
    var rejected = req.body.rejected;

    alterBeneficiary(id, validated, rejected).then(result => {

        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "Failed to alter beneficiary with id '" + id + "'!",
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

app.use("/API/web/addSchedule", function(req, res, next) {

    var id = req.body.id;
    var createdByUserId = req.body.createdByUserId;
    var assignedUserId = req.body.assignedUserId;
    var caseID = req.body.caseID
    var scheduleName = req.body.scheduleName;
    var location = req.body.location;
    var date = req.body.date;
    var time = req.body.time;
    var name = req.body.name;
    var phoneNumber = req.body.phoneNumber;
    var notes = req.body.notes;

    addSchedule(id, createdByUserId, assignedUserId, caseID, scheduleName, location, date, time, name, phoneNumber, notes).then(result => {

        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "",
                data: {},
                msg: ""
            });
        } else if (result == 1) {

            setCaseScheduled(caseID).then(result => {

                if (result == 0) {
                    res.status(200).json({
                        success: false,
                        error: "An error occured while setting case as scheduled!",
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

        }

    });

});

app.use("/API/web/getTransactionList", function(req, res, next) {

    getTransactionList().then(result => {

        if (result == -1) {
            res.status(200).json({
                success: false,
                error: "",
                data: [],
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

app.use("/API/web/getBeneficiaryList", function(req, res, next) {

    getBeneficiaryList().then(result => {

        if (result == -1) {
            res.status(200).json({
                success: false,
                error: "",
                data: [],
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

app.use("/API/web/getMobileUsersList", function(req, res, next) {

    getMobileUsersList().then(result => {

        if (result == -1) {
            res.status(200).json({
                success: false,
                error: "",
                data: [],
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

app.use("/API/web/deleteSchedule", function(req, res, next) {

    var id = req.body.id;
    deleteSchedule(id).then(result => {

        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "An error occured while trying to delete schedule with ID '" + id + "'",
                data: {},
                msg: ""
            });
        } else {

            getCaseID(id).then(result => {
                if (result == -1) {
                    res.status(200).json({
                        success: false,
                        error: "",
                        data: [],
                        msg: ""
                    });
                } else {

                    setCaseUnscheduled(result).then(result => {
                        if (result == 0) {
                            res.status(200).json({
                                success: false,
                                error: "An error occured while setting case as scheduled!",
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

                }
            });



        }
    });

});

app.use("/API/web/deleteCase", function(req, res, next) {

    var id = req.body.id;
    deleteCase(id).then(result => {

        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "An error occured while trying to delete case with ID '" + id + "'",
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

app.use("/API/web/markScheduleCompleted", function(req, res, next) {

    var id = req.body.id;
    markScheduleCompleted(id).then(result => {

        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "An error occured while trying to mark schedule with ID '" + id + "' as completed!",
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

app.use("/API/web/getBalance", function(req, res, next) {


    var balance = 0;
    var status = "neutral";

    getBalance().then(result => {

        if (result == -1) {
            res.status(200).json({
                success: false,
                error: "Failed to fetch current balance!",
                data: {},
                msg: ""
            });
        } else {
            for (let i = 0; i < result.length; i++) {
                result[i]['Type'] == 'income' ? balance += parseInt(result[i]['Amount']) : balance -= parseInt(result[i]['Amount']);
            }

            if (balance < 0) {
                status = "loss";
            } else if (balance == 0) {
                status = "neutral";
            } else if (balance > 0) {
                status = "profit";
            }

            res.status(200).json({
                success: true,
                error: "",
                data: {
                    "balance": balance,
                    "status": status
                },
                msg: ""
            });
        }
    });

});

app.use("/API/web/createEvent", function(req, res, next) {

    var id = req.body.ID;
    var createdBy = req.body.createdBy;
    var eventName = req.body.eventName;
    var sponsorName = req.body.sponsorName;
    var createdFor = req.body.createdFor;
    var cost = req.body.cost;
    var date = req.body.date;
    var time = req.body.time;
    var description = req.body.description;

    createEvent(id, createdBy, eventName, sponsorName, createdFor, cost, date, time, description).then(result => {
        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "Failed to create event!",
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

app.use("/API/web/createCase", function(req, res, next) {

    var id = req.body.id;
    var createdBy = req.body.createdByUserID;
    var dateCreated = req.body.dateCreated;
    var name = req.body.name;
    var phoneNumber = req.body.phoneNumber;
    var location = req.body.location;
    var latitude = req.body.latitude;
    var longitude = req.body.longitude;
    var notes = req.body.notes;

    createCase(id, createdBy, dateCreated, name, phoneNumber, location, latitude, longitude, notes).then(result => {
        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "Failed to create event!",
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

app.use("/API/web/getEventList", function(req, res, next) {

    getEventList().then(result => {


        if (result == -1) {
            res.status(200).json({
                success: false,
                error: "",
                data: [],
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

app.use("/API/web/getCaseList", function(req, res, next) {

    getCaseList().then(result => {

        if (result == -1) {
            res.status(200).json({
                success: false,
                error: "",
                data: [],
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

app.use("/API/web/getBeneficiary", function(req, res, next) {

    var id = req.body.id;

    getBeneficiary(id).then(result => {

        if (result == -1) {
            res.status(200).json({
                success: false,
                error: "",
                data: [],
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



app.use("/API/web/getScheduleList", function(req, res, next) {

    getScheduleList().then(result => {

        if (result == -1) {
            res.status(200).json({
                success: false,
                error: "",
                data: [],
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
app.use("/API/web/getBeneficiaryFromSchedule", function(req, res, next) {


    var scheduleID = req.body.scheduleID;

    getBeneficiaryFromSchedule(scheduleID).then(result => {

        if (result == -1) {
            res.status(200).json({
                success: false,
                error: "",
                data: [],
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

app.use("/API/web/getCarriedOutSchedules", function(req, res, next) {

    getCarriedOutSchedules().then(result => {

        if (result == -1) {
            res.status(200).json({
                success: false,
                error: "",
                data: [],
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

app.use("/API/web/deleteEvent", function(req, res, next) {

    var id = req.body.id;
    deleteEvent(id).then(result => {

        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "An error occured while trying to delete event with ID '" + id + "'",
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

app.use("/API/web/deleteBeneficiary", function(req, res, next) {



    var id = req.body.id;
    deleteBeneficiary(id).then(result => {

        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "An error occured while trying to delete beneficiary with ID '" + id + "'",
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

app.use("/API/web/getDashboardData", function(req, res, next) {

    getDashboardData().then(result => {

        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "An error occured while trying to get dashboard's data",
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

app.use("/API/web/getRecentTransactionData", function(req, res, next) {

    getDashboardransactionList().then(result => {

        if (result == -1) {
            res.status(200).json({
                success: false,
                error: "An error occured while trying to get transaction list",
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

async function getDashboardData() {
    let sqlQuery = "SELECT (SELECT COUNT(ID) FROM User) as members, (SELECT COUNT(ID) FROM Request WHERE Scheduled = 'false') as cases, (SELECT COUNT(ID) FROM Beneficiary) as beneficiaries, (SELECT COUNT(ID) FROM Event WHERE Deleted = 'false') as events";

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

async function deleteEvent(id) {
    let sqlQuery = "UPDATE Event SET Deleted = 'true' WHERE ID = '" + id + "';";

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

async function deleteBeneficiary(id) {
    let sqlQuery = "UPDATE Beneficiary SET Deleted = 'true' WHERE ID = '" + id + "';";

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

async function setCaseUnscheduled(id) {
    let sqlQuery = "UPDATE Request SET Scheduled = 'false' WHERE ID = '" + id + "';";

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

async function setCaseScheduled(id) {
    let sqlQuery = "UPDATE Request SET Scheduled = 'true' WHERE ID = '" + id + "';";

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

async function getEventList() {
    let sqlQuery = "SELECT Event.ID, Event.CreatedByUserID, Event.EventName, Event.EventSponsor, Event.Date, Event.Time, Event.BenefittedPeople, Event.Description, Event.Cost, Event.Deleted, User.FirstName, User.LastName FROM Event INNER JOIN User ON Event.CreatedByUserID = User.ID  WHERE Deleted = 'false' ";

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

async function getCaseList() {
    let sqlQuery = "SELECT Request.ReceivedByUserID,  Request.ID, Request.DateReceived, Request.Name, Request.PhoneNumber, Request.Location, Request.Latitude, Request.Longitude, Request.Notes, Request.Deleted, Request.Scheduled, User.FirstName, User.LastName FROM Request INNER JOIN User ON Request.ReceivedByUserID = User.ID  WHERE Deleted = 'false' ";

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

async function getBeneficiary(id) {
    let sqlQuery = "SELECT * FROM Beneficiary WHERE ID = '" + id + "';";

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {

            if (err) {
                resolve(-1);
            } else {
                resolve(result[0]);
            }
        });

    });
}

async function getCaseID(id) {
    let sqlQuery = "SELECT * FROM Schedule WHERE ID = '" + id + "';";

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {

            if (err) {
                resolve(-1);
            } else {
                resolve(result[0].CaseID);
            }
        });

    });
}

async function getScheduleList() {
    let sqlQuery = "SELECT Schedule.ID, Schedule.CreatedByUserID, Schedule.AssignedUserID, Schedule.ScheduleName, Schedule.Location, Schedule.Latitude, Schedule.Longitude, Schedule.Date, Schedule.Time, Schedule.Name, Schedule.PhoneNumber, Schedule.Notes, Schedule.Status, Schedule.Deleted, Schedule.CarriedOut, CreatedBy.FirstName AS CreatedByFirstName, CreatedBy.LastName AS CreatedByLastName, AssignedTo.FirstName AS AssignedToFirstName, AssignedTo.LastName AS AssignedToLastName FROM Schedule INNER JOIN User AS CreatedBy ON Schedule.CreatedByUserID = CreatedBy.ID INNER JOIN User AS AssignedTo ON Schedule.AssignedUserID = AssignedTo.ID WHERE Deleted = 'false' AND CarriedOut ='false';";
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

async function getBeneficiaryFromSchedule(scheduleID) {
    let sqlQuery = "SELECT * FROM Beneficiary WHERE ScheduleID = '" + scheduleID + "' AND Validated = 'false' AND Rejected = 'false';";
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

async function getCarriedOutSchedules() {
    let sqlQuery = "SELECT * FROM Schedule WHERE Deleted = 'false' AND CarriedOut ='true' AND Validated = 'false';";
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

async function addMessage(id, senderID, recipientID, timeAndDate, subject, content) {


    let sqlQuery = "INSERT INTO MESSAGE(ID, SenderID, ReceiverID, TimeAndDate, Subject, Content) VALUES ('" + id + "', '" + senderID + "', '" + recipientID + "', '" + timeAndDate + "', '" + subject + "', '" + content + "');"

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

async function createEvent(id, createdBy, eventName, sponsorName, createdFor, cost, date, time, description) {
    let sqlQuery = "INSERT INTO Event (ID, CreatedByUserID, EventName, EventSponsor, Date, Time, BenefittedPeople, Description, Cost, Deleted) VALUES ('" + id + "', '" + createdBy + "', '" + eventName + "', '" + sponsorName + "', '" + date + "', '" + time + "', '" + createdFor + "', '" + description + "', '" + cost + "', 'false');"

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

async function createCase(id, createdBy, dateCreated, name, phoneNumber, location, latitude, longitude, notes) {
    let sqlQuery = "INSERT INTO Request (ID, ReceivedByUserID, DateReceived, Name, PhoneNumber, Location, Latitude, Longitude, Notes, Deleted, Scheduled) VALUES ('" + id + "', '" + createdBy + "', '" + dateCreated + "', '" + name + "', '" + phoneNumber + "', '" + location + "', '" + latitude + "', '" + longitude + "', '" + notes + "', 'false', 'false');"

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

async function getBalance() {
    let sqlQuery = "SELECT Amount, Type FROM Transaction WHERE Deleted = 'false';";

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

async function deleteSchedule(id) {
    let sqlQuery = "UPDATE Schedule SET Deleted = 'true' WHERE ID = '" + id + "';";

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

async function deleteCase(id) {
    let sqlQuery = "UPDATE Request SET Deleted = 'true' WHERE ID = '" + id + "';";

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

async function markScheduleCompleted(id) {
    let sqlQuery = "UPDATE Schedule SET Validated = 'true' WHERE ID = '" + id + "';";

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

async function addSchedule(id, createdByUserId, assignedUserId, caseID, scheduleName, location, date, time, name, phoneNumber, notes) {
    let sqlQuery = "INSERT INTO Schedule (ID, CreatedByUserID, AssignedUserID, CaseID, ScheduleName, Location, Latitude, Longitude, Date, Time, Name, PhoneNumber, Notes, Status, Deleted, CarriedOut, Validated) VALUES ('" + id + "', '" + createdByUserId + "', '" + assignedUserId + "', '" + caseID + "', '" + scheduleName + "', '" + location + "', 'null', 'null', '" + date + "', '" + time + "', '" + name + "', '" + phoneNumber + "', '" + notes + "', 'null', 'false', 'false', 'false');";

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                console.log(err);
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

async function alterBeneficiary(id, validated, rejected) {
    let sqlQuery = "UPDATE Beneficiary SET Validated = '" + validated + "', Rejected = '" + rejected + "' WHERE ID = '" + id + "';";

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
    let sqlQuery = "UPDATE USER SET Status = 'deleted' WHERE ID = '" + id + "';";

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

async function getDashboardransactionList() {
    let sqlQuery = "SELECT * FROM Transaction WHERE Deleted = 'false';";

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


async function getBeneficiaryList() {
    let sqlQuery = "SELECT * FROM Beneficiary WHERE Validated = 'true';";

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
async function getMobileUsersList() {
    let sqlQuery = "SELECT * FROM User WHERE MobileUser = 'true' AND FirstTimeUser = 'false' AND (Status = 'active' OR Status = 'admin');";

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

async function sendEmailWithSubject(subject, content, emailAddress) {
    var mailOptions = {
        from: '"Support" <support@ignosia.com>',
        to: emailAddress,
        subject: subject,
        html: content,
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


/**
 
-------------------------------- MOBILE API --------------------------------

**/

app.use("/API/mobile/login", function(req, res, next) {

    console.log(req.body)

    var emailAddress = req.body.emailAddress;
    var password = req.body.password;

    checkExistingAccountMobile(emailAddress).then(result => {
        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "Account does not exist!",
                data: {},
                msg: ""
            });
        } else if (result == 1) {
            checkValidMobileLogin(emailAddress, password).then(result => {
                if (result == 0) {
                    res.status(200).json({
                        success: false,
                        error: "Password does not match!",
                        data: {},
                        msg: ""
                    });
                } else if (result == 1) {

                    getMobileUserData(emailAddress).then(result => {

                        if (result == 0) {
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

                }


            });
        }
    });




});

async function checkExistingAccountMobile(emailAddress) {
    let sqlQuery = "SELECT EXISTS(SELECT * FROM User WHERE EmailAddress = '" + emailAddress + "' AND MobileUser = 'true') AS result;";

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                resolve(0);
            } else {
                resolve(result[0]['result']);
            }
        });

    });
}

async function checkValidMobileLogin(emailAddress, password) {
    let sqlQuery = "SELECT EXISTS(SELECT * FROM User WHERE EmailAddress = '" + emailAddress + "' AND Password = '" + password + "') AS result;";

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                resolve(0);
            } else {
                resolve(result[0]['result']);
            }
        });

    });
}

async function getMobileUserData(emailAddress) {
    let sqlQuery = "SELECT ID, FirstName, LastName, EmailAddress, DateOfBirth, PhoneNumber, Address, FirstTimeUser FROM User WHERE EmailAddress = '" + emailAddress + "';";

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                resolve(0);
            } else {
                resolve(result[0]);
            }
        });

    });
}
app.use("/API/mobile/getRecipientList", function(req, res, next) {


    getRecipientList().then(result => {
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

async function getRecipientList() {
    let sqlQuery = "SELECT ID, FirstName, LastName, EmailAddress FROM User WHERE Status = 'active';";

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

app.use("/API/mobile/sendEmail", function(req, res, next) {

    var id = req.body.id;
    var senderID = req.body.senderID;
    var recipientID = req.body.recipientID;
    var timeAndDate = req.body.timeAndDate;
    var subject = req.body.subject;
    var content = req.body.content;
    var emailAddress = req.body.emailAddress;

    sendEmailWithSubject(subject, content, emailAddress).then(result => {
        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "Failed to send new member email!",
                data: {},
                msg: ""
            });
        } else if (result == 1) {
            addMessage(id, senderID, recipientID, timeAndDate, subject, content).then(result => {

                if (result == 0) {
                    res.status(200).json({
                        success: false,
                        error: "Failed to keep track of sent email!",
                        data: {},
                        msg: ""
                    });
                } else if (result == 1) {
                    res.status(200).json({
                        success: true,
                        error: "",
                        data: {},
                        msg: "Your email has been sent successfully!"
                    });
                }

            });
        }
    });


});


app.use("/API/mobile/getEventList", function(req, res, next) {


    getEventList().then(result => {
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


app.use("/API/mobile/getScheduleForUser", function(req, res, next) {

    var userID = req.body.userID;

    getScheduleForUser(userID).then(result => {
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

async function getScheduleForUser(userID) {
    let sqlQuery = "SELECT * FROM Schedule WHERE AssignedUserID = '" + userID + "' AND Deleted = 'false' AND CarriedOut = 'false';";

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

app.use("/API/mobile/setScheduleDone", function(req, res, next) {

    var scheduleID = req.body.scheduleID;

    setScheduleDone(scheduleID).then(result => {
        if (result == -1) {
            res.status(200).json({
                success: false,
                error: "Failed to set schedule as completed!",
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

async function setScheduleDone(scheduleID) {
    let sqlQuery = "UPDATE Schedule SET CarriedOut = 'true' WHERE ID = '" + scheduleID + "';";

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                resolve(-1);
            } else {
                resolve(1);
            }
        });

    });
}


app.use("/API/mobile/getFamilyMembers", function(req, res, next) {

    var scheduleID = req.body.scheduleID;

    getFamilyMembers(scheduleID).then(result => {
        if (result == -1) {
            res.status(200).json({
                success: false,
                error: "Failed to get family members!",
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

async function getFamilyMembers(scheduleID) {
    let sqlQuery = "SELECT * FROM Beneficiary WHERE ScheduleID = '" + scheduleID + "' AND Deleted = 'false';";

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

app.use("/API/mobile/addFamilyMember", function(req, res, next) {

    var scheduleID = req.body.scheduleID;
    var beneficiaryID = req.body.beneficiaryID;

    addFamilyMember(beneficiaryID, scheduleID).then(result => {
        if (result == -1) {
            res.status(200).json({
                success: false,
                error: "Failed to get family members!",
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

async function addFamilyMember(beneficiaryID, scheduleID) {
    let sqlQuery = "INSERT INTO Beneficiary VALUES('" + beneficiaryID + "', '" + scheduleID + "', 'New', 'family member', '00', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'active', 'false', 'false', 'false');";

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                resolve(-1);
            } else {
                resolve(1);
            }
        });

    });
}

app.use("/API/mobile/deleteBeneficiary", function(req, res, next) {


    var id = req.body.beneficiaryID;
    deleteBeneficiary(id).then(result => {

        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "An error occured while trying to delete beneficiary with ID '" + id + "'",
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

app.use("/API/mobile/saveBeneficiaryData", function(req, res, next) {

    var id = req.body.id;
    var firstName = req.body.firstName;
    var lastName = req.body.lastName;
    var age = req.body.age;
    var gender = req.body.gender;
    var nationalID = req.body.nationalID;
    var dateOfBirth = req.body.dateOfBirth;
    var emailAddress = req.body.emailAddress;
    var location = req.body.location;
    var latitude = req.body.latitude;
    var longitude = req.body.longitude;
    var responsiblePartyName = req.body.responsiblePartyName;
    var responsiblePartyRelationship = req.body.responsiblePartyRelationship;
    var qualificationYear = req.body.qualificationYear;
    var school = req.body.school;
    var university = req.body.university;
    var skill = req.body.skill;
    var workExperience = req.body.workExperience;
    var workingCapabilities = req.body.workingCapabilities;
    var currentWorkplace = req.body.currentWorkplace;
    var currentWorkplaceRole = req.body.currentWorkplaceRole;
    var maritalStatus = req.body.maritalStatus;
    var policeRecord = req.body.policeRecord;
    var receivesPension = req.body.receivesPension;
    var socialAid = req.body.socialAid;
    var homePhone = req.body.homePhone;
    var mobilePhone = req.body.mobilePhone;
    var workFromDate = req.body.workFromDate;
    var workToDate = req.body.workToDate;
    var salary = req.body.salary;
    var numberOfChildren = req.body.numberOfChildren;
    var notes = req.body.notes;

    saveBeneficiaryData(id, firstName, lastName, age, gender, nationalID, dateOfBirth, emailAddress, location, latitude, longitude, responsiblePartyName, responsiblePartyRelationship, qualificationYear, school, university, skill, workExperience, workingCapabilities, currentWorkplace, currentWorkplaceRole, maritalStatus, policeRecord, receivesPension, socialAid, homePhone, mobilePhone, workFromDate, workToDate, salary, numberOfChildren, notes).then(result => {
        if (result == -1) {
            res.status(200).json({
                success: false,
                error: firstName == "null" ? "Failed to update new member's data!" : "Failed to update " + firstName + "'s data!",
                data: {},
                msg: ""
            });
        } else {
            res.status(200).json({
                success: true,
                error: "",
                data: {},
                msg: "Data saved/updated successfully!"
            });
        }
    });


});

async function saveBeneficiaryData(id, firstName, lastName, age, gender, nationalID, dateOfBirth, emailAddress, location, latitude, longitude, responsiblePartyName, responsiblePartyRelationship, qualificationYear, school, university, skill, workExperience, workingCapabilities, currentWorkplace, currentWorkplaceRole, maritalStatus, policeRecord, receivesPension, socialAid, homePhone, mobilePhone, workFromDate, workToDate, salary, numberOfChildren, notes) {
    let sqlQuery = "UPDATE beneficiary SET FirstName = '" + firstName + "', LastName = '" + lastName + "', Age = '" + age + "', Gender = '" + gender + "', NationalID = '" + nationalID + "', DateOfBirth = '" + dateOfBirth + "', EmailAddress = '" + emailAddress + "', Location = '" + location + "', Latitude = '" + latitude + "', Longitude = '" + longitude + "', ResponsiblePartyName = '" + responsiblePartyName + "', ResponsiblePartyRelationship = '" + responsiblePartyRelationship + "', QualificationYear = '" + qualificationYear + "', School = '" + school + "', University = '" + university + "', Skill = '" + skill + "', WorkExperience = '" + workExperience + "', WorkingCapabilities = '" + workingCapabilities + "', CurrentWorkplace = '" + currentWorkplace + "', CurrentWorkplaceRole = '" + currentWorkplaceRole + "', MaritalStatus = '" + maritalStatus + "', PoliceRecord = '" + policeRecord + "', ReceivesPension = '" + receivesPension + "', SocialAid = '" + socialAid + "', HomePhone = '" + homePhone + "', MobilePhone = '" + mobilePhone + "', WorkFromDate = '" + workFromDate + "', WorkToDate = '" + workToDate + "', Salary = '" + salary + "', NumberOfChildren = '" + numberOfChildren + "', Notes = '" + notes + "' WHERE ID = '" + id + "';";

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                resolve(-1);
            } else {
                resolve(1);
            }
        });

    });
}

app.use("/API/mobile/forgotPassword", function(req, res, next) {

    var emailAddress = req.body.emailAddress;
    var rawPassword = req.body.rawPassword;
    var password = req.body.password;

    checkExistingAccountMobile(emailAddress).then(result => {
        if (result == 0) {
            res.status(200).json({
                success: false,
                error: "Account does not exist!",
                data: {},
                msg: ""
            });
        } else if (result == 1) {
            resetMobilePassword(emailAddress, rawPassword, password).then(result => {

                if (result == -1) {
                    res.status(200).json({
                        success: false,
                        error: "Failed to email new password!",
                        data: {},
                        msg: ""
                    });
                } else if (result == 1) {
                    emailNewPassword(emailAddress, rawPassword).then(result => {
                        if (result == 0) {
                            res.status(200).json({
                                success: false,
                                error: "Failed to email new password!",
                                data: {},
                                msg: ""
                            });
                        } else {
                            res.status(200).json({
                                success: true,
                                error: "Failed to email new password!",
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

async function resetMobilePassword(emailAddress, rawPassword, password) {
    let sqlQuery = "UPDATE user SET Password = '" + password + "' WHERE EmailAddress = '" + emailAddress + "';";

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

async function emailNewPassword(emailAddress, password) {
    var mailOptions = {
        from: '"Support" <support@ignosia.com>',
        to: emailAddress,
        subject: 'Your new password',
        html: '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office"><link type="text/css" rel="stylesheet" id="dark-mode-custom-link"> <link type="text/css" rel="stylesheet" id="dark-mode-general-link"> <style lang="en" type="text/css" id="dark-mode-custom-style"></style><style lang="en" type="text/css" id="dark-mode-native-style"></style> <head>  <meta charset="UTF-8"> <meta content="width=device-width, initial-scale=1" name="viewport"><meta name="x-apple-disable-message-reformatting"> <meta http-equiv="X-UA-Compatible" content="IE=edge"> <meta content="telephone=no" name="format-detection"><title></title> </head> <body> <div class="es-wrapper-color"> <table class="es-right" cellspacing="0" cellpadding="0" align="right"> <tbody> <tr> <td class="esd-container-frame" width="270" align="left"> </td> </tr> </tbody></table></td></tr></table> </td> </tr></tbody>    </table>   </td> </tr>  </tbody> </table> <table class="es-content" cellspacing="0" cellpadding="0" align="center">  <tbody>  <tr> <td class="esd-stripe" style="background-color: #fafafa;" bgcolor="#fafafa" align="center"> <table class="es-content-body" style="background-color: #ffffff;" width="600" cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center"> <tbody> <tr><td class="esd-structure es-p40t es-p20r es-p20l" style="background-color: transparent; background-position: left top;" bgcolor="transparent" align="left"><table width="100%" cellspacing="0" cellpadding="0"><tbody> <tr><td class="esd-container-frame" width="560" valign="top" align="center"> <table style="background-position: left top;" width="100%" cellspacing="0" cellpadding="0">  <tbody><tr> <td class="esd-block-image es-p5t es-p5b" align="center" style="font-size:0"> <a target="_blank"><img src="https://tlr.stripocdn.email/content/guids/CABINET_dd354a98a803b60e2f0411e893c82f56/images/23891556799905703.png" alt style="display: block;" width="175"></a> </td>  </tr> <tr><td class="esd-block-text es-p15t es-p15b" align="center"><h1 style="color: #333333; font-size: 20px;"><strong>FORGOT YOUR</strong></h1><h1 style="color: #333333; font-size: 20px;"><strong>&nbsp;PASSWORD?</strong></h1></td> </tr> <tr> <td class="esd-block-text es-p35r es-p40l" align="left"><p style="text-align: center;">Hello ' + emailAddress + '</p>  </td></tr>    <tr><td class="esd-block-text es-p35r es-p40l" align="left"> <p style="text-align: center;">There was a request to change your password!</p> </td> </tr> <tr> <td class="esd-block-button es-p40t es-p40b es-p10r es-p10l" align="center"><span class="es-button-border"><h1>New password: ' + password + '</h1></span></td></tr> <tr><td class="esd-block-text es-p25t es-p40r es-p40l" align="center"><p>If you did not make this request, just ignore this email.<br>Otherwise, please use the reset key above to change your password.</p> </td> </tr> </tbody> </table></td> </tr>  </tbody>  </table></td> </tr><tr><td class="esd-structure es-p20t es-p10r es-p10l" style="background-position: center center;" align="left"> <!--[if mso]><table width="580" cellpadding="0" cellspacing="0"><tr><td width="199" valign="top"><![endif]--> <table class="es-left" cellspacing="0" cellpadding="0" align="left"> <tbody><tr> <td class="esd-container-frame" width="199" align="left">  </td>  </tr>  </tbody>  </table></td><td width="20"></td><td width="361" valign="top"></div>        </body>        </html>',
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

app.use("/API/mobile/signUp", function(req, res, next) {
    var emailAddress = req.body.emailAddress;
    var id = req.body.id;
    var password = req.body.password;
    var location = req.body.location;
    var dateOfBirth = req.body.dateOfBirth;

    signUp(id, password, location, dateOfBirth).then(result => {
        if (result == -1) {
            res.status(200).json({
                success: false,
                error: "Failed to update data!",
                data: {},
                msg: ""
            });
        } else {
            getMobileUserData(emailAddress).then(result => {

                if (result == 0) {
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
        }
    });


});

async function signUp(id, password, location, dateOfBirth) {
    let sqlQuery = "UPDATE user SET Password = '" + password + "', Address = '" + location + "', DateOfBirth = '" + dateOfBirth + "', FirstTimeUser = 'false' WHERE ID = '" + id + "';";

    return new Promise((resolve, reject) => {

        pool.query(sqlQuery, (err, result) => {
            if (err) {
                console.log(err);
                resolve(-1);
            } else {
                resolve(1);
            }
        });

    });
}


module.exports = app;