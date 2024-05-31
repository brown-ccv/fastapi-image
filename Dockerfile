FROM python:3.9

WORKDIR /code

COPY ./requirements.lock /code/requirements.lock

RUN PYTHONDONTWRITEBYTECODE=1 pip install --no-cache-dir -r requirements.lock

COPY ./src/fastapi_image /code/src/fastapi_image

WORKDIR /code/src/fastapi_image

CMD ["fastapi", "run", "main.py", "--port", "8080"]

# If running behind a proxy like Nginx or Traefik add --proxy-headers
# CMD ["fastapi", "run", "app/main.py", "--port", "80", "--proxy-headers"]
