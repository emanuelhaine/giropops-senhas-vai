FROM python:3.11

WORKDIR /app
# Check if copying all the app dir it will work
COPY app/requirements.txt app/app.py .
COPY app/templates templates/
COPY app/static static/

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]

