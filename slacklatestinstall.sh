#!/bin/bash
# From here: https://github.com/packetpilot/carry-ons/blob/master/Slack/postinstall


if [ -e /Applications/Slack.app ]
then
    echo "Slack already installed"
    exit 0
else

# Variables
VER=$(curl https://slack.com/downloads/mac | grep Version | cut -d ' ' -f 2 | cut -d '<' -f 1)
EXTURL=https://downloads.slack-edge.com/mac_releases/Slack-"${VER}"-macOS.zip
TMPDIR=/tmp/slack
ZIPLOC=${TMPDIR}/Slack.zip
#MODPATH=${3}/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/index.js

mkdir -p "${TMPDIR}"

curl -Lso \
  "${ZIPLOC}" "${EXTURL}"

unzip -o "${ZIPLOC}" -d "${3}"/Applications

rm -rf "${TMPDIR}"
fi