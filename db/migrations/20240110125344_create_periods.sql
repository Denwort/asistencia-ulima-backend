-- migrate:up

CREATE TABLE periods (
  id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  year_id	INTEGER NOT NULL,
  month_id	INTEGER NOT NULL,
  FOREIGN KEY (month_id) REFERENCES months (id),
  FOREIGN KEY (year_id) REFERENCES years (id)
);

-- migrate:down

DROP TABLE IF EXISTS periods;
