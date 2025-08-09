-- V3__add_location_and_otp.sql - Add location and OTP tables

CREATE TABLE exact_location
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime NOT NULL,
    updated_at datetime NOT NULL,
    latitude DOUBLE NULL,
    longitude DOUBLE NULL,
    CONSTRAINT pk_exactlocation PRIMARY KEY (id)
);

CREATE TABLE named_location
(
    id                BIGINT AUTO_INCREMENT NOT NULL,
    created_at        datetime NOT NULL,
    updated_at        datetime NOT NULL,
    exact_location_id BIGINT NULL,
    name              VARCHAR(255) NULL,
    zip_code          VARCHAR(255) NULL,
    city              VARCHAR(255) NULL,
    country           VARCHAR(255) NULL,
    state             VARCHAR(255) NULL,
    CONSTRAINT pk_namedlocation PRIMARY KEY (id)
);

CREATE TABLE otp
(
    id             BIGINT AUTO_INCREMENT NOT NULL,
    created_at     datetime NOT NULL,
    updated_at     datetime NOT NULL,
    code           VARCHAR(255) NULL,
    sent_to_number VARCHAR(255) NULL,
    CONSTRAINT pk_otp PRIMARY KEY (id)
);



ALTER TABLE named_location
    ADD CONSTRAINT FK_NAMEDLOCATION_ON_EXACT_LOCATION FOREIGN KEY (exact_location_id) REFERENCES exact_location (id);


---- Create NamedLocation table
--CREATE TABLE named_location (
--    id BIGINT AUTO_INCREMENT PRIMARY KEY,
--    created_at DATETIME NOT NULL,
--    updated_at DATETIME NOT NULL,
--    name VARCHAR(255) NOT NULL,
--    city VARCHAR(255),
--    country VARCHAR(255),
--    latitude DOUBLE NOT NULL,
--    longitude DOUBLE NOT NULL
--);
--
---- Create ExactLocation table
--CREATE TABLE exact_location (
--    id BIGINT AUTO_INCREMENT PRIMARY KEY,
--    created_at DATETIME NOT NULL,
--    updated_at DATETIME NOT NULL,
--    latitude DOUBLE NOT NULL,
--    longitude DOUBLE NOT NULL
--);
--
---- Create OTP table
--CREATE TABLE otp (
--    id BIGINT AUTO_INCREMENT PRIMARY KEY,
--    created_at DATETIME NOT NULL,
--    updated_at DATETIME NOT NULL,
--    code VARCHAR(6) NOT NULL,
--    expires_at DATETIME NOT NULL,
--    is_used BOOLEAN DEFAULT FALSE,
--    passenger_id BIGINT,
--    driver_id BIGINT,
--    FOREIGN KEY (passenger_id) REFERENCES passenger(id) ON DELETE CASCADE,
--    FOREIGN KEY (driver_id) REFERENCES driver(id) ON DELETE CASCADE
--);
--
---- Create indexes for better performance
--CREATE INDEX idx_otp_passenger ON otp(passenger_id);
--CREATE INDEX idx_otp_driver ON otp(driver_id);
--CREATE INDEX idx_otp_code ON otp(code);
--CREATE INDEX idx_named_location_name ON named_location(name);
