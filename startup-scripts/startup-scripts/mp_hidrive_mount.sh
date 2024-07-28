#!/bin/bash

# Lese Anmeldeinformationen aus der Datei
CREDENTIALS_FILE="/home/niko/.mp_hidrive_credentials"
if [ ! -f "$CREDENTIALS_FILE" ]; then
    echo "Anmeldeinformationen-Datei $CREDENTIALS_FILE nicht gefunden!"
    exit 1
fi

USERNAME=$(grep 'username' $CREDENTIALS_FILE | cut -d '=' -f2)
PASSWORD=$(grep 'password' $CREDENTIALS_FILE | cut -d '=' -f2)

# Überprüfen, ob bereits gemountet
MOUNT_POINT=$(gio mount -l | grep -o "davs://$USERNAME@webdav.hidrive.ionos.com")

if [ -z "$MOUNT_POINT" ]; then
    # Mount-Befehl mit Anmeldeinformationen
    echo $PASSWORD | gio mount davs://$USERNAME@webdav.hidrive.ionos.com

    if [ $? -eq 0 ]; then
        echo "Mount erfolgreich"
    else
        echo "Mount fehlgeschlagen"
        exit 1
    fi
else
    echo "Bereits gemountet"
fi

