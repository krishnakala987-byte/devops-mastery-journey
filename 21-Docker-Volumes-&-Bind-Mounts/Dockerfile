# Use official lightweight Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy dependencies file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app.py .

# Create directory for volume (best practice)
RUN mkdir -p /app/data

# Expose volume path (optional but good practice)
VOLUME ["/app/data"]

# Run application
CMD ["python3", "app.py"]
