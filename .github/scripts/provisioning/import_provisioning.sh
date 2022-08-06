#!/bin/sh

#Decrypt the files
# --batch to prevent interactive command --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$PROVISIONING_PASSWORD" \
--output provisioning/AppStoreCertificates.p12 provisioning/AppStorecerficates.p12.gpg

gpg --quiet --batch --yes --decrypt --passphrase="$PROVISIONING_PASSWORD" \
--output provisioning/Jakob\ Skov\ Sondergard\ CV-AppStore-General-Notification.mobileprovision \
provisioning/Jakob\ Skov\ Sondergard\ CV-AppStore-General-Notification.mobileprovision.gpg

