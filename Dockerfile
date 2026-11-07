# Base Image (OS)
FROM python:3.14-slim

# Working Directory
WORKDIR /app

# Copy requirements first
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Expose port 80
EXPOSE 80

# Run the application
CMD ["python", "run.py"]
