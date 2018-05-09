DOCKER = docker

# import config.
# You can change the default config with `make cnf="alternative.env" build`
cnf ?= prod.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

build: ## Build the app
	$(DOCKER) build -f ${DOCKER_FILE} -t $(APP_NAME) ${DOCKER_BUID_PATH}

run: ## Run the project
	$(DOCKER) run -it --rm -d -v ${SOURCE_DIR}:${TARGET_DIR} -p ${OUTER_PORT}:${INNER_PORT} --name "$(RUNAPP_NAME)" $(APP_NAME)

stop: ## Stop and remove a running container
	$(DOCKER) stop $(RUNAPP_NAME)

install: ## Install and start the project
install: build run

reset: ## Reset the project
reset: stop install

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help
