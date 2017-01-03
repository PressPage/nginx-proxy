start-docker:
	mkdir -p nginx/lua
	mkdir -p nginx/vhost
	sudo ifconfig lo0 alias 172.16.123.1
	sudo mkdir -p /etc/resolver
	sudo sh -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'
	docker-compose up -d
docker-rebuild:
	docker-compose up -d --build
update-dependencies:
	docker pull jwilder/docker-gen:0.7.3
	docker pull nginx:1.11.3
	docker pull python:3
	docker pull rancher/socat-docker:latest
	docker pull appropriate/curl:latest
	docker pull docker:1.10

test:
	docker build -t jwilder/nginx-proxy:bats .
	bats test

.PHONY : start-docker
