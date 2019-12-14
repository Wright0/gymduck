DROP TABLE bookings;
DROP TABLE members;
DROP TABLE gym_classes;

CREATE TABLE gym_classes (
  id SERIAL primary key,
  name VARCHAR(255),
  class_type VARCHAR(255),
  class_date VARCHAR(255),
  class_time VARCHAR(255)
);

CREATE TABLE members (
  id SERIAL primary key,
  name VARCHAR(225),
  age int,
  membership_type VARCHAR(255),
  status VARCHAR(255)
);

CREATE TABLE bookings (
  id SERIAL primary key,
  member_id INT REFERENCES members(id),
  gym_class_id INT REFERENCES gym_classes(id)
);
