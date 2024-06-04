-- migrate:up

CREATE TABLE months (
  id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  name	VARCHAR(15)
);

-- migrate:down

DROP TABLE IF EXISTS months;
