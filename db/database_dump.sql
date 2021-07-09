CREATE DATABASE IGNOSIA;

USE IGNOSIA;

CREATE TABLE USER (
    ID VARCHAR(100) NOT NULL,
    FirstName VARCHAR(32),
    LastName VARCHAR(32),
    EmailAddress VARCHAR(64),
    Password VARCHAR(255),
    DateOfBirth VARCHAR(12),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(256),
    UserToken VARCHAR(255),
    DeviceToken VARCHAR(255),
    FirstTimeUser VARCHAR(10) NOT NULL,
    WebUser VARCHAR(7) NOT NULL,
    MobileUser VARCHAR(7) NOT NULL,
    ResetKey VARCHAR(10),
    Status VARCHAR(14),
    PRIMARY KEY (ID)
);

CREATE TABLE TRANSACTION (
    ID VARCHAR(100) NOT NULL,
    UserID VARCHAR(100) NOT NULL,
    Name VARCHAR(32) NOT NULL,
    Description VARCHAR(256) NOT NULL,
    Amount VARCHAR(24) NOT NULL,
    Date VARCHAR(64) NOT NULL,
    Type VARCHAR(12) NOT NULL,
    Method VARCHAR(12) NOT NULL,
    Deleted VARCHAR(12) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (UserID) REFERENCES USER(ID)
);

CREATE TABLE REQUEST (
    ID VARCHAR(100) NOT NULL,
    ReceivedByUserID VARCHAR(100) NOT NULL,
    DateReceived VARCHAR(64) NOT NULL,
    Name VARCHAR(32) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    Location VARCHAR(100),
    Latitude VARCHAR(20),
    Longitude VARCHAR(20),
    Notes TEXT NOT NULL,
    Deleted VARCHAR(7) NOT NULL,
    Scheduled VARCHAR(7) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ReceivedByUserID) REFERENCES USER(ID)
);

CREATE TABLE SCHEDULE (
    ID VARCHAR(100) NOT NULL,
    CreatedByUserID VARCHAR(100) NOT NULL,
    AssignedUserID VARCHAR(100) NOT NULL,
    CaseID VARCHAR(100) NOT NULL,
    ScheduleName VARCHAR(64) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    Latitude VARCHAR(20),
    Longitude VARCHAR(20),
    Date VARCHAR(12) NOT NULL,
    Time VARCHAR(12) NOT NULL,
    Name VARCHAR(32) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    Notes TEXT NOT NULL,
    Status VARCHAR(32) NOT NULL,
    Deleted VARCHAR(10) NOT NULL,
    CarriedOut VARCHAR(10) NOT NULL,
    Validated VARCHAR(10) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (CreatedByUserID) REFERENCES USER(ID),
    FOREIGN KEY (AssignedUserID) REFERENCES USER(ID)
);

CREATE TABLE EVENT (
    ID VARCHAR(100) NOT NULL,
    CreatedByUserID VARCHAR(100) NOT NULL,
    EventName VARCHAR(64) NOT NULL,
    EventSponsor VARCHAR(255) NOT NULL,
    Date VARCHAR(12) NOT NULL,
    Time VARCHAR(12) NOT NULL,
    BenefittedPeople TEXT NOT NULL,
    Description TEXT NOT NULL,
    Cost VARCHAR(20) NOT NULL,
    Deleted VARCHAR(10) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (CreatedByUserID) REFERENCES USER(ID)
);

CREATE TABLE BENEFICIARY (
    ID VARCHAR(100) NOT NULL,
    ScheduleID VARCHAR(100) NOT NULL,
    FirstName VARCHAR(32) NOT NULL,
    LastName VARCHAR(32) NOT NULL,
    Age VARCHAR(5) NOT NULL,
    Gender VARCHAR(12) NOT NULL,
    NationalID VARCHAR(16) NOT NULL,
    DateOfBirth VARCHAR(12) NOT NULL,
    EmailAddress VARCHAR(255),
    Location VARCHAR(255) NOT NULL,
    Latitude VARCHAR(20),
    Longitude VARCHAR(20),
    ResponsiblePartyName VARCHAR(32),
    ResponsiblePartyRelationship VARCHAR(32),
    QualificationYear VARCHAR(32) NOT NULL,
    School VARCHAR(64) NOT NULL,
    University VARCHAR(64) NOT NULL,
    Skill TEXT NOT NULL,
    WorkExperience TEXT,
    WorkingCapabilities TEXT,
    CurrentWorkplace VARCHAR(64),
    CurrentWorkplaceRole VARCHAR(32),
    MaritalStatus VARCHAR(32) NOT NULL,
    PoliceRecord TEXT,
    ReceivesPension VARCHAR(32) NOT NULL,
    SocialAid VARCHAR(32) NOT NULL,
    HomePhone VARCHAR(20) NOT NULL,
    MobilePhone VARCHAR(20) NOT NULL,
    WorkFromDate VARCHAR(12),
    WorkToDate VARCHAR(12),
    Salary VARCHAR(10),
    NumberOfChildren VARCHAR(5) NOT NULL,
    Notes TEXT,
    status VARCHAR(12) NOT NULL,
    Validated VARCHAR(10) NOT NULL,
    Rejected VARCHAR(10) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ScheduleID) REFERENCES SCHEDULE(ID)
);

CREATE TABLE NOTIFICATION (
    ID VARCHAR(100) NOT NULL,
    NotificationFrom VARCHAR(100) NOT NULL,
    NotificationTo VARCHAR(100) NOT NULL,
    Title VARCHAR(255) NOT NULL,
    Description TEXT NOT NULL,
    Date VARCHAR(12) NOT NULL,
    readStatus VARCHAR(6) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (NotificationFrom) REFERENCES USER(ID),
    FOREIGN KEY (NotificationTo) REFERENCES USER(ID)
);

CREATE TABLE BUG (
    ID VARCHAR(100) NOT NULL,
    ReportedBy VARCHAR(100) NOT NULL,
    Description TEXT NOT NULL,
    Date VARCHAR(12) NOT NULL,
    Solved VARCHAR(7) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ReportedBy) REFERENCES USER(ID)
);

CREATE TABLE MESSAGE (
    ID VARCHAR(100) NOT NULL,
    SenderID VARCHAR(100) NOT NULL,
    ReceiverID VARCHAR(100) NOT NULL,
    TimeAndDate VARCHAR(64) NOT NULL,
    Subject TEXT NOT NULL,
    Content TEXT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (SenderID) REFERENCES USER(ID),
    FOREIGN KEY (ReceiverID) REFERENCES USER(ID)
);

INSERT INTO USER(ID, FirstName, LastName, EmailAddress, Password, DateOfBirth, PhoneNumber, Address, UserToken, DeviceToken, FirstTimeUser, WebUser, MobileUser, ResetKey, Status) VALUES('5153d1c0-bcf1-11eb-997c-d9fd0a38fcfe', 'Admin', 'Ignosia', 'admin@ignosia.com', 'jPSzC9Uv++2cepFUloAkgw==', '30/07/2021','57076881', 'Port-Louis', 'null', 'null', 'false', 'true', 'true', 'null', 'admin');