# Makefile for web platform
.DEFAULT_GOAL := help

# mapping
export IP = $(shell ifconfig en0 | grep inet | awk '$$1=="inet" {print $$2}')

help: ## Show this help
	@printf "\033[33m%s:\033[0m\n" 'Available commands'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[32m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

up: ## Run cypress container
	@echo "Starting XQuartz service ..."
	@open -a XQuartz
	@echo "Host machine IP:" $(IP)
	@xhost + $$IP
	@read -r -p "Tests directory: " DIR; \
	read -r -p "Base url: http://" BASE_URL; \
	docker run -it --rm \
		--name cypress \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v $$PWD/workspace/$$DIR/tests:/e2e \
		-w /e2e \
		-e DISPLAY=$(IP):0 \
		-e BASE_URL=$$BASE_URL \
		--network="web_default" \
		--link web:$$BASE_URL \
		doanbaanh/cypress:latest

down: ## Stop cypress container
	@docker stop cypress
