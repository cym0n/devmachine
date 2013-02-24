PROJECT="testpy"
echo "CREATE USER '$PROJECT'@'localhost' IDENTIFIED BY '$PROJECT'" > query.sql
mysql -u root < query.sql
echo "CREATE DATABASE $PROJECT" > query.sql
mysql -u root < query.sql
echo "GRANT ALL ON $PROJECT.* TO $PROJECT; FLUSH PRIVILEGES" > query.sql
mysql -u root < query.sql
rm query.sql

