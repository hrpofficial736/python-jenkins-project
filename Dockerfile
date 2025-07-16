# Use official Python image
FROM python:3.11-slim

# Set workdir inside the container
WORKDIR /app

# Copy dependency file and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of the app
COPY . .

# Expose port
EXPOSE 8000

# Run the FastAPI app using uvicorn
CMD ["fastapi", "dev", "main.py"]
