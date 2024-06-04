-- migrate:up

CREATE TABLE users (
  id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  user	VARCHAR(30),
  password	VARCHAR(30),
  member_id	INTEGER NOT NULL,
  FOREIGN KEY (member_id) REFERENCES members (id)
);

-- migrate:down

DROP TABLE IF EXISTS users;
