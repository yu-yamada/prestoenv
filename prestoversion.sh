#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0);pwd)

if [ ! -f $SCRIPT_DIR/prestoenv.conf];then
  echo "$SCRIPT_DIR/prestoenv.conf is not available" 
  exit 1
fi

 . $SCRIPT_DIR/prestoenv.conf

if [ -L $PRST_DIR ];then
  ls -l $PRST_DIR | awk '{print $NF}'
else
  echo "presto not installed"
  exit 1
fi

exit 0
