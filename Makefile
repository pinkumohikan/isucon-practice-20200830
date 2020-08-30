.PHONY: gogo kataribe

gogo: stop-services build truncate-logs start-services ping

build:
	cd app && make build

stop-services:
	sudo systemctl stop isubata.golang
	sudo systemctl stop nginx
	sudo systemctl stop mysql

start-services:
	sudo systemctl start mysql
	sudo systemctl start nginx
	sudo systemctl start isubata.golang

ping:
	curl -sSL http://localhost > /dev/null

kataribe:
	sudo cat /var/log/nginx/access.log | ./kataribe

truncate-logs:
	sudo truncate --size 0 /var/log/nginx/access.log
