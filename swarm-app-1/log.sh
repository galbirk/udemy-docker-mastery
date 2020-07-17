#! /bin/bash
HISTFILE=~/.bash_history
set -o history
#while [[ 1 -eq 1 ]];
#do
output=`history 2 | awk 'NR==1{print $0}'`
echo $output
#if [[ $output == *"docker"* ]];
#then
#echo $output >> ./mylog
#fi
#sleep 3
#done
