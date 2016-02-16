CREATE TABLE teachers(
	_id int auto_increment not null unique,
    t_name varchar(255),
    email varchar(255),
    phone varchar(255),
    t_subject varchar(255) DEFAULT "generic substitute",
    PRIMARY KEY (_id)
) Engine=InnoDb DEFAULT CHARSET=utf8;

DROP TABLE teachers;

SELECT * FROM teachers;

INSERT INTO user (username, password, enabled) values("admin", "admin", 1);

INSERT INTO teachers (t_name, email, phone, t_subject) VALUES ("Matti Määttä", "matti@maatta.fi", "050-3455667", "Physics");