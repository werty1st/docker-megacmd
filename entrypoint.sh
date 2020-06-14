#!/bin/bash

#eval login command

#echo "Login: $LOGIN"
#mega-login $LOGIN

echo "command: $@"
$@

echo "tail:"
tail -f /root/.megaCmd/megacmdserver.log >&0 2>1