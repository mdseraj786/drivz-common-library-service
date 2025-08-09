-- Create Driver table
CREATE TABLE driver (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    name VARCHAR(255) NOT NULL,
    license_number VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(255)
    
);

-- Create Passenger table
CREATE TABLE passenger (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    name VARCHAR(255) NOT NULL
);

-- Create Review table (base table for JOINED inheritance)
CREATE TABLE booking_review (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    content TEXT NOT NULL,
    rating DOUBLE
);

-- Create Booking table with correct booking_status ENUM
CREATE TABLE booking (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    start_time DATETIME,
    end_time DATETIME,
    total_distance BIGINT,
    driver_id BIGINT,
    passenger_id BIGINT,
    review_id BIGINT,
    booking_status ENUM('SCHEDULED', 'CANCELLED', 'CAB_ARRIVED', 'ASSIGNING_DRIVER', 'IN_RIDE', 'COMPLETED') NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES driver(id) ON DELETE SET NULL,
    FOREIGN KEY (passenger_id) REFERENCES passenger(id) ON DELETE SET NULL,
    FOREIGN KEY (review_id) REFERENCES booking_review(id) ON DELETE SET NULL
);

-- Create Passengerbooking_review table (inherits from booking_review in JOINED strategy)
CREATE TABLE passenger_review (
    id BIGINT PRIMARY KEY,
    passenger_review_content TEXT NOT NULL,
    passenger_rating VARCHAR(255) NOT NULL,
    FOREIGN KEY (id) REFERENCES booking_review(id) ON DELETE CASCADE
);


--CREATE TABLE IF NOT EXISTS booking
--(
--    id             BIGINT AUTO_INCREMENT NOT NULL,
--    created_at     datetime NOT NULL,
--    updated_at     datetime NOT NULL,
--    review_id      BIGINT NULL,
--    booking_status ENUM('SCHEDULED','CANCELLED','CAB_ARRIVED','ASSIGNING_DRIVER','IN_RIDE','COMPLETED') ,
--    start_time     datetime NULL,
--    end_time       datetime NULL,
--    total_distance BIGINT NULL,
--    driver_id      BIGINT NULL,
--    passenger_id   BIGINT NULL,
--    CONSTRAINT pk_booking PRIMARY KEY (id)
--);
--
--CREATE TABLE IF NOT EXISTS  booking_review
--(
--    id         BIGINT AUTO_INCREMENT NOT NULL,
--    created_at datetime     NOT NULL,
--    updated_at datetime     NOT NULL,
--    content    VARCHAR(255) NOT NULL,
--    rating DOUBLE NULL,
--    CONSTRAINT pk_booking_review PRIMARY KEY (id)
--);
--
----CREATE TABLE driver
----(
----    id             BIGINT AUTO_INCREMENT NOT NULL,
----    created_at     datetime     NOT NULL,
----    updated_at     datetime     NOT NULL,
----    name           VARCHAR(255) NULL,
----    license_number VARCHAR(255) NOT NULL,
----    CONSTRAINT pk_driver PRIMARY KEY (id)
----);
----
----CREATE TABLE passenger
----(
----    id         BIGINT AUTO_INCREMENT NOT NULL,
----    created_at datetime NOT NULL,
----    updated_at datetime NOT NULL,
----    name       VARCHAR(255) NULL,
----    CONSTRAINT pk_passenger PRIMARY KEY (id)
----);
----
----CREATE TABLE passenger_review
----(
----    id                       BIGINT       NOT NULL,
----    passenger_review_content VARCHAR(255) NOT NULL,
----    passenger_rating         VARCHAR(255) NOT NULL,
----    CONSTRAINT pk_passengerreview PRIMARY KEY (id)
----);
--
----ALTER TABLE driver
----    ADD CONSTRAINT uc_driver_license_number UNIQUE (license_number);
----
----ALTER TABLE booking
----    ADD CONSTRAINT FK_BOOKING_ON_DRIVER FOREIGN KEY (driver_id) REFERENCES driver (id);
----
----ALTER TABLE booking
----    ADD CONSTRAINT FK_BOOKING_ON_PASSENGER FOREIGN KEY (passenger_id) REFERENCES passenger (id);
----
----
----ALTER TABLE passenger_review
----    ADD CONSTRAINT FK_PASSENGERREVIEW_ON_ID FOREIGN KEY (id) REFERENCES booking_review (id);