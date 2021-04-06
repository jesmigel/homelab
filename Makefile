.PHONY: up down clean status ssh test config

_COMPOSE=docker-compose
_TEMPLATE_ENV=sample.compose.env
include $(_TEMPLATE_ENV)

# Docker Compose unable to parse custom env file to be used on main docker-compose file
init_env:
	@(. ./$(_TEMPLATE_ENV) && eval "echo \"$$(cat ./$(_TEMPLATE_ENV))\"") > .env

config: init_env
	$(_COMPOSE) config

up: init_env
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

test: init_env
	$(_COMPOSE) up $(_TEST)

logtest:
	$(_COMPOSE) logs $(_TEST)

rmtest:
	$(_COMPOSE) stop $(_TEST)
	$(_COMPOSE) rm -f $(_TEST)
