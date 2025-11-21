FROM python:3.12

WORKDIR /appname

COPY bot.py /appname/bot.py
COPY requirements.txt
RUN pip install -r requirements.txt

CMD ["python", "/appname/bot.py"]