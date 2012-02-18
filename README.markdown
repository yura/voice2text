voice2text
==========

Converts voice recordered from microphone to text using Google Voice API.

Dependencies
------------

Script requires:
 
* sox - for recording voice from command-line and save to wav file
* flac - for convertign recordered wav file to flac format
* curl - for sending HTTP requests with flac file to Google

    # Ubuntu
    $ sudo apt-get install sox flac curl

Running
-------

    ./english-voice2text

Press Ctrl+C to exit

Inspired by
-----------

http://ab-log.ru/smart-house/speech/speech-recognition


