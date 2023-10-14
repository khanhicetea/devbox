#!/bin/sh

sudo cp httpd-forwarding.sh /usr/local/bin/httpd-forwarding.sh
sudo cp httpd.forwarding /etc/pf.anchors/httpd.forwarding
sudo cp kit.dev.pfctl.plist /Library/LaunchDaemons/kit.dev.pfctl.plist

sudo /usr/local/bin/httpd-forwarding.sh

echo "\n"
echo "Setup DONE!"
echo "\n"