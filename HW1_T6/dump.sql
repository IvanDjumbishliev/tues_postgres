DROP TABLE IF EXISTS lessons;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS teachers;
DROP TABLE IF EXISTS subjects;
DROP TABLE IF EXISTS classes;

CREATE TABLE classes (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE rooms (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE lessons (
    id SERIAL PRIMARY KEY,
    class_id INT NOT NULL REFERENCES classes (id),
    weekday TEXT NOT NULL CHECK (weekday IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')),
    period INT NOT NULL CHECK (period BETWEEN 1 AND 7),
    subject_id INT NOT NULL REFERENCES subjects (id),
    teacher_id INT NOT NULL REFERENCES teachers (id),
    room_id INT NOT NULL REFERENCES rooms (id),
    UNIQUE (class_id, weekday, period),
    UNIQUE (teacher_id, weekday, period),
    UNIQUE (room_id, weekday, period)
);

INSERT INTO classes (name) VALUES
    ('9A'),
    ('9B');

INSERT INTO subjects (name) VALUES
    ('Mathematics'),
    ('English'),
    ('Science'),
    ('History');

INSERT INTO teachers (name) VALUES
    ('Alex Morgan'),
    ('Jamie Lee'),
    ('Taylor Smith');

INSERT INTO rooms (name) VALUES
    ('204'),
    ('201'),
    ('202');

INSERT INTO lessons (class_id, weekday, period, subject_id, teacher_id, room_id) VALUES
    (1, 'Monday',    1, 1, 1, 1),
    (1, 'Monday',    2, 2, 2, 2),
    (1, 'Monday',    3, 3, 3, 3),
    (1, 'Tuesday',   1, 4, 2, 1),
    (1, 'Tuesday',   2, 1, 1, 2),
    (2, 'Monday',    1, 2, 2, 3),
    (2, 'Monday',    2, 3, 3, 2),
    (2, 'Tuesday',   1, 1, 1, 3),
    (1, 'Wednesday', 1, 2, 2, 1),
    (2, 'Wednesday', 2, 4, 1, 1),
    (1, 'Friday',    1, 3, 3, 1),
    (2, 'Friday',    2, 2, 2, 2);

