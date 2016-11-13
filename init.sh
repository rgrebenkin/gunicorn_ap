#!/bin/bash

#rm -r ~/web
mkdir -p ~/web/{etc,uploads,public/{img,js,css}}
cp nginx.conf ~/web/etc/nginx.conf
cp gunicorn.conf ~/web/etc/gunicorn.conf
sudo ln -sf ~/web/etc/nginx.conf /etc/nginx/sites-enabled/default
cp hello.py ~/web/hello.py
#sudo ln -sf hello.conf /etc/gunicorn.d/hello.conf
cd ~/web
#gunicorn -b 127.0.0.1:8080 hello:application &
#sudo gunicorn -c ~/web/etc/gunicorn.conf hello:app &
sudo gunicorn -c /home/box/web/etc/gunicorn.conf hello:app &
sudo /etc/init.d/nginx start