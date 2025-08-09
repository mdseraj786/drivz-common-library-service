-- V2__add_car_and_color.sql - Add car and color tables with relationships

-- Create Color table
CREATE TABLE color (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    name VARCHAR(255) NOT NULL UNIQUE
);

-- Create Car table with relationships to Color and Driver
CREATE TABLE car (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    plate_number VARCHAR(255) NOT NULL UNIQUE,
    brand VARCHAR(255),
    model VARCHAR(255),
    car_type ENUM('XL', 'SEDAN', 'HATCHBACK', 'COMPACT_SUV', 'SUV') NOT NULL,
    color_id BIGINT NOT NULL,
    driver_id BIGINT UNIQUE,
    FOREIGN KEY (color_id) REFERENCES color(id) ON DELETE RESTRICT,
    FOREIGN KEY (driver_id) REFERENCES driver(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create index on color_id for better query performance
-- CREATE INDEX idx_car_color ON car(color_id);

-- Create index on driver_id for better query performance
-- CREATE INDEX idx_car_driver ON car(driver_id);
