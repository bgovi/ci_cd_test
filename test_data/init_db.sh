#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER test_user WITH PASSWORD 'password';
    CREATE DATABASE testdb;
	GRANT ALL PRIVILEGES ON DATABASE testdb TO test_user;
EOSQL


psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "testdb" <<-EOSQL
    CREATE SCHEMA xschema;

    CREATE TABLE xschema.xtable (
        id SERIAL PRIMARY KEY,
        int_column INTEGER,
        text_column TEXT
    );

	GRANT ALL PRIVILEGES ON DATABASE testdb TO test_user;
    GRANT USAGE ON SCHEMA xschema TO test_user;
    GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA xschema TO test_user;
    GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA xschema TO test_user;


    INSERT INTO xschema.xtable (int_column, text_column) VALUES 
    (1, 'Sample Text 1'),
    (2, 'Sample Text 2'),
    (3, 'Sample Text 3'),
    (4, 'Sample Text 4'),
    (5, 'Sample Text 5'),
    (6, 'Sample Text 6'),
    (7, 'Sample Text 7'),
    (8, 'Sample Text 8'),
    (9, 'Sample Text 9'),
    (10, 'Sample Text 10');


EOSQL