# Demo Devops Python

This is a simple application to be used in the technical test of DevOps.

## Getting Started
### Prerequisites

- Git
- Docker & Docker Compose
- Python 3.11.3 (Optional)

### Installation

Clone this repo.

```bash
git clone https://github.com/danicaceres1998/devsu_technical_test.git
```

### Run the entire environment with Docker 🐳
First, you have to build the project image.
```
docker build -f dev.Dockerfile -t danicaceres1998/devsu-python:dev-env .
```
Run the service.
```
docker compose up -d
```
Finally enter into the container.
```
docker compose exec api /bin/bash
```


**(Optional)** If you want to build the project on your local machine and not run it in a container environment, install the dependencies.

```bash
pip install -r requirements.txt
```

Migrate database

```bash
py manage.py makemigrations
py manage.py migrate
```

### Database

The database is generated as a file in the main path when the project is first run, and its name is `db.sqlite3`.

Consider giving access permissions to the file for proper functioning.

On the production environment the default database is a PostgreSQL, for run the production service on your local env, please follow the **Production ENV** guide

## Production ENV

Since the production environment requires other configuration to increase the security of the application, you must provide the following environment variables to be able to run it in any environment using the latest version of a Docker image:
- `PYTHON_ENV`: this var must set to **"production"** to activate the production settings.
- `DB_HOST`: database host
- `DB_NAME`: name of the database that the service will connect
- `DJANGO_SECRET_KEY`: the new secure django secret key
- `USER_DB`: user to be used for authentication with the DB
- `PASSWORD_DB`: password to be used for authentication with the DB

If the production environment is activated and one of these variables is not present, the service will probably throw an error and will not be able to run.

## Usage

To run tests you can use this command.

```bash
py manage.py test
```

To run locally the project you can use this command.

```bash
py manage.py runserver
```

Open http://localhost:5002/api/ if you are using `Docker` or http://localhost:8000/api/ if you are using your local maching with your browser to see the result.

### Features

These services can perform,

#### Create User

To create a user, the endpoint **/api/users/** must be consumed with the following parameters:

```bash
  Method: POST
```

```json
{
    "dni": "dni",
    "name": "name"
}
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
{
    "id": 1,
    "dni": "dni",
    "name": "name"
}
```

If the response is unsuccessful, we will receive status 400 and the following message:

```json
{
    "detail": "error"
}
```

#### Get Users

To get all users, the endpoint **/api/users** must be consumed with the following parameters:

```bash
  Method: GET
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
[
    {
        "id": 1,
        "dni": "dni",
        "name": "name"
    }
]
```

#### Get User

To get an user, the endpoint **/api/users/<id>** must be consumed with the following parameters:

```bash
  Method: GET
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
{
    "id": 1,
    "dni": "dni",
    "name": "name"
}
```

If the user id does not exist, we will receive status 404 and the following message:

```json
{
    "detail": "Not found."
}
```

## License

Copyright © 2023 Devsu. All rights reserved.
