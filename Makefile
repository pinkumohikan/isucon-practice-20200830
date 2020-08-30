.PHONY: gogo kataribe

gogo: stop-services build truncate-logs start-services ping bench

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
	sleep 3 # ミドルウェアとアプリケーションの起動を待つ

ping:
	curl -sSL http://localhost > /dev/null

kataribe:
	sudo cat /var/log/nginx/access.log | ./kataribe

bench:
	cd ~/isubata/bench && ./bin/bench -remotes=127.0.0.1 -output result.json
	cat ~/isubata/bench/result.json | jq '{pass: .pass, score: .score}'

truncate-logs:
	sudo truncate --size 0 /var/log/nginx/access.log
