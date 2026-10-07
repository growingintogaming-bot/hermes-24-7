#!/bin/bash

# Setup Hermes Agent config directory
mkdir -p /root/.hermes

# Write Hermes config.yaml
cat << 'EOF' > /root/.hermes/config.yaml
model:
  provider: "custom"
  name: "gemini-3.8-flash"
  api_key: "${GEMINI_API_KEY}"
  base_url: "https://generativelanguage.googleapis.com/v1beta/openai"

gateway:
  platforms:
    telegram:
      bot_token: "${TELEGRAM_BOT_TOKEN}"
EOF

# Start Health-Check Web Server in background (keeps Render awake)
python3 server.py &

# Start Official Hermes Gateway (connects to Telegram)
echo "Starting Hermes Agent Telegram Gateway..."
hermes gateway
