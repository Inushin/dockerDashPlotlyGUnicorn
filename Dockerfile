FROM python:3.8-slim-buster
 RUN apt-get update
 RUN apt-get install nano
 
 RUN mkdir /usr/src/app/
 WORKDIR /usr/src/app/
 COPY app/requirements.txt .
 RUN pip3 install -r requirements.txt
  
 COPY app/ ./
  
 CMD [ "gunicorn", "--workers=5", "--threads=1", "-b 0.0.0.0:8050", "app:server"]