-- migrate:up

INSERT INTO levels (id, name) VALUES (1, 'SUPERIOR HOMBRE - PRINCIPIANTE');
INSERT INTO levels (id, name) VALUES (2, 'SUPERIOR HOMBRE - INTERMEDIO');

-- migrate:down

DELETE FROM levels;
