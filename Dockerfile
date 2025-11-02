# Use an official lightweight Python image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create a working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y build-essential libpq-dev && rm -rf /var/lib/apt/lists/*

# Copy project files into the container
COPY . /app

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose the application port
EXPOSE 8080

# Default database connection (you can override it when running)
ENV DATABASE_URI=postgresql://postgres:pgs3cr3t@postgres:5432/testdb

# Run the Flask app
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]
