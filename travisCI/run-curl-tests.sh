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
curl -A "80legs" http://localhost/ 2> $_curltest1
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
curl -A "masscan" http://localhost/ 2> $_curltest2
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
curl -I http://localhost/ -e http://100dollars-seo.com 2> $_curltest3
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
curl -I http://localhost/ -e http://zx6.ru 2> $_curltest4
if grep -i '(52)' $_curltest4; then
   echo 'BAD REFERRER DETECTED - TEST PASSED'
else
   echo 'BAD REFERRER NOT DETECTED - TEST FAILED'
   exit 1
fi
}

# Function Curl Test 5 - Check for Good Bot "GoogleBot"
run_curltest5 () {
truncate -s 0 $_curltest5
curl -v -A "GoogleBot" http://localhost/ 2>&1 >> $_curltest5
if grep -i 'Welcome' $_curltest5; then
   echo 'GOOD BOT ALLOWED THROUGH - TEST PASSED'
else
   echo 'GOOD BOT NOT ALLOWED THROUGH - TEST FAILED'
   exit 1
fi
}

# Function Curl Test 6 - Check for Good Bot "BingBot"
run_curltest6 () {
truncate -s 0 $_curltest6
curl -v -A "BingBot" http://localhost/ 2>&1 >> $_curltest6
if grep -i 'Welcome' $_curltest6; then
   echo 'GOOD BOT ALLOWED THROUGH - TEST PASSED'
else
   echo 'GOOD BOT NOT ALLOWED THROUGH - TEST FAILED'
   exit 1
fi
}


# Trigger our functions to run
run_curltest1
run_curltest2
run_curltest3
run_curltest4
run_curltest5
run_curltest6

# If everything passed then we exit with 0
exit 0

