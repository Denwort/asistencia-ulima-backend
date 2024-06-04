-- migrate:up

CREATE TABLE exercises_members (
  id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  reps	INTEGER,
  sets	INTEGER,
  exercise_id	INTEGER NOT NULL,
  member_id	INTEGER NOT NULL,
  FOREIGN KEY (member_id) REFERENCES members (id),
  FOREIGN KEY (exercise_id) REFERENCES exercises (id)
);

-- migrate:down

DROP TABLE IF EXISTS exercises_members;