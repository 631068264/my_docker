#!/bin/bash
# For Mac OS X

PKG_URL='https://www.python.org/ftp/python/3.5.2/Python-3.5.2rc1.tgz'
OPENSSL_LOCATION="/usr/local/openssl"
PYTHON3_LOCATION='/usr/local/python3'

#---------------------------------------------------------------------
EXEC_COMMAND=$PYTHON3_LOCATION/bin/python3.5
PKG_NAME='Python-3.5.tar.gz'
EXEC_LINK='/usr/local/bin/python3'
TEMP_DIR="temp-$PKG_NAME/"

mkdir -p $TEMP_DIR
cd $TEMP_DIR
sudo rm -r $PYTHON3_LOCATION

curl -o $PKG_NAME $PKG_URL
tar zxvf $PKG_NAME --strip-components 1

./configure --without-gcc CFLAGS="-I$OPENSSL_LOCATION/include" LDFLAGS="-L$OPENSSL_LOCATION/lib" --prefix=$PYTHON3_LOCATION
make && sudo make install

sudo ln -s $EXEC_COMMAND $EXEC_LINK

