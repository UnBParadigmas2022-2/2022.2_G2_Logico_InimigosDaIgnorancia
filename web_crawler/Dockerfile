FROM python:3.9-slim

WORKDIR /web_crawler

COPY . .

RUN pip install -r requirements.txt

ENTRYPOINT ["python","main.py"]
