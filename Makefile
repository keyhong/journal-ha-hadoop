build:
	docker compose up --build -d --remove-orphans

up:
	docker compose up -d

down:
	docker compose down

down-v:
	docker compose down -v 

down-v-rmi:
	docker compose down -v --rmi all

show-logs:
	docker compose logs

show-logs-master:
	docker compose logs master-server

# makemigrations:
# 	docker compose run --rm api python manage.py makemigrations

# migrate:
# 	docker compose run --rm api python manage.py migrate

# collectstatic:
# 	docker compose run --rm api python manage.py collectstatic --no-input --clear

# superuser:
# 	docker compose run --rm api python manage.py createsuperuser



# volume:
# 	docker volume inspect src_local_postgres_data

# authors-db:
# 	docker compose exec postgres psql --username=alphaogilo --dbname=authors-live

# flake8:
# 	docker compose exec api flake8 .

# black-check:
# 	docker compose exec api black --check --exclude=migrations .

# black-diff:
# 	docker compose exec api black --diff --exclude=migrations .

# black:
# 	docker compose exec api black --exclude=migrations .

# isort-check:
# 	docker compose exec api isort . --check-only --skip venv --skip migrations

# isort-diff:
# 	docker compose exec api isort . --diff --skip venv --skip migrations

# isort:
# 	docker compose exec api isort . --skip venv --skip migrations


