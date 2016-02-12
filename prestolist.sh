#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0);pwd)
 . $SCRIPT_DIR/prestoenv.conf

curl -k -s https://repo1.maven.org/maven2/com/facebook/presto/presto-server/ | sed -e "s/<a href=\"\([0-9.]*\)\/.*/\1/g" |grep -e"^[0-9]"


