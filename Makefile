dc := docker-compose

up:
	rm ip.txt
	touch ip.txt
	$(dc) up --build -d
	$(dc) exec dns /bin/bash -c "ifconfig >> /mnt/ip.txt"
	$(dc) exec dns /bin/bash -c "/etc/init.d/named start"
	$(dc) exec web /bin/sh -c "ifconfig >> /mnt/ip.txt"
	$(dc) exec web /bin/sh -c "echo \"nameserver 192.168.200.11\" >> /etc/resolv.conf"
down:
	$(dc) down
rm:
	$(dc) down --rmi all
sh:
	$(dc) exec dns /bin/bash
ps:
	docker ps -a
allrm:
	docker stop `docker ps -aq` ; \
	docker rm `docker ps -aq` ; \
	docker rmi `docker images -q`