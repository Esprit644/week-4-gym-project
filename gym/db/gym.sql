DROP TABLE bookings;
DROP TABLE members;
DROP TABLE classes;

CREATE TABLE members(
id SERIAL8 PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
phone_number INT2,
email VARCHAR(255)
);

CREATE TABLE classes(
id SERIAL8 PRIMARY KEY,
class_name VARCHAR(255),
cost INT2,
class_time INT2,
capacity INT2
);

CREATE TABLE bookings(
id SERIAL8 PRIMARY KEY,
member_id INT8 REFERENCES members(id) ON DELETE CASCADE,
class_id INT8 REFERENCES classes(id) ON DELETE CASCADE
);
