#!/bin/bash

LANG=$1

if [ -z $LANG ]; then
  LANG='en-US'
fi

GOOGLE_API_URL="https://www.google.com/speech-api/v1/recognize?xjerr=1&client=chromium&lang=$LANG"


echo "Language: $LANG"

while [ true ]; do
  echo "Recording..."
  rec -q -c 1 -r 16k commands.wav silence 1 0.3 4% 1 0.3 4%
  echo "Recognition..."
  flac -f -s commands.wav -o commands.flac
  curl -s -H "Content-Type: audio/x-flac; rate=16000" --data-binary @commands.flac $GOOGLE_API_URL | grep -Po '(?<="utterance":")[^"]+(?=",)'
done

