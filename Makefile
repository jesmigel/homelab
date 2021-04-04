.PHONY: up down clean status ssh test config

_COMPOSE=docker-compose
_TEMPLATE_ENV=sample.compose.env

init_env:
	@(. sample.compose.env && eval "echo \"$$(cat sample.compose.env)\"") > .env

config: init_env
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
	cat .env

logtest:
	$(_COMPOSE) logs $(_TEST)

rmtest:
	$(_COMPOSE) stop $(_TEST)
	$(_COMPOSE) rm -f $(_TEST)