#!/bin/bash

# bikin ulang direktori temp
rm -rf tempdir
mkdir -p tempdir/templates
mkdir -p tempdir/static

cp sample_app.py tempdir/.
cp -r templates/* tempdir/templates/ 2>/dev/null || true
cp -r static/* tempdir/static/ 2>/dev/null || true

# generate Dockerfile lebih ringan
cat <<EOF > tempdir/Dockerfile
FROM python:3.11-slim
WORKDIR /home/myapp
COPY requirements.txt .
RUN pip install --no-cache-dir --progress-bar=off -r requirements.txt
COPY ./static ./static
COPY ./templates ./templates
COPY sample_app.py .
EXPOSE 5050
CMD ["python", "sample_app.py"]
EOF

# buat requirements.txt di tempdir
echo "flask" > tempdir/requirements.txt

cd tempdir
docker build -t sampleapp .
docker rm -f samplerunning 2>/dev/null || true
docker run -d -p 5050:5050 --name samplerunning sampleapp
docker ps -a
