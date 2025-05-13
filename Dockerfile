FROM python:3.10-slim

RUN adduser --disabled-password --gecos '' appuser

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-setuptools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./

RUN python -m pip install --upgrade pip && \
    python -m pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chown -R appuser:appuser /app
USER appuser

EXPOSE 5000

# Run using startup.bash (in Digital Ocean App Platform, this will be skipped and the command in the Procfile will be used)
CMD ["bash", "startup.bash"]

# to build the image, run the following command in the terminal:
# docker build -t repeticio_backend:latest .
# to run the container, use the following command:
# docker run -p 5000:5000 repeticio_backend:latest