APPUSER=student
APPHOME=/home/$APPUSER
TOMCAT_VER="8.5.38"
TOMCAT_URL="https://archive.apache.org/dist/tomcat/tomcat-8/v$TOMCAT_VER/bin/apache-tomcat-$TOMCAT_VER.tar.gz"
TOMCAT_DIR=$APPHOME/apache-tomcat-$TOMCAT_VER
JDBC_CONN='<Resource name="jdbc/TestDB" auth="Container" type="javax.sql.DataSource" maxTotal="100" maxIdle="30"  maxWaitMillis="10000" username="USERNAME" password="PASSWORD" driverClassName="com.mysql.jdbc.Driver" url="jdbc:mysql://RDS-DB-ENDPOINT:3306/DATABASE"/>'

## Main Program
# ------------------------------------------------------------------
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

# ------------------------------------------------------------------

echo "INSTALL APP SERVER"
echo "Create APP User"
echo "Install Java"
yum install java -y
echo $?

echo "Download Tomcat"
cd $APPHOME
wget -qO- $TOMCAT_URL | tar -xz
echo $?
