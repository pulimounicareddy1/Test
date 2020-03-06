echo "INSTALL WEB SERVER"
echo "Install HTTPD"
yum install httpd -y
echo $?

echo "Update proxy config"
echo 'ProxyPass "/student" "http://localhost:8080/student"
ProxyPassReverse "/student"  "http://localhost:8080/student"' >/etc/httpd/conf.d/app-proxy.conf
echo $?

echo "Update Index file"
sudo curl -s https://s3-us-west-2.amazonaws.com/studentapi-cit/index.html -o /var/www/html/index.html
echo $?

echo "Start Web Service"
systemctl enable httpd
systemctl restart httpd
echo $?
