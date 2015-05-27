PROJECT=$1
echo "CREATE USER '$PROJECT'@'%' IDENTIFIED BY '$PROJECT'" > query.sql
mysql -u root -p < query.sql
echo "CREATE USER '$PROJECT'@'localhost' IDENTIFIED BY '$PROJECT'" > query.sql
mysql -u root -p  < query.sql
echo "CREATE DATABASE $PROJECT" > query.sql
mysql -u root -p < query.sql
echo "GRANT ALL ON $PROJECT.* TO $PROJECT; FLUSH PRIVILEGES" > query.sql
mysql -u root -p < query.sql
rm query.sql

