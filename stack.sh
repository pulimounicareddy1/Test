APPUSER=Student
APPHOME=/home/$APPUSER
TOMCAT_VER="8.5.38"
TOMCAT_URL="https://archive.apache.org/dist/tomcat/tomcat-8/v$TOMCAT_VER/bin/apache-tomcat-$TOMCAT_VER.tar.gz"
TOMCAT_DIR=$APPHOME/apache-tomcat-$TOMCAT-VER
JDBC_CONN='Resource name="jdbc/TestDB" auth="Container" type="javax.sql.DataSource"
               maxTotal="100" maxIdle="30" maxWaitMillis="10000"
               username="USERNAME" password="PASSWORD" driverClassName="com.mysql.jdbc.Driver"
               url="jdbc:mysql://DB-ENDPOINT:3306/DATABASE"/>'


#####MAINpROGRAM#######
echo "Install web server"
print "Install Httpd"
yum install httpd -y
echo $?

print "update proxy configuration"
echo 'ProxyPass "/student" "http://localhost:8080/student"
ProxyPassReverse "/student"  "http://localhost:8080/student"' > /etc/httpd/conf.d/app-proxy.conf

print "Update Index file"
sudo curl -s https://s3-us-west-2.amazonaws.com/studentapi-cit/index.html -o /var/www/html/index.html

print "start Web Service"
sudo systemctl enable httpd 
sudo systemctl restart httpd 

#####Tomcat Installation#######
echo "Install java"
yum install java -y

echo " Download Tomcat"
cd $APPHOME
wget -q0- $TOMCAT_URL | tar -xvz $TOMCAT_VER.tar.gz
echo $?
echo "Download StudentApp"
wget https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war -O $TOMCAT_DIR/webapps/student.war
echo $?












