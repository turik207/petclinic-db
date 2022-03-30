# syntax=docker/dockerfile:1
FROM ubuntu:latest
WORKDIR /source
RUN mkdir apptest
RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
RUN apt install mysql-server -y
RUN usermod -d /var/lib/mysql/ mysql
ENV MYSQL_ROOT_PASSWORD r00t
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
RUN service mysql restart
ADD user.sql /docker-entrypoint-initdb.d
RUN service mysql start && mysql -pr00t < /docker-entrypoint-initdb.d
CMD service mysql start && tail -F /var/log/mysql/error.log
EXPOSE 3306