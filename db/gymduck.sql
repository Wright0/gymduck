DROP TABLE bookings;
DROP TABLE members;
DROP TABLE lessons;

CREATE TABLE lessons (
  id SERIAL primary key,
  name VARCHAR(255),
  lesson_type VARCHAR(255),
  lesson_date VARCHAR(255),
  lesson_time VARCHAR(255)
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
  lesson_id INT REFERENCES lessons(id)
);
