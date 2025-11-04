#!/bin/bash
echo "Stopping old app (if running)..."
pkill -f "node index.js" || true
echo "Starting new app..."
nohup node index.js > app.log 2>&1 &
echo "✅ App restarted successfully."
