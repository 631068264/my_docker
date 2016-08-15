#!/bin/bash
# For ubuntu14.04

PKG_URL='https://nginx.org/download/nginx-1.10.1.tar.gz'
OPENSSL_URL='https://www.openssl.org/source/openssl-1.0.2h.tar.gz'
PCRE_URL='ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.39.tar.gz'
ZLIB='http://zlib.net/zlib-1.2.8.tar.gz'

EXEC='nginx'

#---------------------------------------------------------------------
INSTALL_LOCATION="/usr/local/$EXEC"
EXEC_COMMAND=$INSTALL_LOCATION/sbin/$EXEC
PKG_NAME='XXX.tar.gz'
EXEC_LINK="/usr/local/bin/$EXEC"
TEMP_DIR="`pwd`/temp-XX/"

mkdir -p $TEMP_DIR
cd $TEMP_DIR
sudo rm -r $INSTALL_LOCATION

curl -o $PKG_NAME $PKG_URL
tar zxvf $PKG_NAME --strip-components 1

mkdir openssl_new/
cd openssl_new/
curl -o $PKG_NAME $OPENSSL_URL
tar zxvf $PKG_NAME --strip-components 1
cd $TEMP_DIR

mkdir pcre_new/
cd pcre_new/
curl -o $PKG_NAME $PCRE_URL
tar zxvf $PKG_NAME --strip-components 1
cd $TEMP_DIR

mkdir zlib_new/
cd zlib_new/
curl -o $PKG_NAME $ZLIB
tar zxvf $PKG_NAME --strip-components 1
cd $TEMP_DIR

./configure --prefix=$INSTALL_LOCATION \
--with-http_ssl_module \
--with-openssl=`pwd`/openssl_new \
--with-pcre=`pwd`/pcre_new \
--with-zlib=`pwd`/zlib_new \
--with-threads \
--with-file-aio \
--with-http_ssl_module \
--with-http_gzip_static_module \
--with-http_stub_status_module \
--with-http_realip_module \
--with-http_v2_module


make && sudo make install

sudo rm $EXEC_LINK
sudo ln -s $EXEC_COMMAND $EXEC_LINK
rm -r $TEMP_DIR
