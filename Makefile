export COMPOSE_PROJECT_NAME=mercury-invoice
export COMPOSE_FILE=docker/docker-compose.yml

.PHONY: up
up:
	$(MAKE) down
	docker-compose up -d
	$(MAKE) composer-install
	./docker/wait-for-mysql.sh
	$(MAKE) db-migrate
	$(MAKE) frontend-dev

.PHONY: down
down:
	docker-compose down --remove-orphans

.PHONY: build
build:
	docker-compose build
	$(MAKE) up

#
# Helper functions
#

.PHONY: composer-install
composer-install:
	docker exec -it mercury-invoice-web bash -c "composer install"

.PHONY: db-migrate
db-migrate:
	docker exec -it mercury-invoice-web bash -c "php artisan migrate"

.PHONY: db-refresh
db-refresh:
	docker exec -it mercury-invoice-web bash -c "php artisan migrate:fresh --seed"

.PHONY: tinker
tinker:
	docker exec -it mercury-invoice-web bash -c "php artisan tinker"

.PHONY: status
status:
	docker-compose ps

.PHONY: logs
logs:
	docker-compose logs -f --tail=100

.PHONY: shell
shell:
	docker exec -it mercury-invoice-web bash

.PHONY: stats
stats:
	docker stats mercury-invoice-web mercury-invoice-mysql mercury-invoice-redis

.PHONY: artisan
artisan:
	docker exec -it mercury-invoice-web bash -c "php artisan $(COMMAND)"

.PHONY: frontend-dev
frontend-dev:
	docker exec -it mercury-invoice-frontend bash -c "npm install"
	docker exec -it mercury-invoice-frontend bash -c "npm run dev"

.PHONY: frontend-watch
frontend-watch:
	docker exec -it mercury-invoice-frontend bash -c "npm run watch"
