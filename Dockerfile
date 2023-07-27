FROM python:3.11.3-alpine
RUN python3 -m pip install --upgrade pip

# User config
RUN adduser -D myuser
USER myuser
ENV APP_HOME /home/myuser/app
WORKDIR $APP_HOME

# Dependencies
COPY --chown=myuser:myuser requirements.txt ./
RUN pip install --user -r requirements.txt

ENV PATH="/home/myuser/.local/bin:${PATH}"

# Proyect
COPY --chown=myuser:myuser . .
ENV PORT 5000

CMD python manage.py runserver 0.0.0.0:$PORT
