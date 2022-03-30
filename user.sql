CREATE USER 'petclinic'@'%' IDENTIFIED BY 'petclinic';
GRANT ALL PRIVILEGES ON * . * TO 'petclinic'@'%';
FLUSH PRIVILEGES;
CREATE DATABASE petclinic;
USE petclinic
GRANT ALL ON petclinic.* TO 'petclinic'@'%';