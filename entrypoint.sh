#!/bin/bash
set -e

echo "Starting SSH..."

service ssh start

echo "Starting the application..."

# Optionally, any pre-run setup commands can go here

# Start the Node.js application
exec node app.js
