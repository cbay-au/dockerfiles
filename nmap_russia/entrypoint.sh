#!/bin/bash

# Start Nordpn background service
/etc/init.d/nordvpn start

while [ ! -S /run/nordvpn/nordvpnd.sock ]; do
    echo "Waiting for NordVPN to start..."
    sleep 2
done

echo "NordVPN started successfully."

# Initialize NordVPN with login credentials (replace 'your_username' and 'your_password')
nordvpn login --token e9f2abc22f84df7c3690a3c2d5a747d314d7ca22481f67a393d0c99263da397e

# Connect to a specific server or use auto connect
nordvpn connect

# Keep the container running
tail -f /dev/null
