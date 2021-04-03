.PHONY: up down clean status ssh test config

_COMPOSE=docker-compose

include sample.compose.env

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
	$(_COMPOSE) up -d $(_TEST)

logtest:
	$(_COMPOSE) logs $(_TEST)

rmtest:
	$(_COMPOSE) stop $(_TEST)
	$(_COMPOSE) rm -f $(_TEST)