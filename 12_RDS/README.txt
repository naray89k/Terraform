
terraform apply -var RDS_PASSWORD="**********"


Login to EC2 Instance:
  sudo apt-get install mysql-client

  instance = 13.127.197.26
  rds = mariadb.cwvz2elwoscm.ap-south-1.rds.amazonaws.com:3306

Login to MYSQL:
  mysql -u root -h "mariadb.cwvz2elwoscm.ap-south-1.rds.amazonaws.com"  -p "mypassword"
