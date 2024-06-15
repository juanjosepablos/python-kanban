FROM python:3.8-alpine as base
FROM base as builder

WORKDIR /python-kanban

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["waitress-serve", "--call", "main:create_app"]
