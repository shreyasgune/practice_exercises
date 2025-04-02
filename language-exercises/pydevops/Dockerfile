FROM python:3.11-slim as build

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.11-slim as runner

WORKDIR /app

COPY --from=build /app /app

RUN useradd --create-home --shell /bin/false appuser

RUN chown -R appuser:appuser /app

USER appuser

CMD ["python", "app.py"]

