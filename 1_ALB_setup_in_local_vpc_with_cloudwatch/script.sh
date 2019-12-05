#!/bin/bash

yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
systemctl stop httpd.service
sleep 60
# echo "Hello World from $(hostname -f)" > /var/www/html/index.html
exec 1>sample.html
exec 2>&1
echo '<!doctype html>'
echo '<html lang="en">'
echo '  <head>'
echo '      <meta charset="utf-8">'
echo '      <title>Your Apache Webserver Worked</title>'
echo '  </head>'
echo '  <body>'
echo '      <h1>Hello, Narayanan from <font color="#d92bd4">HOSTNAME</font></h1>'
echo '  </body>'
echo '</html>'
sed -i "s/HOSTNAME/$(hostname -f)/" sample.html
mv sample.html /var/www/html/index.html
systemctl start httpd.service
