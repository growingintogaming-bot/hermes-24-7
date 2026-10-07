FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl git ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Install Hermes Agent and web server
RUN pip install --no-cache-dir hermes-agent fastapi uvicorn requests

WORKDIR /app

# Copy project files
COPY . .

RUN chmod +x start.sh

# Expose Render default port
EXPOSE 10000

CMD ["./start.sh"]
