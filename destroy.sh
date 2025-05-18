#!/bin/bash

# Bajar servicios por proyecto
docker compose -p broker -f compose/broker.yml down
docker compose -p cache -f compose/storage.yml down
docker compose -p backend -f compose/backend.yml down

# Eliminar redes
docker network rm public private