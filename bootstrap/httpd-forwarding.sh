#!/bin/bash

/bin/sleep 5
/usr/sbin/ipconfig waitall
/sbin/pfctl -E -f /etc/pf.anchors/httpd.forwarding