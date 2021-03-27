.PHONY: up down clean status ssh test config

_COMPOSE=docker-compose

config:
	$(_COMPOSE) config

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