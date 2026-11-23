CREATE USER 'moffat_user'@'localhost'
IDENTIFIED BY 'moffat_pass';

GRANT SELECT ON moffat_bay.*
TO 'moffat_user'@'localhost';