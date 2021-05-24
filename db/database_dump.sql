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
    AccountType VARCHAR(24),
    ResetKey VARCHAR(10),
    Status VARCHAR(14),
    PRIMARY KEY (ID)
);

CREATE TABLE TRANSACTION (
    ID VARCHAR(100) NOT NULL,
    UserID VARCHAR(100) NOT NULL,
    Amount VARCHAR(20) NOT NULL,
    Source VARCHAR(64) NOT NULL,
    Destination VARCHAR(64) NOT NULL,
    Type VARCHAR(24) NOT NULL,
    Date VARCHAR(12) NOT NULL,
    Description TEXT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (UserID) REFERENCES USER(ID)
);

CREATE TABLE REQUEST (
    ID VARCHAR(100) NOT NULL,
    ReceivedByUserID VARCHAR(100) NOT NULL,
    Name VARCHAR(32) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    Location VARCHAR(100),
    Latitude VARCHAR(20),
    Longitude VARCHAR(20),
    Notes TEXT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ReceivedByUserID) REFERENCES USER(ID)
);

CREATE TABLE SCHEDULE (
    ID VARCHAR(100) NOT NULL,
    CreatedByUserID VARCHAR(100) NOT NULL,
    AssignedUserID VARCHAR(100) NOT NULL,
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
    NumberOfChildren VARCHAR(2) NOT NULL,
    Notes TEXT NOT NULL,
    status VARCHAR(12) NOT NULL,
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
    PRIMARY KEY (ID),
    FOREIGN KEY (ReportedBy) REFERENCES USER(ID)
);