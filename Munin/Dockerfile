FROM ubuntu:jammy

#https://github.com/shaf/docker-munin-server
#opravnania: 105:108 (munin:munin)

ENV ALLOWED_HOSTS="127.0.0.1/32" \
	HOSTNAME="salaserver" \
	TZ="Europe/Berlin"

RUN \
	apt-get update && \
	apt-get dist-upgrade -y &&\
	DEBIAN_FRONTEND=noninteractive apt-get install -y munin apache2 lm-sensors tzdata munin-plugins-extra && \
	apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* && \
	sed -ri 's/^log_file.*/# \0/; \
			s/^pid_file.*/# \0/; \
			s/^background 1$/background 0/; \
			s/^setsid 1$/setsid 0/; \
			' /etc/munin/munin-node.conf && \
	/bin/echo -e "cidr_allow ${ALLOWED_HOSTS}" >> /etc/munin/munin-node.conf

#RUN	ln -s /usr/share/munin/plugins/sensors_   /etc/munin/plugins/sensors_temp && \
RUN	ln -s /usr/share/munin/plugins/sensors_   /etc/munin/plugins/sensors_fan && \
	ln -s /usr/share/munin/plugins/sensors_

RUN	mkdir /var/run/munin  && \
	chown munin:munin /var/run/munin /var/cache/munin/www /var/lib/munin


ADD ./conf/start.sh /
ADD ./conf/apache24.conf /etc/munin/
#ADD ./conf/plugins/gitlab_shm /etc/munin/plugins

#RUN chmod +rx /etc/munin/plugins/gitlab_shm

# Define data volumes
VOLUME ["/etc/munin/munin-conf.d", "/var/cache/munin/www", "/var/lib/munin"]

EXPOSE 8888

#servers.conf obsahuje zoznam Munin nodes
COPY ./conf/munin-conf.d/servers.conf /etc/munin/munin-conf.d
RUN cat /etc/munin/munin-conf.d/servers.conf >> /etc/munin/munin.conf

CMD ["/start.sh"]

