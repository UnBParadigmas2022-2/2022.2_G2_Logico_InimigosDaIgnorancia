DROP schema public CASCADE;
CREATE schema public;

\i docker-entrypoint-initdb.d/ddl.sql
\i docker-entrypoint-initdb.d/dml.sql
