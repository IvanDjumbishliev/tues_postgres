-- What are the periods, subjects, teachers, and rooms for class 9A on Monday?
SELECT
    l.period,
    s.name AS subject,
    t.name AS teacher,
    r.name AS room
FROM lessons AS l
JOIN classes AS c ON c.id = l.class_id
JOIN subjects AS s ON s.id = l.subject_id
JOIN teachers AS t ON t.id = l.teacher_id
JOIN rooms AS r ON r.id = l.room_id
WHERE c.name = '9A'
  AND l.weekday = 'Monday'
ORDER BY l.period;

-- During which weekday and period is room 204 occupied, and which class and teacher are there?
SELECT
    l.weekday AS day,
    l.period,
    c.name AS class,
    t.name AS teacher
FROM lessons AS l
JOIN rooms AS r ON r.id = l.room_id
JOIN classes AS c ON c.id = l.class_id
JOIN teachers AS t ON t.id = l.teacher_id
WHERE r.name = '204'
ORDER BY
    CASE l.weekday
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
    END,
    l.period;
