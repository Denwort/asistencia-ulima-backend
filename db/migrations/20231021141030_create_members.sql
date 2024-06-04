-- migrate:up

CREATE TABLE members (
  id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  code	INTEGER,
  dni	VARCHAR(8),
  names VARCHAR(30),
  last_names VARCHAR(45),
  email VARCHAR(50),
  phone VARCHAR(30),
  image_url VARCHAR(50),
  level_id	INTEGER NOT NULL,
  FOREIGN KEY (level_id) REFERENCES levels (id)
);

-- migrate:down

DROP TABLE IF EXISTS members;
