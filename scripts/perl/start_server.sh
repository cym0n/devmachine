#Start a plackup with starman
start_server --pid-file=/var/www/it/maurorestaurant/test/strehler/src/starman.pid --status-file=/var/www/it/maurorestaurant/test/strehler/src/starman.status -- plackup -E production -s Starman --workers=2 -l /var/www/it/maurorestaurant/test/tmp/plack.sock -a bin/app.pl &
