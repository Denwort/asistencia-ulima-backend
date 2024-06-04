-- migrate:up

CREATE TABLE body_parts (
  id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  name	VARCHAR(30)
);

-- migrate:down

DROP TABLE IF EXISTS body_parts;
