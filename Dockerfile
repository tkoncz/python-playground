FROM python:3.7-slim

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update -y && apt-get install -y python3-pip

COPY requirements.txt .
RUN pip3 install -r requirements.txt
RUN rm requirements.txt

# temporary fix for ipython crash issues.
# More info: https://github.com/ipython/ipython/issues/12745
RUN pip install --upgrade 'jedi<0.18.0'
