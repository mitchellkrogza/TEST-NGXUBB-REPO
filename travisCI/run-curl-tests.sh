#!/bin/bash
# Curl Testing Script for Nginx Ultimate Bad Bot Blocker

STATUSCODE1=$(curl -A "80legs" http://localhost:9000/index.php &> /dev/stderr --write-out "%{http_code}") | if test $STATUSCODE1 52; then printf '%s\n\n' "BAD BOT TEST PASSED"; exit 0; else printf '%s\n\n' "BAD BOT TEST FAILED"; exit 1; fi

STATUSCODE2=$(curl -A "masscan" http://localhost:9000/index.php &> /dev/stderr --write-out "%{http_code}") | if test $STATUSCODE2 52; then printf '%s\n\n' "BAD BOT TEST PASSED"; exit 0; else printf '%s\n\n' "BAD BOT TEST FAILED"; exit 1; fi

STATUSCODE3=$(curl -I http://localhost:9000/index.php -e http://100dollars-seo.com &> /dev/stderr --write-out "%{http_code}") | if test $STATUSCODE3 52; then printf '%s\n\n' "BAD BOT TEST PASSED"; exit 0; else printf '%s\n\n' "BAD BOT TEST FAILED"; exit 1; fi

STATUSCODE4=$(curl -I http://localhost:9000/index.php -e http://zx6.ru &> /dev/stderr --write-out "%{http_code}") | if test $STATUSCODE4 52; then printf '%s\n\n' "BAD BOT TEST PASSED"; exit 0; else printf '%s\n\n' "BAD BOT TEST FAILED"; exit 1; fi

STATUSCODE5=$(curl -A "GoogleBot" http://localhost:9000/index.php &> /dev/stderr --write-out "%{http_code}") | if test $STATUSCODE5 Welcome; then printf '%s\n\n' "GOOD BOT TEST PASSED"; exit 0; else printf '%s\n\n' "GOOD BOT TEST FAILED"; exit 1; fi

STATUSCODE6=$(curl -A "BingBot" http://localhost:9000/index.php &> /dev/stderr --write-out "%{http_code}") | if test $STATUSCODE6 Welcome; then printf '%s\n\n' "GOOD BOT TEST PASSED"; exit 0; else printf '%s\n\n' "GOOD BOT TEST FAILED"; exit 1; fi

STATUSCODE7=$(curl -A "BingBot" http://localhost:9000/index.php &> /dev/stderr --write-out "%{http_code}") | if test $STATUSCODE7 spurl; then printf '%s\n\n' "GOOD BOT TEST PASSED"; exit 0; else printf '%s\n\n' "GOOD BOT TEST FAILED"; exit 1; fi

exit 0
done
