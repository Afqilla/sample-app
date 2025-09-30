FROM python:3.11-slim
WORKDIR /home/myapp
COPY requirements.txt .
RUN pip install --no-cache-dir --progress-bar=off -r requirements.txt
COPY ./static ./static
COPY ./templates ./templates
COPY sample_app.py .
EXPOSE 5050
CMD ["python", "sample_app.py"]
