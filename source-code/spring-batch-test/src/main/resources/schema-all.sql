

CREATE TABLE IF NOT EXISTS people
(
    person_id  BIGINT NOT NULL AUTO_INCREMENT,
    first_name varchar(20),
    last_name  varchar(20),
    PRIMARY KEY (person_id)
);

