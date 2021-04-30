dc := docker-compose

up:
	touch ip.txt
	$(dc) up --build -d
	$(dc) exec dns /bin/bash -c "ifconfig >> /mnt/ip.txt"
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