up:
	docker-compose up -d

down:
	docker-compose down

rmi:
	docker rmi $$(docker images -f dangling=true -q)

exec:
	docker-compose exec ansible-test /bin/ash

aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa123456789
