source config
source perl_sandbox
#restart the server created with start_server
cd $PROJECT
start_server --pid-file=/var/www/it/maurorestaurant/test/strehler/src/starman.pid --status-file=/var/www/it/maurorestaurant/test/strehler/src/starman.status --restart

