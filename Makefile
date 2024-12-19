postgres14:
	docker run --name postgres14 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -p 5432:5432 -d postgres

createdb: 
	docker exec -it postgres14 createdb --username=root --owner=root simplebank


dropdb: 
	docker exec -it postgres14 dropdb simplebank

mirgrateup :
	 migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simplebank?sslmode=disable" -verbose up

mirgratedown :
	 migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simplebank?sslmode=disable" -verbose down

makesqlc:
	sqlc generate

.PHONY: createdb dropdb postgres14 mirgrateup mirgratedown sqlc