#!/bin/bash

# Function to check and create API keys
function manage_api_keys {
    # Wait for HeadScale to be operational
    while ! curl -s http://localhost:8080 > /dev/null; do
        sleep 1 # wait for 1 second before checking again
    done

    # Check for existing API keys
    if headscale apikeys list | grep -q "ID \| Prefix \| Expiration \| Created"; then
        echo "API keys already exist. No new key will be created."
    else
        # Create a new API key with 90 days expiration
        new_key=$(headscale apikeys create)
        echo "New API key created: $new_key"
        # Optionally, save the new key to a file
        # echo "$new_key" > /path/to/apikey.txt
        # echo "New API key saved to /path/to/apikey.txt."
    fi
}

# Start the HeadScale service in the foreground
echo "Starting HeadScale service..."
headscale serve &

# Manage API keys in the background
manage_api_keys &

# Bring HeadScale serve back into the foreground
wait %1