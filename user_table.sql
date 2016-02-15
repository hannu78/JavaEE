DROP TABLE IF EXISTS user;

CREATE TABLE user (
  _id int NOT NULL AUTO_INCREMENT UNIQUE,
  username varchar(255) NOT NULL UNIQUE,
  password varchar(255) DEFAULT NULL,
  enabled tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (_id)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE user;

INSERT INTO user (username, password, enabled) values("admin", "admin", 1);

SELECT * FROM user;