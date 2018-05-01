DOCKER = docker

# import config.
# You can change the default config with `make cnf="alternative.env" build`
cnf ?= prod.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

build: ## Build the app
	$(DOCKER) build -t $(APP_NAME) .

run: ## Run the project
run:
	$(DOCKER) run -it --rm -d -v ${SOURCE_DIR}:${TARGET_DIR} -p ${PORT}:80 --name "$(RUNAPP_NAME)" $(APP_NAME)

stop: ## Stop and remove a running container
stop:
	$(DOCKER) stop $(RUNAPP_NAME)

install: ## Install and start the project
install: build run

reset: ## Reset the project
reset: stop install

# For display commands list on "make" or "make help" command
.DEFAULT_GOAL := help
help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
.PHONY: help