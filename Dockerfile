FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000
CMD ["python", "app.py"]

# To build the container, run the following command:
# docker build -t repeticio-backend .
# To run the container, use the following command:
# docker run -p 5000:5000 repeticio-backend