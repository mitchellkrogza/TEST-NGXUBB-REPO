#!/bin/bash
_myip=$(dig +short myip.opendns.com @resolver1.opendns.com)
sed -i -e 's/*:80/$_myip:80/g' $TRAVIS_BUILD_DIR/travisCI/default.vhost
exit 0
