#!/bin/bash
# entrypoint for the container
set -e

# verify these exist 
mkdir -p /data/logs
touch /data/query_ip_blacklist.txt
touch /data/query_ip_whitelist.txt
touch /data/ts3server.sqlitedb