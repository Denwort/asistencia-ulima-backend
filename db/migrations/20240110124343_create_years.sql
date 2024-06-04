-- migrate:up

CREATE TABLE years (
  id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  name	INTEGER
);

-- migrate:down

DROP TABLE IF EXISTS years;
