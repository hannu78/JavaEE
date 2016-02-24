CREATE TABLE rel_table(
	_id int auto_increment not null unique,
    PRIMARY KEY (_id),
    c_id int,
    s_id int,
    t_id int,
    FOREIGN KEY(c_id) REFERENCES course(_id),
    FOREIGN KEY(s_id) REFERENCES students(_id),
    FOREIGN KEY(t_id) REFERENCES teachers(_id)
) Engine=InnoDb DEFAULT CHARSET=utf8;

SELECT * FROM rel_table;

DROP TABLE rel_table;