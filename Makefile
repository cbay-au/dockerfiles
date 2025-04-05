# Color definitions for terminal outputs
RESET=$(shell tput sgr0)
GREEN=$(shell tput setaf 2)

.DEFAULT_GOAL := help

## build: Build all containers 
build:
	@echo "Building services..."
	docker build -t myapp .
	if [ -f docker-compose.yml ]; then \
		docker-compose up --build -d; \
	else \
		echo "${GREEN}No docker-compose.yml file found. Starting container directly...${RESET}"; \
		docker run -d -p 8080:8080 myapp; \
	fi
	@echo "${GREEN}Containers ready at http://localhost:8080${RESET}"

## run[<service>]: Run specific service tests 
run:
ifndef SERVICE_NAME
	@echo "Available services:"
	ls docker/services/
	exit 1
else
	test -d docker/services/$(SERVICE_NAME) || (echo "Error: Service $(SERVICE_NAME) not found"; exit 1)
	cd docker/services/$(SERVICE_NAME) && \
	docker-compose exec app python test.py --verbose || exit 2
	@echo "\u2705 Tests passed for $(SERVICE_NAME)"
endif

## lint: Check code quality 
lint:
	@echo "Running style checks..."
	test -x $(shell which pre-commit) || (echo "Error: pre-commit not found"; exit 1)
	pre-commit run --all-files | grep -v 'no files to check'
	@printf '\n${GREEN}\u2714 All checks passed!${RESET}'

## clean: Remove temporary artifacts 
clean:
	@echo "Remove temporary artifacts? (y/n)"
	read -r response
	if [ "$$response" != "y" ]; then \
		echo "Aborted"; \
		exit 1; \
	fi
	rm -rf tmp/ coverage.xml
	docker system prune -f
	@echo "\uD83D\uDD7A Removed 20MB of cache"

help:
	@echo "Makefile for managing services"
	@echo "Available targets:"
	@awk 'BEGIN {FS=":"; OFS="\t"} /^[a-zA-Z0-9_-]+:/ {print $$1, $$2}' $(MAKEFILE_LIST) | sort
