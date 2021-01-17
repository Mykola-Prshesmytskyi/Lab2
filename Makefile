.DEFAULT_GOAL := all

all: install test run deploy

install:
	@echo "Install."
	@pipenv --python 3.8
	@pipenv shell
	@pipenv install requests
	@pipenv install ntplib
	@pipenv install pytest

test:
	@echo "Start tests."
	pipenv run pytest tests/tests.py >> result.txt

run:
	@echo "Run Python app."
	pipenv run python3 app.py >> results.txt

deploy:
	@echo "Adding and Committing results.txt to git."
	git add results.txt
	git commit
	git push origin main
