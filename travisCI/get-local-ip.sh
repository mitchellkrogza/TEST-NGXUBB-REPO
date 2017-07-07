#!/bin/bash
_myip=$(dig +short myip.opendns.com @resolver1.opendns.com)
_file=$TRAVIS_BUILD_DIR/travisCI/default.vhost
sed -i -e "s/*:80/$_myip:80/g" "$_file"
exit 0
