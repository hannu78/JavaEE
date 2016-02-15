CREATE TABLE user_roles(
	_id int AUTO_INCREMENT NOT NULL UNIQUE,
    user_id int,
    role varchar(45),
    PRIMARY KEY(_id),
    FOREIGN KEY(user_id) REFERENCES user(_id)
) Engine=InnoDb;

DROP TABLE user_roles;

INSERT INTO user_roles(user_id, role) VALUES(3,"ROLE_ADMIN");

SELECT * FROM user_roles;