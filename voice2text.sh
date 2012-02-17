#!/bin/bash

# Скрипт преобразует звук записанный с микрофона в текст
#
# Зависимости:
# 
#  # apt-get install curl sox flac
#
# Использование:
#   
# 
# Источник: http://ab-log.ru/smart-house/speech/speech-recognition
# Допилы:   yury.kotlyarov@gmail.com

while [ true ]; do
  echo "Recording..."
  rec -q -c 1 -r 16k commands.wav silence 1 0.3 4% 1 0.3 4%
  echo "Recognition..."
  flac -f -s commands.wav -o commands.flac
  curl -s -H "Content-Type: audio/x-flac; rate=16000" --data-binary @commands.flac "https://www.google.com/speech-api/v1/recognize?xjerr=1&client=chromium&lang=ru-RU" | grep -Po '(?<="utterance":")[^"]+(?=",)'
done

