#!/bin/bash

# for windows
cp -a /usr/local/etc/mysql /etc/
chmod 644 /etc/mysql/my.cnf

/entrypoint.sh mysqld
