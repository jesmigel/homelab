.PHONY: up down clean status ssh test

_COMPOSE=docker-compose

up:
	$(_COMPOSE) up -d

down:
	$(_COMPOSE) stop

status:
	$(_COMPOSE) ps
logs:
	$(_COMPOSE) logs

clean:
	$(_COMPOSE) down -v

ssh:
	$(_COMPOSE) exec ldap

test:
	$(_COMPOSE) up -d openldap ldap-gui