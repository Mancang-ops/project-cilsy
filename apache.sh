#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2 php php-mysql
sudo apt-get update && apt-get install awscli -y
sudo apt-get install automake autotools-dev fuse g++ git libcurl4-gnutls-dev libfuse-dev libssl-dev libxml2-dev make pkg-config
git clone https://github.com/s3fs-fuse/s3fs-fuse.git
cd s3fs-fuse
./autogen.sh
./configure
make
sudo make install
which s3fs
echo AKIA3DEL7O6I77BGIBXI:rRmAdeWYiGu/Pg+xfpU9nXgXuOxiv6k/Lzu4eSIq > /home/ubuntu/.passwd-s3fs
chmod 600 /home/ubuntu/.passwd-s3fs
sudo rm -r /var/www/html/*
sudo s3fs rudi17 /var/www/html -o passwd_file=/home/ubuntu/.passwd-s3fs -o url=https://s3-ap-southeast-1.amazonaws.com -ouid=1001,gid=1001,allow_other

