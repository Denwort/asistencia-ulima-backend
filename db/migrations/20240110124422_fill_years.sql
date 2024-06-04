-- migrate:up

INSERT INTO years (id, name) VALUES (1, 2020);
INSERT INTO years (id, name) VALUES (2, 2021);
INSERT INTO years (id, name) VALUES (3, 2022);
INSERT INTO years (id, name) VALUES (4, 2023);
INSERT INTO years (id, name) VALUES (5, 2024);

-- migrate:down

DELETE FROM years;
