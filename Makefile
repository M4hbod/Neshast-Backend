.PHONY: migrations migrate run shell superuser help

python3 = uv run python3

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  migrations  to create new migrations"
	@echo "  migrate     to apply migrations"
	@echo "  run         to run the server"
	@echo "  shell       to run the shell"
	@echo "  superuser   to create a superuser"

migrations:
	$(python3) manage.py makemigrations $(arg)

migrate:
	$(python3) manage.py migrate

run:
	$(python3) manage.py runserver $(address)

shell:
	$(python3) manage.py shell

superuser:
	$(python3) manage.py createsuperuser

collectstatic:
	$(python3) manage.py collectstatic --no-input

worker:
	uv run celery -A config worker -l info

