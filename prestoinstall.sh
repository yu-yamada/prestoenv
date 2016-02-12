#!/bin/sh

set -u

# chk args
if [ $# -ne 1 ];then
  echo "usage: ${0##*/} [presto-version]"
  exit 1
fi

PRST_VER=$1
PRST_URL="https://repo1.maven.org/maven2/com/facebook/presto/presto-server/${PRST_VER}/presto-server-${PRST_VER}.tar.gz"

# chk presto version and url.
hr=`curl -LI ${PRST_URL} -w '%{http_code}\n' -s -o /dev/null`
if [ "${hr}" = 404 ]; then
  echo "VERSION:${PRST_VER} [${PRST_URL}] is not available."
  exit 1
fi

SCRIPT_DIR=$(cd $(dirname $0);pwd)

if [ ! -f $SCRIPT_DIR/prestoenv.conf ];then
  echo "$SCRIPT_DIR/prestoenv.conf is not available" 
  exit 1
fi
. $SCRIPT_DIR/prestoenv.conf

if [ ! -d ${ETC_DIR} ];then
  echo "etc dir [${ETC_DIR}]  is not available."
  exit 1
fi


if [ ! -e $PRST_BASE_DIR ];then
  mkdir -p $PRST_BASE_DIR
fi

cd $PRST_BASE_DIR

if [ ! -f presto-server-${PRST_VER}.tar.gz ];then
  curl -k -O https://repo1.maven.org/maven2/com/facebook/presto/presto-server/${PRST_VER}/presto-server-${PRST_VER}.tar.gz
fi

tar zxvf presto-server-${PRST_VER}.tar.gz


if [ -e ${PRST_DIR} ];then
  if [ -L ${PRST_DIR} ];then
    rm  ${PRST_DIR} 
  else
    echo "${PRST_DIR} is not link. Please remove this dir or file."
    exit 1
  fi
fi

ln -s presto-server-${PRST_VER} presto

mkdir -p presto/etc

cp -r ${ETC_DIR}/* ${PRST_DIR}/etc/

# install cli
curl -k -O https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/${PRST_VER}/presto-cli-${PRST_VER}-executable.jar

mv presto-cli-${PRST_VER}-executable.jar ${PRST_DIR/bin/presto
chmod +x ${PRST_DIR/bin/presto

exit 0
