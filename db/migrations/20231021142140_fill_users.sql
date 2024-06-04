-- migrate:up

INSERT INTO users (id, user, password, member_id) VALUES (1, "20180038", "123", 1);
INSERT INTO users (id, user, password, member_id) VALUES (2, "20202370", "123", 2);
INSERT INTO users (id, user, password, member_id) VALUES (3, "20171869", "123", 3);
INSERT INTO users (id, user, password, member_id) VALUES (4, "20192566", "123", 4);
INSERT INTO users (id, user, password, member_id) VALUES (5, "20202712", "123", 5);
INSERT INTO users (id, user, password, member_id) VALUES (6, "20184660", "123", 6);
INSERT INTO users (id, user, password, member_id) VALUES (7, "20200711", "123", 7);
INSERT INTO users (id, user, password, member_id) VALUES (8, "20194065", "123", 8);
INSERT INTO users (id, user, password, member_id) VALUES (9, "20192303", "123", 9);
INSERT INTO users (id, user, password, member_id) VALUES (10, "20190857", "123", 10);
INSERT INTO users (id, user, password, member_id) VALUES (11, "20182686", "123", 11);
INSERT INTO users (id, user, password, member_id) VALUES (12, "20142881", "123", 12);
INSERT INTO users (id, user, password, member_id) VALUES (13, "20192985", "123", 13);
INSERT INTO users (id, user, password, member_id) VALUES (14, "20201166", "123", 14);
INSERT INTO users (id, user, password, member_id) VALUES (15, "20202407", "123", 15);
INSERT INTO users (id, user, password, member_id) VALUES (16, "30230242", "123", 16);
INSERT INTO users (id, user, password, member_id) VALUES (17, "20191291", "123", 17);
INSERT INTO users (id, user, password, member_id) VALUES (18, "20191301", "123", 18);
INSERT INTO users (id, user, password, member_id) VALUES (19, "20191412", "123", 19);
INSERT INTO users (id, user, password, member_id) VALUES (20, "20152154", "123", 20);
INSERT INTO users (id, user, password, member_id) VALUES (21, "20191937", "123", 21);
INSERT INTO users (id, user, password, member_id) VALUES (22, "20203668", "123", 22);
INSERT INTO users (id, user, password, member_id) VALUES (23, "20203703", "123", 23);
INSERT INTO users (id, user, password, member_id) VALUES (24, "20192003", "123", 24);
INSERT INTO users (id, user, password, member_id) VALUES (25, "20193553", "123", 25);
INSERT INTO users (id, user, password, member_id) VALUES (26, "20162609", "123", 26);
INSERT INTO users (id, user, password, member_id) VALUES (27, "20172768", "123", 27);
INSERT INTO users (id, user, password, member_id) VALUES (28, "20183460", "123", 28);

-- migrate:down

DELETE FROM users;
