DROP TABLE bookings;
DROP TABLE gym_classes;
DROP TABLE members;

CREATE TABLE members (
  id SERIAL primary key,
  name VARCHAR(225),
  age int,
  membership_type VARCHAR(255),
  status VARCHAR(255)
);

CREATE TABLE gym_classes (
  id SERIAL primary key,
  name VARCHAR(255),
  class_type VARCHAR(255),
  class_date VARCHAR(255),
  class_time VARCHAR(255)
);

CREATE TABLE bookings (
  id SERIAL primary key,
  member_id INT,
  gym_class_id INT
);
