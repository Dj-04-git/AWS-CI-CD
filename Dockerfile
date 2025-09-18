FROM python:3.8-slim-buster
WORKDIR /app
COPY . /app

# Update sources to debian archive
RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    awscli ffmpeg libsm6 libxext6 unzip \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt
CMD ["python3", "app.py"]
