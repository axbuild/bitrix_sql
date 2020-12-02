#!/bin/bash
#get connection status
mysqladmin -uroot -ppass extended-status | grep Threads

#How to Check Apache Concurrent Connections in Linux Using netstat and ss Command
ss -ant | grep :80 | wc -l
netstat -ant | grep :80 | wc -l
ss -ant | grep :80
netstat -ant | grep :80
netstat -ant | awk '{print $5}' | cut -d":" -f1 | sort | uniq -c | sort -nr
ss -at | awk '{print $5}' | cut -d":" -f1 | sort | uniq -c | sort -nr
ss -at | grep ESTAB | awk '{print $5}' | cut -d":" -f1 | sort | uniq -c | sort -n
netstat -ant | grep ESTAB | awk '{print $5}' | cut -d":" -f1 | sort | uniq -c | sort -n
ps -auxw | grep httpd | grep -v grep | wc -l
ps auxw | grep httpd | grep -v grep

#set optimal connections
#set global max_connections = 200;

#Use ApacheTop
yum install epel-release
yum install apachetop
apachetop -H 100
apachetop -T 60


#stress testing
#https://docs.locust.io/en/stable/what-is-locust.html
yum install python36
yum install pip3
sudo yum install python36u-devel