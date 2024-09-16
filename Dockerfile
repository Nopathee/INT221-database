FROM mysql/mysql-server

ENV MYSQL_RANDOM_ROOT_PASSWORD=true
ENV MYSQL_USER=dev
ENV MYSQL_PASSWORD=mysql
ENV MYSQL_DATABASE=ssi3

COPY release2script.sql /docker-entrypoint-initdb.d/
