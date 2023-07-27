FROM python:3.11.3-slim
RUN apt-get update -qq && apt-get upgrade -y
RUN python -m pip install --upgrade pip

ENV PORT 5000
WORKDIR /app

# Dependencies
COPY requirements.txt ./
RUN pip install -r requirements.txt

# Proyect
COPY . .

CMD python manage.py runserver 0.0.0.0:$PORT
