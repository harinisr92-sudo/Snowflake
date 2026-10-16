ALTER ACCOUNT SET CORTEX_ENABLED_CROSS_REGION ='ANY_REGION';
SHOW PARAMETERS LIKE 'CORTEX_ENABLED_CROSS_REGION' IN ACCOUNT;
CREATE DATABASE IF NOT EXISTS HSR_PRACTICE;

CREATE SCHEMA IF NOT EXISTS HSR_PRACTICE.CORE_SCHEMA;

USE DATABASE HSR_PRACTICE;
USE SCHEMA CORE_SCHEMA;
CREATE OR REPLACE TABLE HSR_PRACTICE.CORE_SCHEMA.CUSTOMER (
    CUSTOMER_ID     INTEGER AUTOINCREMENT PRIMARY KEY,
    FIRST_NAME      VARCHAR(100) NOT NULL,
    LAST_NAME       VARCHAR(100) NOT NULL,
    EMAIL           VARCHAR(255) UNIQUE,
    PHONE           VARCHAR(20),
    ADDRESS_LINE1   VARCHAR(255),
    ADDRESS_LINE2   VARCHAR(255),
    CITY            VARCHAR(100),
    STATE           VARCHAR(100),
    POSTAL_CODE     VARCHAR(20),
    COUNTRY         VARCHAR(100),
    CREATED_AT      TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    UPDATED_AT      TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

INSERT INTO CUSTOMER (FIRST_NAME, LAST_NAME, EMAIL, PHONE, ADDRESS_LINE1, CITY, STATE, POSTAL_CODE, COUNTRY)
VALUES
    ('Liam', 'Virtanen', 'liam.virtanen@example.com', '+358401234567', 'Mannerheimintie 10', 'Helsinki', 'Uusimaa', '00100', 'Finland'),
    ('Aino', 'Korhonen', 'aino.korhonen@example.com', '+358407654321', 'Hämeenkatu 5', 'Tampere', 'Pirkanmaa', '33100', 'Finland'),
    ('Elsa', 'Müller', 'elsa.muller@example.com', '+4915112345678', 'Alexanderplatz 1', 'Berlin', 'Berlin', '10178', 'Germany'),
    ('Noah', 'Smith', 'noah.smith@example.com', '+447911123456', 'Baker Street 221B', 'London', 'England', 'NW1 6XE', 'United Kingdom'),
    ('Sofia', 'Laine', 'sofia.laine@example.com', '+358409876543', 'Satamakatu 2', 'Turku', 'Varsinais-Suomi', '20100', 'Finland'),
    ('Lucas', 'Fischer', 'lucas.fischer@example.com', '+4917698765432', 'Marienplatz 8', 'Munich', 'Bavaria', '80331', 'Germany'),
    ('Emma', 'Johansson', 'emma.johansson@example.com', '+46701234567', 'Drottninggatan 15', 'Stockholm', 'Stockholm', '11151', 'Sweden'),
    ('Oliver', 'Nielsen', 'oliver.nielsen@example.com', '+4520123456', 'Strøget 3', 'Copenhagen', 'Capital Region', '1160', 'Denmark'),
    ('Mia', 'Dubois', 'mia.dubois@example.com', '+33601234567', 'Rue de Rivoli 20', 'Paris', 'Île-de-France', '75001', 'France'),
    ('Henri', 'Mäkinen', 'henri.makinen@example.com', '+358405551234', 'Keskuskatu 7', 'Jyväskylä', 'Keski-Suomi', '40100', 'Finland'),
    ('Isabella', 'Rossi', 'isabella.rossi@example.com', '+393471234567', 'Via Roma 12', 'Milan', 'Lombardy', '20121', 'Italy'),
    ('William', 'van Dijk', 'william.vandijk@example.com', '+31612345678', 'Damrak 25', 'Amsterdam', 'North Holland', '1012 LP', 'Netherlands'),
    ('Charlotte', 'García', 'charlotte.garcia@example.com', '+34611223344', 'Gran Vía 30', 'Madrid', 'Madrid', '28013', 'Spain'),
    ('Oskar', 'Nowak', 'oskar.nowak@example.com', '+48601112233', 'Nowy Świat 10', 'Warsaw', 'Masovian', '00-001', 'Poland'),
    ('Freja', 'Hansen', 'freja.hansen@example.com', '+4522334455', 'Vesterbrogade 50', 'Odense', 'Southern Denmark', '5000', 'Denmark');


SELECT * FROM CUSTOMER

show databases;
show SCHEMAS;

show tables;

CREATE OR REPLACE transient TABLE HSR_PRACTICE.CORE_SCHEMA.CUSTOMER_TRANS (
    CUSTOMER_ID     INTEGER AUTOINCREMENT PRIMARY KEY,
    FIRST_NAME      VARCHAR(100) NOT NULL,
    LAST_NAME       VARCHAR(100) NOT NULL,
    EMAIL           VARCHAR(255) UNIQUE,
    PHONE           VARCHAR(20),
    ADDRESS_LINE1   VARCHAR(255),
    ADDRESS_LINE2   VARCHAR(255),
    CITY            VARCHAR(100),
    STATE           VARCHAR(100),
    POSTAL_CODE     VARCHAR(20),
    COUNTRY         VARCHAR(100),
    CREATED_AT      TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    UPDATED_AT      TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

    
CREATE OR REPLACE TEMPORARY TABLE HSR_PRACTICE.CORE_SCHEMA.CUSTOMER_TEMP (
    CUSTOMER_ID     INTEGER AUTOINCREMENT PRIMARY KEY,
    FIRST_NAME      VARCHAR(100) NOT NULL,
    LAST_NAME       VARCHAR(100) NOT NULL,
    EMAIL           VARCHAR(255) UNIQUE,
    PHONE           VARCHAR(20),
    ADDRESS_LINE1   VARCHAR(255),
    ADDRESS_LINE2   VARCHAR(255),
    CITY            VARCHAR(100),
    STATE           VARCHAR(100),
    POSTAL_CODE     VARCHAR(20),
    COUNTRY         VARCHAR(100),
    CREATED_AT      TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    UPDATED_AT      TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);
    CREATE TRANSIENT SCHEMA IF NOT EXISTS HSR_PRACTICE.TRANS_SCHEMA;

CREATE OR REPLACE TABLE HSR_PRACTICE.TRANS_SCHEMA.CUSTOMER (
    CUSTOMER_ID     INTEGER AUTOINCREMENT PRIMARY KEY,
    FIRST_NAME      VARCHAR(100) NOT NULL,
    LAST_NAME       VARCHAR(100) NOT NULL,
    EMAIL           VARCHAR(255) UNIQUE,
    PHONE           VARCHAR(20),
    ADDRESS_LINE1   VARCHAR(255),
    ADDRESS_LINE2   VARCHAR(255),
    CITY            VARCHAR(100),
    STATE           VARCHAR(100),
    POSTAL_CODE     VARCHAR(20),
    COUNTRY         VARCHAR(100),
    CREATED_AT      TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    UPDATED_AT      TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TEMPORARY TABLE HSR_PRACTICE.TRANS_SCHEMA.CUSTOMER_TEMP (
    CUSTOMER_ID     INTEGER AUTOINCREMENT PRIMARY KEY,
    FIRST_NAME      VARCHAR(100) NOT NULL,
    LAST_NAME       VARCHAR(100) NOT NULL,
    EMAIL           VARCHAR(255) UNIQUE,
    PHONE           VARCHAR(20),
    ADDRESS_LINE1   VARCHAR(255),
    ADDRESS_LINE2   VARCHAR(255),
    CITY            VARCHAR(100),
    STATE           VARCHAR(100),
    POSTAL_CODE     VARCHAR(20),
    COUNTRY         VARCHAR(100),
    CREATED_AT      TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    UPDATED_AT      TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

SHOW TABLES

CREATE OR REPLACE TABLE HSR_PRACTICE.CORE_SCHEMA.DUMMY (
    CUSTOMER_ID     INTEGER AUTOINCREMENT PRIMARY KEY,
    FIRST_NAME      VARCHAR(100) NOT NULL,
    LAST_NAME       VARCHAR(100) NOT NULL,
    EMAIL           VARCHAR(255) UNIQUE,
    PHONE           VARCHAR(20),
    CREATED_AT      TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    UPDATED_AT      TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
) DATA_RETENTION_TIME_IN_DAYS=90;


CREATE OR REPLACE TRANSIENT TABLE HSR_PRACTICE.CORE_SCHEMA.DUMMY_TRANS (
    NAME            VARCHAR(100) NOT NULL,
    EMAIL           VARCHAR(255) UNIQUE,
    PHONE           VARCHAR(20),
    CREATED_AT      TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    UPDATED_AT      TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
) DATA_RETENTION_TIME_IN_DAYS=2;