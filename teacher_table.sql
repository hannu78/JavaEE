CREATE TABLE teachers(
	_id int auto_increment not null unique,
    t_name varchar(255),
    email varchar(255),
    phone varchar(255),
    t_subject varchar(255) DEFAULT "generic substitute",
    PRIMARY KEY (_id)
) Engine=InnoDb;

DROP TABLE teachers;

SELECT * FROM teachers;