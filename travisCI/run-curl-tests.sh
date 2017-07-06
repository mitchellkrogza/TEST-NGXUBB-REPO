#!/bin/bash
# Curl Testing Script for Nginx Ultimate Bad Bot Blocker

# Set Location of our Curl Test Results Files

_curltest1=$TRAVIS_BUILD_DIR/travisCI/_curl_tests/curltest1.txt
_curltest2=$TRAVIS_BUILD_DIR/travisCI/_curl_tests/curltest2.txt
_curltest3=$TRAVIS_BUILD_DIR/travisCI/_curl_tests/curltest3.txt
_curltest4=$TRAVIS_BUILD_DIR/travisCI/_curl_tests/curltest4.txt
_curltest5=$TRAVIS_BUILD_DIR/travisCI/_curl_tests/curltest5.txt
_curltest6=$TRAVIS_BUILD_DIR/travisCI/_curl_tests/curltest6.txt


# Function Curl Test 1 - Check for Bad Bot "80legs"
run_curltest1 () {
truncate -s 0 $_curltest1
curl -A "80legs" http://localhost:9000/index.php 2> $_curltest1
if grep -i '(52)' $_curltest1; then
   echo 'BAD BOT DETECTED - TEST PASSED'
else
   echo 'BAD BOT NOT DETECTED - TEST FAILED'
   exit 1
fi
}

# Function Curl Test 2 - Check for Bad Bot "masscan"
run_curltest2 () {
truncate -s 0 $_curltest2
curl -A "masscan" http://localhost:9000/index.php 2> $_curltest2
if grep -i '(52)' $_curltest2; then
   echo 'BAD BOT DETECTED - TEST PASSED'
else
   echo 'BAD BOT NOT DETECTED - TEST FAILED'
   exit 1
fi
}

# Function Curl Test 3 - Check for Bad Referrer "100dollars-seo.com"
run_curltest3 () {
truncate -s 0 $_curltest3
curl -I http://localhost:9000/index.php -e http://100dollars-seo.com 2> $_curltest3
if grep -i '(52)' $_curltest3; then
   echo 'BAD REFERRER DETECTED - TEST PASSED'
else
   echo 'BAD REFERRER NOT DETECTED - TEST FAILED'
   exit 1
fi
}

# Function Curl Test 4 - Check for Bad Referrer "zx6.ru"
run_curltest4 () {
truncate -s 0 $_curltest4
curl -I http://localhost:9000/index.php -e http://zx6.ru >> $_curltest4
if grep -i '(52)' $_curltest4; then
   echo 'BAD REFERRER DETECTED - TEST PASSED'
else
   echo 'BAD REFERRER NOT DETECTED - TEST FAILED'
   #exit 1
fi
}

# Function Curl Test 5 - Check for Good Bot "GoogleBot"
run_curltest5 () {
truncate -s 0 $_curltest5
curl -A "GoogleBot" http://localhost:9000/index.php 2> $_curltest5
if grep -i 'Welcome' $_curltest5; then
   echo 'GOOD BOT ALLOWED THROUGH - TEST PASSED'
else
   echo 'GOOD BOT NOT ALLOWED THROUGH - TEST FAILED'
   #exit 1
fi
}


# Trigger our functions to run
run_curltest1
run_curltest2
run_curltest3
run_curltest4
run_curltest5

# If everything passed then we exit with 0
exit 0

#STATUSCODE2=$(curl -A "masscan" http://localhost:9000/index.php &> /dev/stderr --write-out "%{http_code}") | if test $STATUSCODE2 52; then printf '%s\n\n' "BAD BOT TEST PASSED"; exit 0; else printf '%s\n\n' "BAD BOT TEST FAILED"; exit 1; fi

#curltest2 () {
#truncate -s 0 /tmp/curltest2.txt
#curl -A "masscan" http://localhost:9000/index.php &> /tmp/curltest2.txt
#cat /tmp/curltest2.txt
#if grep -i '(52)' /tmp/curltest2.txt; then
#   echo 'BAD BOT DETECTED - TEST PASSED'
   #exit 0
#else
#   echo 'BAD BOT NOT DETECTED - TEST FAILED'
   #exit 1
#fi
#}

#STATUSCODE3=$(curl -I http://localhost:9000/index.php -e http://100dollars-seo.com &> /dev/stderr --write-out "%{http_code}") | if test $STATUSCODE3 52; then printf '%s\n\n' "BAD BOT TEST PASSED"; exit 0; else printf '%s\n\n' "BAD BOT TEST FAILED"; exit 1; fi

#curltest3 () {
#_test3=/tmp/curltest3.txt
#truncate -s 0 $_test3
#curl -I http://localhost:9000/index.php -e http://100dollars-seo.com &> $_test3
#if grep '(52)' $_test3; then
#   echo 'BAD BOT DETECTED - TEST PASSED'
#   exit 0
#else
#   echo 'BAD BOT NOT DETECTED - TEST FAILED'
#   exit 1
#fi
#}
#curltest1
#curltest2
#curltest3

#grep '(52)' /tmp/curltest1.txt
#grep '(52)' /tmp/curltest2.txt

#exit 0

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

#_test1=test1
#curl -A "masscan" http://localhost:9000/index.php &> $_test1
#if grep 'Welcome' $_test1; then
#   echo 'FAILED'
#else
#   echo 'PASSED'
#fi
#cat $_test1

#truncate -s 0 /tmp/curltest1.txt
#curl -A "masscan" http://localhost:9000/index.php &> /tmp/curltest1.txt
#if grep 'Welcome' /tmp/curltest1.txt; then
#   echo 'PASS'
#else
#   echo 'BAD BOT DETECTED'
#fi
#cat /tmp/curltest1.txt
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
