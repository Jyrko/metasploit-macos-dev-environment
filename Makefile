ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))

COMPOSE_CMD := mutagen-compose -f docker-compose.yml 

build:
		${COMPOSE_CMD} build $(ARGS)

bundle:
		${COMPOSE_CMD} run --rm metasploit-framework bundle install

init: build bundle

inside:
		${COMPOSE_CMD} run --service-ports --rm metasploit-framework bash