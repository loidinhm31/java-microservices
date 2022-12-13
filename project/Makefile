## up: starts all containers in the background without forcing build
up:
	@echo "Starting Docker images..."
	docker-compose up -d
	@echo "Docker images started!"

## up_build: stops docker-compose (if running), builds all projects and starts docker compose
up_build: build_keycloak_sv build_api_gateway_sv build_fsa build_handler
	@echo "Stopping docker images (if running...)"
	docker-compose down
	@echo "Building (when required) and starting docker images..."
	docker-compose up --build -d
	@echo "Docker images built and started!"

## down: stop docker compose
down:
	@echo "Stopping docker compose..."
	docker-compose down
	@echo "Done!"

## build_keycloak_sv: builds the keycloak-server jar as a linux executable
build_keycloak_sv:
	@echo "Building keycloak-server jar..."
	cd ../keycloak-authorization-server && mvn clean install -DskipTests
	@echo "Done!"

## build_api_gateway_sv: builds the api-gateway-server jar as a linux executable
build_api_gateway_sv:
	@echo "Building api-gateway-server jar..."
	cd ../api-gateway && mvn clean install -DskipTests
	@echo "Done!"

## build_fsa: builds the fsa jar as a linux executable
build_fsa:
	@echo "Building fsa jar..."
	cd ../administration-service && mvn clean install -DskipTests
	@echo "Done!"

## build_handler: builds the handler jar as a linux executable
build_handler:
	@echo "Building handler jar..."
	cd ../handler-service && mvn clean install -DskipTests
	@echo "Done!"