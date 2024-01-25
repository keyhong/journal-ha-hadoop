build:
	docker compose -f docker-compose.yml up --build -d --remove-orphans

up:
	docker compose -f docker-compose.yml up -d

down:
	docker compose -f docker-compose.yml down

down-v:
	docker compose -f docker-compose.yml down -v 

down-v-rmi:
	docker compose -f docker-compose.yml down -v --rmi all


# show-logs:
# 	docker compose -f docker-compose.yml logs

show-logs-master:
	docker compose -f docker-compose.yml logs master-server

# makemigrations:
# 	docker compose -f docker-compose.yml run --rm api python manage.py makemigrations

# migrate:
# 	docker compose -f docker-compose.yml run --rm api python manage.py migrate

# collectstatic:
# 	docker compose -f docker-compose.yml run --rm api python manage.py collectstatic --no-input --clear

# superuser:
# 	docker compose -f docker-compose.yml run --rm api python manage.py createsuperuser



# volume:
# 	docker volume inspect src_local_postgres_data

# authors-db:
# 	docker compose -f docker-compose.yml exec postgres psql --username=alphaogilo --dbname=authors-live

# flake8:
# 	docker compose -f docker-compose.yml exec api flake8 .

# black-check:
# 	docker compose -f docker-compose.yml exec api black --check --exclude=migrations .

# black-diff:
# 	docker compose -f docker-compose.yml exec api black --diff --exclude=migrations .

# black:
# 	docker compose -f docker-compose.yml exec api black --exclude=migrations .

# isort-check:
# 	docker compose -f docker-compose.yml exec api isort . --check-only --skip venv --skip migrations

# isort-diff:
# 	docker compose -f docker-compose.yml exec api isort . --diff --skip venv --skip migrations

# isort:
# 	docker compose -f docker-compose.yml exec api isort . --skip venv --skip migrations


