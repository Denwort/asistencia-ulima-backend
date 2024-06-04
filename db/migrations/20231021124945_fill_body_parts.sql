-- migrate:up

INSERT INTO body_parts (id, name) VALUES (1, "ABDOMEN");
INSERT INTO body_parts (id, name) VALUES (2, "PIERNAS");
INSERT INTO body_parts (id, name) VALUES (3, "PANTORRILLA");
INSERT INTO body_parts (id, name) VALUES (4, "PECTORAL");
INSERT INTO body_parts (id, name) VALUES (5, "ESPALDA");
INSERT INTO body_parts (id, name) VALUES (6, "HOMBROS");
INSERT INTO body_parts (id, name) VALUES (7, "BICEPS");
INSERT INTO body_parts (id, name) VALUES (8, "TRICEPS");

-- migrate:down

DELETE FROM body_parts;
