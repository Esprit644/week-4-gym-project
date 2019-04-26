DROP TABLE bookings;
DROP TABLE members;
DROP TABLE sessions;

CREATE TABLE members(
id SERIAL8 PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
phone_number INT4,
email VARCHAR(255)
);

CREATE TABLE sessions(
id SERIAL8 PRIMARY KEY,
session_name VARCHAR(255),
cost INT2,
session_time INT2,
capacity INT2
);

CREATE TABLE bookings(
id SERIAL8 PRIMARY KEY,
member_id INT8 REFERENCES members(id) ON DELETE CASCADE,
session_id INT8 REFERENCES sessions(id) ON DELETE CASCADE
);
