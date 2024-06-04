-- migrate:up

CREATE TABLE exercises (
  id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  name	VARCHAR(40),
  image_url VARCHAR(50),
  video_url VARCHAR(80),
  description TEXT,
  body_part_id	INTEGER NOT NULL,
  FOREIGN KEY (body_part_id) REFERENCES body_parts (id)
);

-- migrate:down

DROP TABLE IF EXISTS exercises;
