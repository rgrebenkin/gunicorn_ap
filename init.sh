#!/bin/bash

mkdir -p ~/web/{etc,uploads,public/{img,js,css},app}/
cp nginx.conf ~/web/etc/nginx.conf
sudo ln -sf ~/web/etc/nginx.conf /etc/nginx/sites-enabled/default.conf
cp hello.py ~/web/app/hello.py
cd ~/web/app
gunicorn -b 127.0.0.1:8080 wsgi:application &
sudo /etc/init.d/nginx start