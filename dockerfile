# Use a lightweight image
FROM python:3.9-slim

# Set environment variables to prevent Python from writing .pyc files to disc and buffer I/O
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/
COPY app.py /app/
COPY templates /app/templates/
COPY static /app/static/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000 for the Flask app
EXPOSE 5000

# Run the command to start the Flask app
CMD ["python", "app.py"]