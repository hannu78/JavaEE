CREATE TABLE students (
	_id int not null auto_increment unique,
    s_name varchar(255) not null,
    address varchar(255) not null,
    email varchar(255),
    phone varchar(255),
    PRIMARY KEY (_id)
) Engine=InnoDb DEFAULT CHARSET=utf8;

SELECT * FROM students;

DROP TABLE students;
    