# https://github.com/docker-library/mysql
FROM watawuwu/debian:jessie

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 430BDF5C56E7C94E848EE60C1C4CBDCDCD2EFD2A \
    && echo 'deb http://repo.percona.com/apt jessie main' > /etc/apt/sources.list.d/percona.list


ENV PERCONA_MAJOR 5.6

RUN { \
        echo percona-server-server-$PERCONA_MAJOR percona-server-server/root_password password 'unused'; \
        echo percona-server-server-$PERCONA_MAJOR percona-server-server/root_password_again password 'unused'; \
    } | debconf-set-selections \
    && apt-get update \
    && apt-get install -y \
        percona-server-server-$PERCONA_MAJOR \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/lib/mysql \
    && mkdir /var/lib/mysql \
    && sed -ri 's/^(bind-address|skip-networking)/;\1/' /etc/mysql/my.cnf


VOLUME /var/lib/mysql

COPY launch.sh /launch.sh
COPY entrypoint.sh /entrypoint.sh

EXPOSE 3306
CMD ["/launch.sh"]

