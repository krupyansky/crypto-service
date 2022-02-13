init: docker-down-clear \
	docker-pull docker-build docker-up \
	app-init

docker-down-clear:
	docker-compose down -v --remove-orphans

docker-pull:
	docker-compose pull
docker-build:
	docker-compose build --pull
docker-up:
	docker-compose up -d

app-init: migrate-up run

run:
	cd cmd; go run main.go

migrate-up:
	migrate -path ./schema -database 'mysql://user:password@tcp(localhost:33066)/db' up

migrate-create:
	migrate create -ext sql -dir ./schema -seq init
