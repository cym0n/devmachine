source config
source perl_sandbox
cd $PROJECT
#Start a plackup with starman
start_server --pid-file=$WORKINGDIR/tmp/starman.pid --status-file=$WORKINGDIR/tmp/starman.status -- plackup -E production -s Starman --workers=2 -l $WORKINGDIR/tmp/plack.sock -a bin/app.pl &
