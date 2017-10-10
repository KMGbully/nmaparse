#!/bin/bash
#  Bash script for creating input lists
#  Usage:   ./nmaparse.sh /path/to/gnmap_file
#
clear
# Checks for root
if [ "$(whoami)" != "root" ]; then
echo "Please run as root"
exit 0
fi
# Check for nmap file
if [[ -z "$1" ]]; then
echo "Usage:   ./nmaparse.sh /path/to/gnmap_file"
exit 0
else
#Create places to login input lists
mkdir input_lists
cat $1 | grep 21 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/21.il
cat $1 | grep 22 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/22.il
cat $1 | grep 23 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/23.il
cat $1 | grep 25 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/25.il
cat $1 | grep 53 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/53.il
cat $1 | grep 445 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/445.il
cat $1 | grep 1434 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/1434.il
cat $1 | grep 1521 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/1521.il
cat $1 | grep 3306 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/3306.il
cat $1 | grep 3389 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/3389.il
cat $1 | grep 5432 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/5432.il
cat $1 | grep 5900 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/5900.il
cat $1 | grep 6000 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/6000.il
# Create web server input lists
cat $1 | grep 80 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/80.il
cat $1 | grep 443 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/443.il
cat $1 | grep 8000 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/8000.il
cat $1 | grep 8080 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/8080.il
cat $1 | grep 8081 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/8081.il
cat $1 | grep 8443 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/8443.il
cat $1 | grep 8843 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/8843.il
cat $1 | grep 8834 | grep Host | awk '{print $2}' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | tee -a input_lists/8834.il
fi
#Cleanup empty files
cd input_lists
z=$(pwd)
for i in $(ls); do
if [[ -s "$i" ]]; then
echo $i file created at $z
else
rm -rf $i
fi
done
exit 0
