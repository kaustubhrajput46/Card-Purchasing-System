-- noinspection SqlNoDataSourceInspectionForFile
-- noinspection SqlDialectInspectionForFile

CREATE USER 'dbmsFinalProject'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON * . * TO 'dbmsFinalProject'@'localhost';

-- link to create/delete mysql user
--  https://dev.mysql.com/doc/refman/5.5/en/create-user.html
-- https://dev.mysql.com/doc/refman/5.5/en/grant.html
-- https://www.cyberciti.biz/faq/how-to-delete-remove-user-account-in-mysql-mariadb/
