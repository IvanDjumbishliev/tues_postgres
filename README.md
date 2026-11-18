The timetable uses separate `classes`, `subjects`, `teachers`, and `rooms` tables so each fact is stored once and lessons can refer to them through foreign keys. The three `UNIQUE` constraints prevent a class from having two lessons in the same slot, a teacher from teaching two lessons at once, and a room from hosting two lessons at once. I left out dates and additional school details because this timetable repeats every week and the assignment only needs to represent lesson slots and their related entities. PostgreSQL rejects the duplicate class slot with:

> ERROR: duplicate key value violates unique constraint "lessons_class_id_weekday_period_key"
> DETAIL: Key (class_id, weekday, period)=(1, Monday, 1) already exists.
