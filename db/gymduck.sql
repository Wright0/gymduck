DROP TABLE bookings;
DROP TABLE members;
DROP TABLE lessons;
DROP TABLE membership_tiers;


CREATE TABLE membership_tiers (
  id SERIAL primary key,
  name VARCHAR(255)
);

CREATE TABLE lessons (
  id SERIAL primary key,
  name VARCHAR(255),
  lesson_tier_id INT REFERENCES membership_tiers(id),
  lesson_date VARCHAR(255),
  lesson_time VARCHAR(255)
);

CREATE TABLE members (
  id SERIAL primary key,
  name VARCHAR(225),
  age int,
  membership_tier_id INT REFERENCES membership_tiers(id),
  membership_status VARCHAR(255)
);

CREATE TABLE bookings (
  id SERIAL primary key,
  member_id INT REFERENCES members(id),
  lesson_id INT REFERENCES lessons(id)
);
