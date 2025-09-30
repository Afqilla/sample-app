FROM python:3.11-slim
WORKDIR /home/myapp

# copy requirements dulu → cache layer install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# baru copy source code
COPY . .
EXPOSE 5050
CMD ["python", "sample_app.py"]

