-- migrate:up

INSERT INTO months (id, name) VALUES (1, 'Enero');
INSERT INTO months (id, name) VALUES (2, 'Febrero');
INSERT INTO months (id, name) VALUES (3, 'Marzo');
INSERT INTO months (id, name) VALUES (4, 'Abril');
INSERT INTO months (id, name) VALUES (5, 'Mayo');
INSERT INTO months (id, name) VALUES (6, 'Junio');
INSERT INTO months (id, name) VALUES (7, 'Julio');
INSERT INTO months (id, name) VALUES (8, 'Agosto');
INSERT INTO months (id, name) VALUES (9, 'Septiembre');
INSERT INTO months (id, name) VALUES (10, 'Octubre');
INSERT INTO months (id, name) VALUES (11, 'Noviembre');
INSERT INTO months (id, name) VALUES (12, 'Diciembre');

-- migrate:down

DELETE FROM months;
