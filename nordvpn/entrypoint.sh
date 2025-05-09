#!/bin/bash

# Source .env file
. .env

cat <<"EOF" >>.bashrc

    alias vpns='nordvpn status'
    alias vpnset='nordvpn settings'
    alias vpnc='nordvpn connect Sweden'
    alias vpndc='nordvpn connect Double_VPN'
    alias vpno='s obfuscate on'
    alias vpnuk='nordvpn c 2195'
    alias vpnhk='nordvpn connect Hong_Kong'

EOF

. .bashrc

echo "
Will now automatically double connect
     "

# Login to NordVPN using the token

nordvpn login --token $NORDVPN_TOKEN
sleep 8
nordvpn connect Double_VPN

echo "
The following alias can be used:-
    alias vpns='nordvpn status'
    alias vpnset='nordvpn settings'
    alias vpnc='nordvpn connect Sweden'
    alias vpndc='nordvpn connect Double_VPN'
    alias vpno='s obfuscate on'
    alias vpnuk='nordvpn c 2195'
    alias vpnhk='nordvpn connect Hong_Kong'
     "



# Start an interactive bash session or any other command you need
#exec /bin/bash

