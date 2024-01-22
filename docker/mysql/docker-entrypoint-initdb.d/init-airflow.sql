CREATE DATABASE airflow_db;

CREATE USER 'airflow_admin'@'%' IDENTIFIED BY 'airflow_admin';

GRANT ALL PRIVILEGES ON airflow_db.* TO 'airflow_admin';