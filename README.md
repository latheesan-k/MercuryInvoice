# Mercury Invoice

Invoice management system built on top of Cardano blockchain & integrated with AdaPay.

## Prerequisite
- Linux OS
- Make
- Git
- Docker / Docker-Compose

## Local Install
- Open terminal and type `cd $HOME/Desktop`
- Run `docker network create --driver bridge local-mercury-invoice` (Only Required First Time Setup)
- Clone repo `git clone git@github.com:latheesan-k/MercuryInvoice.git`
- Switch to repo dir `cd $HOME/Desktop/MercuryInvoice`
- Copy `application/.env.example` as `application/.env`
- Run `make buid` to build & start the containers
- Application should be running locally at `http://localhost:8007`
- Local MySQL server can be accessed via port 33007 (credentials in docker-composer.yml file)

### Available Make Commands
* `build` Rebuild all docker containers
* `up` Restart all docker containers
* `down` Shutdown all docker containers
* `composer-install` Run composer install
* `db-migrate` Run database migration(s)
* `db-refresh` Drop all database tables, re-run the migration(s) with seeds
* `status` View the status of all running containers
* `logs` View the logs out of all running containers
* `shell` Drop into an interactive shell inside _mercury-invoice-web_ container
* `stats` View the resource usage of all running containers
* `artisan` Execute Laravel `artisan` command inside _mercury-invoice-web_ container
* `frontend-dev` Installs the frontend assets command inside _mercury-invoice-frontend_ container
* `frontend-watch` Run `npm run watch` command inside _mercury-invoice-frontend_ container

### How to prepare your environment

* Install docker by following the guides on https://docs.docker.com/engine/install/ubuntu/ (see `Install Docker Engine` section)
* Now follow these steps give docker correct permissions https://docs.docker.com/engine/install/linux-postinstall/
* Install docker-compose by following this guide https://docs.docker.com/compose/install/ (select `Linux` tab)
* Ensure you have GIT installed https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
* Ensure you have `Makefile` installed with `sudo apt install makefile -y`
