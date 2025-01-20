#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
CREATE USER db_admin WITH SUPERUSER CREATEROLE CREATEDB REPLICATION INHERIT LOGIN ENCRYPTED PASSWORD 'db_admin';
CREATE DATABASE devcontainer_db;
GRANT ALL PRIVILEGES ON DATABASE devcontainer_db TO db_admin;
EOSQL