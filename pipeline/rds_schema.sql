DROP TABLE IF EXISTS origin;
CREATE TABLE origin(
    origin_id INT GENERATED ALWAYS AS IDENTITY,
    longitude FLOAT,
    latitude FLOAT,
    country TEXT,
    continent TEXT,
    PRIMARY KEY (origin_id)
);

DROP TABLE IF EXISTS plant;
CREATE TABLE plant(
    plant_id INT GENERATED ALWAYS AS IDENTITY,
    origin_id INT,
    api_id INT UNIQUE,
    plant_name TEXT,
    scientific_name TEXT,
    cycle TEXT,
    sunlight TEXT,
    PRIMARY KEY (plant_id),
    FOREIGN KEY (origin_id) REFERENCES origin(origin_id)
);

DROP TABLE IF EXISTS botanist;
CREATE TABLE botanist(
    botanist_id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT,
    email TEXT UNIQUE,
    phone INT UNIQUE,
    PRIMARY KEY (botanist_id)
);

DROP TABLE IF EXISTS plant_availability;
CREATE TABLE plant_availability(
    availability_id INT GENERATED ALWAYS AS IDENTITY,
    type_of_availability TEXT UNIQUE,
    PRIMARY KEY (availability_id)
);

DROP TABLE IF EXISTS sensor_result;
CREATE TABLE sensor_result(
    result_id INT GENERATED ALWAYS AS IDENTITY,
    botanist_id INT,
    availability_id INT,
    plant_id INT,
    last_watered TIMESTAMP,
    soil_moisture FLOAT,
    temperature FLOAT,
    recording_taken TIMESTAMP,
    PRIMARY KEY (result_id),
    FOREIGN KEY (botanist_id) REFERENCES botanist(botanist_id),
    FOREIGN KEY (availability_id) REFERENCES plant_availability(availability_id),
    FOREIGN KEY (plant_id) REFERENCES plant(plant_id)
);
