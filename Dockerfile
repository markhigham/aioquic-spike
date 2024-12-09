FROM python:3.12

RUN pip install poetry

WORKDIR /app

COPY pyproject.toml poetry.lock ./

RUN poetry export --without-hashes -f requirements.txt -o requirements.txt

RUN pip install -r requirements.txt

COPY examples/ ./examples
COPY tests/ ./tests

