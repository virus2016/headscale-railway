#!/bin/bash

# Start HeadScale service in the background
headscale serve &

# Wait for HeadScale to be operational
while ! nc -z localhost 8080; do   
  sleep 1 # wait for 1 second before checking again
done

echo "HeadScale is up and running."

# Check for existing API keys
# if ! headscale apikeys list | grep -q "No API keys found"; then
    # echo "API keys already exist. No new key will be created."
# else
    # Create a new API key with 90 days expiration
headscale apikeys list
headscale apikeys create
echo "New API key created."
# fi

# Keep the container running
tail -f /dev/null