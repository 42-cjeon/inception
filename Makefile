
NAME=inception

DOCKER_COMPOSE_YML=srcs/docker-compose.yml
DOCKER_COMPOSE_FLAGS=-p $(NAME) -f $(DOCKER_COMPOSE_YML)
VOLUMES_ROOT=/Users/cjeon/data

build:
	docker-compose $(DOCKER_COMPOSE_FLAGS) build

up:
	docker-compose $(DOCKER_COMPOSE_FLAGS) up -d

down:
	docker-compose $(DOCKER_COMPOSE_FLAGS) down

reload: down build up

clean: down
	rm -rf $(VOLUMES_ROOT)/*

.PHONY: build up down reload clean
