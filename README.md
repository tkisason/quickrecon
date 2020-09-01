# quickrecon
A set of scripts that enables you to do a quick recon check against a target.

useful in an semi-automatomated way to fire off and get at least some data before you start digging deeper. 

## howto

Build the dockerfile

docker build -t quickrecon . 

use the scripts:

./ip.sh 192.168.1.1

./url.sh https://example.com


scripts dump the output in the `pwd` 
