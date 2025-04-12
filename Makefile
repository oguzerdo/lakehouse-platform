# Iceberg-Nessie-MinIO Makefile

.PHONY: build up down restart clean logs ps exec-spark exec-nessie exec-minio help

# Default variables
PROJECT_NAME := iceberg-project
DOCKER_COMPOSE := docker-compose
SPARK_CONTAINER := spark-iceberg
NESSIE_CONTAINER := nessie
MINIO_CONTAINER := minio

# Main commands
help:
	@echo "Available commands:"
	@echo "  make build        - Build Docker images"
	@echo "  make up           - Start all services" 
	@echo "  make down         - Stop and remove services"
	@echo "  make restart      - Restart all services"
	@echo "  make clean        - Stop services and clean images"
	@echo "  make logs         - Show logs from all services"
	@echo "  make ps           - List running services"
	@echo "  make exec-spark   - Connect to Spark container"
	@echo "  make exec-nessie  - Connect to Nessie container"
	@echo "  make exec-minio   - Connect to MinIO container"
	@echo "  make prune        - Clean all unused Docker objects"

# Build Docker images
build:
	@echo "Building Docker images..."
	$(DOCKER_COMPOSE) build

# Start services
up:
	@echo "Starting services..."
	$(DOCKER_COMPOSE) up -d
	@echo "Services started. Jupyter Notebook: http://localhost:8888"
	@echo "MinIO UI: http://localhost:9001, Nessie API: http://localhost:19120/api/v1"

# Stop and remove services
down:
	@echo "Stopping and removing services..."
	$(DOCKER_COMPOSE) down

# Restart services
restart:
	@echo "Restarting services..."
	$(DOCKER_COMPOSE) restart

# View service logs
logs:
	$(DOCKER_COMPOSE) logs -f

# List running services
ps:
	$(DOCKER_COMPOSE) ps

# Clean up - remove containers, images, and volumes
clean:
	@echo "Cleaning services and related resources..."
	$(DOCKER_COMPOSE) down -v --rmi local

# Completely clean Docker system
prune:
	@echo "Cleaning unused Docker resources..."
	docker system prune -af --volumes

# Connect to containers
exec-spark:
	@echo "Connecting to Spark container..."
	docker exec -it $(SPARK_CONTAINER) bash

exec-nessie:
	@echo "Connecting to Nessie container..."
	docker exec -it $(NESSIE_CONTAINER) sh

exec-minio:
	@echo "Connecting to MinIO container..."
	docker exec -it $(MINIO_CONTAINER) sh

# Default command
.DEFAULT_GOAL := help