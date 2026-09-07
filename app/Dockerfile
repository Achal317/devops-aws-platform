FROM python:3.11-alpine

WORKDIR /var/flask

RUN adduser --disabled-password --home /var/flask/ appuser

COPY requirements.txt .

RUN --mount=type=cache,target=/root/.cache/pip \
    pip install -r requirements.txt

COPY . .

RUN chown -R appuser:appuser /var/flask/

USER appuser

EXPOSE 5000

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]

