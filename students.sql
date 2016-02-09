CREATE TABLE students (
	_id int not null auto_increment unique,
    s_name varchar(255) not null,
    address varchar(255) not null,
    enail varchar(255),
    phone varchar(255),
    PRIMARY KEY (_id)
) Engine=InnoDb;

DROP TABLE students;
    