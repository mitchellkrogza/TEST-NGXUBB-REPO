#!/bin/bash
# Curl Testing Script for Nginx Ultimate Bad Bot Blocker

#STATUSCODE1=$(curl -A "80legs" http://localhost:9000/index.php &> /dev/stderr --write-out "%{http_code}") | if test $STATUSCODE1 52; then printf '%s\n\n' "BAD BOT TEST PASSED"; exit 0; else printf '%s\n\n' "BAD BOT TEST FAILED"; exit 1; fi

#STATUSCODE2=$(curl -A "masscan" http://localhost:9000/index.php &> /dev/stderr --write-out "%{http_code}") | if test $STATUSCODE2 52; then printf '%s\n\n' "BAD BOT TEST PASSED"; exit 0; else printf '%s\n\n' "BAD BOT TEST FAILED"; exit 1; fi

#STATUSCODE3=$(curl -I http://localhost:9000/index.php -e http://100dollars-seo.com &> /dev/stderr --write-out "%{http_code}") | if test $STATUSCODE3 52; then printf '%s\n\n' "BAD BOT TEST PASSED"; exit 0; else printf '%s\n\n' "BAD BOT TEST FAILED"; exit 1; fi

#STATUSCODE4=$(curl -I http://localhost:9000/index.php -e http://zx6.ru &> /dev/stderr --write-out "%{http_code}") | if test $STATUSCODE4 52; then printf '%s\n\n' "BAD BOT TEST PASSED"; exit 0; else printf '%s\n\n' "BAD BOT TEST FAILED"; exit 1; fi

#STATUSCODE5=$(curl -A "GoogleBot" http://localhost:9000/index.php &> /dev/stderr --write-out "%{http_code}") | if test $STATUSCODE5 Welcome; then printf '%s\n\n' "GOOD BOT TEST PASSED"; exit 0; else printf '%s\n\n' "GOOD BOT TEST FAILED"; exit 1; fi

#STATUSCODE6=$(curl -A "BingBot" http://localhost:9000/index.php &> /dev/stderr --write-out "%{http_code}") | if test $STATUSCODE6 Welcome; then printf '%s\n\n' "GOOD BOT TEST PASSED"; exit 0; else printf '%s\n\n' "GOOD BOT TEST FAILED"; exit 1; fi

#STATUSCODE7=$(curl -A "BingBot" http://localhost:9000/index.php &> /dev/stderr --write-out "%{http_code}") | if test "$STATUSCODE7" -ge Welcome; then printf '%s\n\n' "GOOD BOT TEST PASSED"; exit 0; else if test "$STATUSCODE7" -le spurl; then printf '%s\n\n' "GOOD BOT TEST FAILED"; exit 1; fi

#funky () {
#STATUSCODE8=$(curl -A "masscan" http://localhost:9000/index.php &> /dev/stderr --write-out "%{http_code}")
#if test $STATUSCODE8 "Welcome"
#then
#printf '%s\n\n' "GOOD BOT TEST FAILED"
#exit 0
#else 
#printf '%s\n\n' "GOOD BOT TEST PASSED"
#exit 1
#fi
#}
#funky

#if [ $status_code -ne "200" ]
#_test1=/tmp/test1.db

#funky () {
#curl -A "masscan" http://localhost:9000/index.php > $_test1
#if grep -Fxq "Welcome" $_test1
#then
#    echo "FAILED"
#else
#    echo "PASSED"
#fi
#}

#funky


#OUTPUT=$(curl -A "masscan" http://localhost:9000/index.php &> /dev/stderr --write-out "%{http_code}")
#if echo "$OUTPUT" | grep -q "Welcome"; then
#    echo "FAILED"
#    else
#    echo "PASSED"
#fi

#if curl -A "masscan" http://localhost:9000/index.php &> /dev/stderr | grep -i "Welcome"; then
#   echo 'FAILED'
#else
#   echo 'PASSED'
#fi

_test1=test1
curl -A "masscan" http://localhost:9000/index.php &> $_test1
if grep 'Welcome' $_test1; then
   echo 'FAILED'
else
   echo 'PASSED'
fi
cat $_test1

#if prlctl list --info ubuntu-vm | grep -q "State: running"; then
#   echo 'machine is running'
#else
#   echo 'machine is not running'
#fi

#OUTPUT='blah blah (Status: 200)'
#if echo "$OUTPUT" | grep -q "(Status:\s200)"; then
#    echo "MATCH"
#fi



#while IFS= read -r LINE
#do
#printf '\t"~%s"\t\t%s\n' "${LINE}" "$_action1" >> "$_tmpnginx1"
#done < $_input1


#response=$(
#    curl YOUR_URL \
#        --write-out %{http_code} \
#        --silent \
#        --output /dev/null \
#)
#test "$response" -ge 200 && test "$response" -le 299

#exit 0
