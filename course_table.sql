CREATE TABLE course (
	_id int auto_increment not null unique,
    c_name varchar(255) unique,
    grade float,
    c_info text, 
    PRIMARY KEY (_id)
) Engine=InnoDb;

DROP TABLE course;